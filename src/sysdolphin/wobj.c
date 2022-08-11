#include <sysdolphin/wobj.h>
#include <sysdolphin/jobj.h>
#include <sysdolphin/robj.h>

void WObjInfoInit(void);

HSD_WObjInfo lbl_805041C8 = { WObjInfoInit };

static HSD_WObjInfo* lbl_805DE2E0;

extern HSD_ClassInfo objInfo;

void HSD_WObjRemoveAnim(HSD_WObj* wobj)
{
    if (wobj != NULL) {
        HSD_AObjRemove(wobj->aobj);
        wobj->aobj = NULL;
        HSD_RObjRemoveAnimAll(wobj->robj);
    }
}

void HSD_WObjReqAnim(HSD_WObj* wobj, f32 frame)
{
    if (wobj != NULL) {
        HSD_AObjReqAnim(wobj->aobj, frame);
        HSD_RObjReqAnimAll(wobj->robj, frame);
    }
}

void HSD_WObjAddAnim(HSD_WObj* wobj, HSD_WObjAnim* anim)
{
    if (wobj != NULL && anim != NULL) {
        if (wobj->aobj != NULL) {
            HSD_AObjRemove(wobj->aobj);
        }
        wobj->aobj = HSD_AObjLoadDesc(anim->aobjdesc);
        HSD_RObjAddAnimAll(wobj->robj, anim->robjanim);
    }
}

void WObjUpdateFunc(void* obj, u32 type, f32* fval)
{
    HSD_WObj* wobj;
    Vec p;
    HSD_JObj* jp;

    wobj = obj;
    if (wobj != NULL) {
        switch (type) {
        case 4:
            if (*fval < 0.0) {
                *fval = 0.0;
            }
            if (1.0 < *fval) {
                *fval = 1.0;
            }

            assert_line(152, wobj->aobj);
            jp = (HSD_JObj*)wobj->aobj->hsd_obj;
            assert_line(154, jp);
            assert_line(155, jp->u.spline);

            splArcLengthPoint(&p, jp->u.spline, *fval);
            HSD_WObjSetPosition(wobj, &p);
            wobj->flags |= 1;
            break;

        case 5:
            HSD_WObjSetPositionX(wobj, *fval);
            break;

        case 6:
            HSD_WObjSetPositionY(wobj, *fval);
            break;

        case 7:
            HSD_WObjSetPositionZ(wobj, *fval);
            break;
        }
    }
}

#pragma push
void HSD_RObjAnimAll();
asm void HSD_WObjInterpretAnim()
{
    nofralloc
/* 8041A9F0 004177F0  94 21 FF F0 */    stwu r1, -0x10(r1)
/* 8041A9F4 004177F4  7C 08 02 A6 */    mflr r0
/* 8041A9F8 004177F8  90 01 00 14 */    stw r0, 0x14(r1)
/* 8041A9FC 004177FC  93 E1 00 0C */    stw r31, 0xc(r1)
/* 8041AA00 00417800  7C 7F 1B 79 */    or. r31, r3, r3
/* 8041AA04 00417804  41 82 00 20 */    beq lbl_8041AA24
/* 8041AA08 00417808  80 BF 00 00 */    lwz r5, 0(r31)
/* 8041AA0C 0041780C  7F E4 FB 78 */    mr r4, r31
/* 8041AA10 00417810  80 7F 00 18 */    lwz r3, 0x18(r31)
/* 8041AA14 00417814  80 A5 00 40 */    lwz r5, 0x40(r5)
/* 8041AA18 00417818  4B FE 08 ED */    bl HSD_AObjInterpretAnim
/* 8041AA1C 0041781C  80 7F 00 1C */    lwz r3, 0x1c(r31)
/* 8041AA20 00417820  4B FF DA 7D */    bl HSD_RObjAnimAll
lbl_8041AA24:
/* 8041AA24 00417824  80 01 00 14 */    lwz r0, 0x14(r1)
/* 8041AA28 00417828  83 E1 00 0C */    lwz r31, 0xc(r1)
/* 8041AA2C 0041782C  7C 08 03 A6 */    mtlr r0
/* 8041AA30 00417830  38 21 00 10 */    addi r1, r1, 0x10
/* 8041AA34 00417834  4E 80 00 20 */    blr
}
#pragma pop

int WObjLoad(HSD_WObj* wobj, HSD_WObjDesc* desc)
{
    HSD_WObjSetPosition(wobj, &desc->pos);
    if (wobj->robj != NULL) {
        HSD_RObjRemoveAll(wobj->robj);
    }
    wobj->robj = HSD_RObjLoadDesc(desc->robjdesc);
    HSD_RObjResolveRefsAll(wobj->robj, desc->robjdesc);
    return 0;
}

void HSD_WObjInit(HSD_WObj* wobj, HSD_WObjDesc* desc)
{
    if (wobj == NULL || desc == NULL) {
        return;
    }

    HSD_WObjSetPosition(wobj, &desc->pos);
    if (wobj->robj != NULL) {
        HSD_RObjRemoveAll(wobj->robj);
    }
    wobj->robj = HSD_RObjLoadDesc(desc->robjdesc);
    HSD_RObjResolveRefsAll(wobj->robj, desc->robjdesc);
}

void* hsdNew();

