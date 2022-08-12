#include "dobj.h"

extern HSD_DObj* current_dobj;
extern HSD_ClassInfo hsdClass;

void DObjInfoInit(void);

HSD_DObjInfo hsdDObj = { DObjInfoInit };

void HSD_DObjSetCurrent(HSD_DObj* dobj)
{
    current_dobj = dobj;
    return;
}

u32 HSD_DObjGetFlags(HSD_DObj* dobj)
{
    if (dobj != NULL) {
        return dobj->flags;
    }
    return 0;
}

void HSD_DObjSetFlags(HSD_DObj* dobj, u32 flags)
{
    if (dobj != NULL) {
        dobj->flags |= flags;
    }
}

void HSD_DObjClearFlags(HSD_DObj* dobj, u32 flags)
{
    if (dobj != NULL) {
        dobj->flags &= ~flags;
    }
}

void HSD_DObjRemoveAnimByFlags(HSD_DObj* dobj, u32 flags)
{
    if (dobj == NULL)
        return;

    if ((flags & 2) != 0) {
        HSD_AObjRemove(dobj->aobj);
        dobj->aobj = NULL;
    }
    HSD_PObjRemoveAnimAllByFlags(dobj->pobj, flags);
    HSD_MObjRemoveAnimByFlags(dobj->mobj, flags);
}

void HSD_DObjRemoveAnimAllByFlags(HSD_DObj* dobj, u32 flags)
{
    HSD_DObj* dp;

    if (dobj == NULL)
        return;

    for (dp = dobj; dp != NULL; dp = dp->next) {
        HSD_DObjRemoveAnimByFlags(dp, flags);
    }
}

void HSD_DObjAddAnim(HSD_DObj* dobj, HSD_MatAnim* mat_anim, HSD_ShapeAnimDObj* sh_anim)
{
    HSD_ShapeAnim* shapeanim;

    if (dobj == NULL)
        return;

    if (sh_anim != NULL) {
        shapeanim = sh_anim->shapeanim;
    } else{
        shapeanim = NULL;
    }

    HSD_PObjRemoveAnimAll(dobj->pobj, shapeanim);
    HSD_MObjAddAnim(dobj->mobj, mat_anim);
}

void HSD_DObjAddAnimAll(HSD_DObj* dobj, HSD_MatAnim* matanim, HSD_ShapeAnimDObj* shapeanimdobj)
{
    HSD_DObj* dp;
    HSD_MatAnim* ma;
    HSD_ShapeAnimDObj* sd;

    if (dobj == NULL)
        return;

    for (dp = dobj, ma = matanim, sd = shapeanimdobj; dp != NULL; dp = dp->next, ma = next_p(ma), sd = next_p(sd)) {
        HSD_DObjAddAnim(dp, ma, sd);
    }
}

void HSD_DObjReqAnimByFlags(HSD_DObj* dobj, f32 startframe, u32 flags)
{
    if (dobj == NULL)
        return;

    HSD_PObjReqAnimAllByFlags(dobj->pobj, startframe, flags);
    HSD_MObjReqAnimByFlags(dobj->mobj, startframe, flags);
}

void HSD_DObjReqAnimAllByFlags(HSD_DObj* dobj, f32 startframe, u32 flags)
{
    HSD_DObj* dp;

    if (dobj == NULL)
        return;

    for (dp = dobj; dp != NULL; dp = dp->next) {
        HSD_DObjReqAnimByFlags(dp, startframe, flags);
    }
}