HSD_WObj* HSD_WObjLoadDesc(HSD_WObjDesc* desc)
{
    if (desc != NULL) {
        HSD_WObj* wobj;
        HSD_ClassInfo* info;
        if (desc->class_name == NULL || !(info = hsdSearchClassInfo(desc->class_name))) {
            wobj = HSD_WObjAlloc();
        } else {
            wobj = hsdNew(info);
            assert_line(260, wobj);
        }
        HSD_WOBJ_METHOD(wobj)->load(wobj, desc);
        return wobj;
    }
    return NULL;
}

void HSD_WObjSetPosition(HSD_WObj* wobj, Vec* pos)
{
    if (wobj == NULL || pos == NULL) {
        return;
    }

    wobj->pos = *pos;
    wobj->flags |= 0x2;
    wobj->flags &= 0xFFFFFFFE;
}

void HSD_WObjSetPositionX(HSD_WObj* wobj, f32 val)
{
    HSD_JObj* jp;

    if (wobj != NULL) {
        if ((wobj->flags & 1) != 0) {
            if (wobj->aobj != NULL && wobj->aobj->hsd_obj != NULL) {
                jp = (HSD_JObj*) wobj->aobj->hsd_obj;
                HSD_JObjSetupMatrix((HSD_JObj*) wobj->aobj->hsd_obj);
                func_803D1DEC(jp->mtx, &wobj->pos, &wobj->pos);
            }
            wobj->flags &= 0xFFFFFFFE;
        }
        wobj->pos.x = val;
        wobj->flags |= 0x2;
    }
}

void HSD_WObjSetPositionY(HSD_WObj* wobj, f32 val)
{
    HSD_JObj* jp;

    if (wobj != NULL) {
        if ((wobj->flags & 1) != 0) {
            if (wobj->aobj != NULL && wobj->aobj->hsd_obj != NULL) {
                jp = (HSD_JObj*) wobj->aobj->hsd_obj;
                HSD_JObjSetupMatrix((HSD_JObj*) wobj->aobj->hsd_obj);
                func_803D1DEC(jp->mtx, &wobj->pos, &wobj->pos);
            }
            wobj->flags &= 0xFFFFFFFE;
        }
        wobj->pos.y = val;
        wobj->flags |= 0x2;
    }
}

void HSD_WObjSetPositionZ(HSD_WObj* wobj, f32 val)
{
    HSD_JObj* jp;

    if (wobj != NULL) {
        if ((wobj->flags & 1) != 0) {
            if (wobj->aobj != NULL && wobj->aobj->hsd_obj != NULL) {
                jp = (HSD_JObj*) wobj->aobj->hsd_obj;
                HSD_JObjSetupMatrix((HSD_JObj*) wobj->aobj->hsd_obj);
                func_803D1DEC(jp->mtx, &wobj->pos, &wobj->pos);
            }
            wobj->flags &= 0xFFFFFFFE;
        }
        wobj->pos.z = val;
        wobj->flags |= 0x2;
    }
}

void HSD_WObjGetPosition(HSD_WObj* wobj, Vec* vec)
{
    HSD_JObj* jp;

    if (wobj == NULL || vec == NULL) {
        return;
    }
    if ((wobj->flags & 1) != 0) {
        if (wobj->aobj != NULL && wobj->aobj->hsd_obj != NULL) {
            jp = (HSD_JObj*)wobj->aobj->hsd_obj;
            HSD_JObjSetupMatrix((HSD_JObj*)wobj->aobj->hsd_obj);
            func_803D1DEC(jp->mtx, &wobj->pos, &wobj->pos);
        }
        wobj->flags &= 0xFFFFFFFE;
    }
    *vec = wobj->pos;
}

HSD_WObj* HSD_WObjAlloc(void)
{
    HSD_WObj* wobj = hsdNew((HSD_ClassInfo*) (lbl_805DE2E0 ? lbl_805DE2E0 : &lbl_805041C8));
    assert_line(599, wobj);
    return wobj;
}

void WObjRelease(HSD_Class* o)
{
    HSD_WObj* wobj = (HSD_WObj*) o;
    HSD_RObjRemoveAll(wobj->robj);
    HSD_AObjRemove(wobj->aobj);
    HSD_OBJECT_PARENT_INFO(&lbl_805041C8)->release(o);
}

void WObjAmnesia(HSD_ClassInfo* info)
{
    if (info == HSD_CLASS_INFO(lbl_805DE2E0)) {
        lbl_805DE2E0 = NULL;
    }
    HSD_OBJECT_PARENT_INFO(&lbl_805041C8)->amnesia(info);
}

#pragma push
#pragma force_active on
static char unused[] = "hsdIsDescendantOf(info, &hsdWObj)";
#pragma pop

void WObjInfoInit(void)
{
    hsdInitClassInfo(HSD_CLASS_INFO(&lbl_805041C8), &objInfo,
        "sysdolphin_base_library", "had_wobj",
        sizeof(HSD_WObjInfo), sizeof(HSD_WObj));
    HSD_CLASS_INFO(&lbl_805041C8)->release = WObjRelease;
    HSD_CLASS_INFO(&lbl_805041C8)->amnesia = WObjAmnesia;
    lbl_805041C8.load = &WObjLoad;
    lbl_805041C8.update = &WObjUpdateFunc;
}