// Not quite matching when copied from melee (SSBM).
// Seems that HSD_ClassInfo was altered.
extern void HSD_MObjAnim();
extern void HSD_PObjAnimAll();
#pragma push
asm void HSD_DObjAnimAll(HSD_DObj* dobj)
{
    nofralloc
/* 803F45F0 003F13F0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 803F45F4 003F13F4  7C 08 02 A6 */	mflr r0
/* 803F45F8 003F13F8  28 03 00 00 */	cmplwi r3, 0
/* 803F45FC 003F13FC  90 01 00 14 */	stw r0, 0x14(r1)
/* 803F4600 003F1400  93 E1 00 0C */	stw r31, 0xc(r1)
/* 803F4604 003F1404  41 82 00 44 */	beq lbl_803F4648
/* 803F4608 003F1408  7C 7F 1B 78 */	mr r31, r3
/* 803F460C 003F140C  48 00 00 34 */	b lbl_803F4640
lbl_803F4610:
/* 803F4610 003F1410  28 1F 00 00 */	cmplwi r31, 0
/* 803F4614 003F1414  41 82 00 28 */	beq lbl_803F463C
/* 803F4618 003F1418  80 BF 00 00 */	lwz r5, 0(r31)
/* 803F461C 003F141C  7F E4 FB 78 */	mr r4, r31
/* 803F4620 003F1420  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 803F4624 003F1424  80 A5 00 44 */	lwz r5, 0x44(r5)
/* 803F4628 003F1428  48 00 6C DD */	bl HSD_AObjInterpretAnim
/* 803F462C 003F142C  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 803F4630 003F1430  48 01 0E C9 */	bl HSD_PObjAnimAll
/* 803F4634 003F1434  80 7F 00 08 */	lwz r3, 8(r31)
/* 803F4638 003F1438  48 00 58 85 */	bl HSD_MObjAnim
lbl_803F463C:
/* 803F463C 003F143C  83 FF 00 04 */	lwz r31, 4(r31)
lbl_803F4640:
/* 803F4640 003F1440  28 1F 00 00 */	cmplwi r31, 0
/* 803F4644 003F1444  40 82 FF CC */	bne lbl_803F4610
lbl_803F4648:
/* 803F4648 003F1448  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803F464C 003F144C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 803F4650 003F1450  7C 08 03 A6 */	mtlr r0
/* 803F4654 003F1454  38 21 00 10 */	addi r1, r1, 0x10
/* 803F4658 003F1458  4E 80 00 20 */	blr
}
#pragma pop

extern char lbl_805DCA40[4];

HSD_DObj* HSD_DObjLoadDesc(HSD_DObjDesc* desc);
HSD_PObj* HSD_PObjLoadDesc(HSD_PObjDesc* desc);
HSD_MObj* HSD_MObjLoadDesc(HSD_MObjDesc* desc);

void HSD_DObjModifyFlags(HSD_DObj* dobj, u32 flags, u32 mask)
{
    if (dobj == NULL)
        return;

    dobj->flags = dobj->flags & ~mask | flags & mask;
}

int DObjLoad(HSD_DObj* dobj, HSD_DObjDesc* desc)
{
    dobj->next = HSD_DObjLoadDesc(desc->next);
    dobj->mobj = HSD_MObjLoadDesc(desc->mobjdesc);
    dobj->pobj = HSD_PObjLoadDesc(desc->pobjdesc);

    if (dobj->mobj != NULL) {
        switch (dobj->mobj->rendermode & 0x60000000) {
            case 0:
                HSD_DObjModifyFlags(dobj, 2, 0xE);
                break;
            case 0x40000000:
                HSD_DObjModifyFlags(dobj, 8, 0xE);
                break;
            case 0x60000000:
                HSD_DObjModifyFlags(dobj, 4, 0xE);
                break;
            default:
                _OSReport("mobj has unexpected blending flags (0x%x).", dobj->mobj->rendermode);
                HSD_Panic(__FILE__, 319, "");
        }
    }
    return 0;
}

extern HSD_DObjInfo* default_class;

void HSD_DObjSetDefaultClass(HSD_DObjInfo* info)
{
    if (info != NULL)
        assert_line(0x155, hsdIsDescendantOf(info, &hsdDObj));
    default_class = info;
}

void* hsdNew();

HSD_DObj* HSD_DObjLoadDesc(HSD_DObjDesc* desc)
{
    HSD_DObj* dobj;

    if (desc == NULL)
        return NULL;

    if (desc->class_name == NULL || hsdSearchClassInfo(desc->class_name) == NULL) {
        dobj = HSD_DObjAlloc();
    } else {
        dobj = HSD_DOBJ(hsdNew());
        assert_line(0x181, dobj);
    }
    HSD_DOBJ_METHOD(dobj)->load(dobj, desc);

    return dobj;
}

void hsdDelete(void* object)
{
    if (object == NULL)
        return;

    HSD_CLASS_METHOD(object)->release((HSD_Class*) object);
    HSD_CLASS_METHOD(object)->destroy((HSD_Class*) object);
}

void HSD_DObjRemove(HSD_DObj* dobj)
{
    hsdDelete(dobj);
}

void HSD_DObjRemoveAll(HSD_DObj* dobj)
{
    HSD_DObj* next;

    for (; dobj != NULL; dobj = next) {
        next = dobj->next;
        HSD_DObjRemove(dobj);
    }
}

HSD_DObj* HSD_DObjAlloc(void)
{
    HSD_DObj* dobj = hsdNew((HSD_ClassInfo*) (default_class ? default_class : &hsdDObj));
    assert_line(0x214, dobj);
    return dobj;
}

void HSD_DObjResolveRefs(HSD_DObj* dobj, HSD_DObjDesc* desc)
{
    if (dobj == NULL || desc == NULL)
       return;
    HSD_PObjResolveRefsAll(dobj->pobj, desc->pobjdesc);
}

void HSD_DObjResolveRefsAll(HSD_DObj* dobj, HSD_DObjDesc* desc)
{
    for (; dobj != NULL && desc != NULL; dobj = dobj->next, desc = desc->next) {
        HSD_DObjResolveRefs(dobj, desc);
    }
}

void HSD_DObjDisp(HSD_DObj* dobj, Mtx vmtx, Mtx pmtx, u32 rendermode)
{
    HSD_PObj* p;

    HSD_MObjSetCurrent(dobj->mobj);
    if ((rendermode & 0x4000000) == 0) {
        HSD_MOBJ_METHOD(dobj->mobj)->setup(dobj->mobj, rendermode);
    }
    for (p = dobj->pobj; p != NULL; p = p->next) {
        HSD_POBJ_METHOD(p)->disp(p, vmtx, pmtx, rendermode);
    }
    if ((rendermode & 0x4000000) == 0) {
        HSD_MOBJ_METHOD(dobj->mobj)->unset(dobj->mobj, rendermode);
    }
    HSD_MObjSetCurrent(NULL);
}

void DObjRelease(HSD_Class* o)
{
    HSD_DObj* dobj = HSD_DOBJ(o);

    HSD_MObjRemove(dobj->mobj);
    HSD_PObjRemoveAll(dobj->pobj);
    HSD_AObjRemove(dobj->aobj);

    HSD_PARENT_INFO(&hsdDObj)->release(o);
}

void DObjAmnesia(HSD_ClassInfo* info)
{
    if (info == HSD_CLASS_INFO(default_class)) {
        default_class = NULL;
    }
    HSD_PARENT_INFO(&hsdDObj)->amnesia(info);
}

#pragma push
#pragma force_active on
static char unused1[] = "can not find specified pobj in link.\n";
static char unused2[] = "can not find specified pobj in link.";
static char unused3[] = "dobj->mobj == mobj";
#pragma pop

void DObjInfoInit(void)
{
    hsdInitClassInfo(HSD_CLASS_INFO(&hsdDObj), &hsdClass,
        "sysdolphin_base_library", "hsd_dobj",
        sizeof(HSD_DObjInfo), sizeof(HSD_DObj));

    HSD_CLASS_INFO(&hsdDObj)->release = DObjRelease;
    HSD_CLASS_INFO(&hsdDObj)->amnesia = DObjAmnesia;
    hsdDObj.disp = HSD_DObjDisp;
    hsdDObj.load = DObjLoad;
}
