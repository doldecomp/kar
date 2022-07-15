#include "dobj.h"

extern HSD_DObj* current_dobj;

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
extern void func_803F9EBC();
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
/* 803F4638 003F1438  48 00 58 85 */	bl func_803F9EBC
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

extern char lbl_805DCA38[4];
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
                HSD_Panic(lbl_805DCA38, 319, lbl_805DCA40);
        }
    }
    return 0;
}

extern HSD_DObjInfo hsdDObj;
extern HSD_DObjInfo* default_class;

void HSD_DObjSetDefaultClass(HSD_DObjInfo* info)
{
    if (info != NULL)
        if (!hsdIsDescendantOf(info, &hsdDObj))
            __assert(lbl_805DCA38, 0x155, "hsdIsDescendantOf(info, &hsdDObj)");
    default_class = info;
}

extern char lbl_805DCA44[4];

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
        if (dobj == NULL) {
            __assert(lbl_805DCA38, 0x181, lbl_805DCA44);
        }
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
    if (dobj == NULL) {
        __assert(lbl_805DCA38, 0x214, lbl_805DCA44);
    }
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

#pragma push
void _restgpr_26();
void _savegpr_26();
void func_803F98BC();
asm void HSD_DObjDisp()
{
    nofralloc
/* 803F4998 003F1798  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 803F499C 003F179C  7C 08 02 A6 */	mflr r0
/* 803F49A0 003F17A0  90 01 00 24 */	stw r0, 0x24(r1)
/* 803F49A4 003F17A4  39 61 00 20 */	addi r11, r1, 0x20
/* 803F49A8 003F17A8  4B FB 91 A9 */	bl _savegpr_26
/* 803F49AC 003F17AC  7C 7A 1B 78 */	mr r26, r3
/* 803F49B0 003F17B0  7C 9B 23 78 */	mr r27, r4
/* 803F49B4 003F17B4  80 63 00 08 */	lwz r3, 8(r3)
/* 803F49B8 003F17B8  7C BC 2B 78 */	mr r28, r5
/* 803F49BC 003F17BC  7C DD 33 78 */	mr r29, r6
/* 803F49C0 003F17C0  48 00 4E FD */	bl func_803F98BC
/* 803F49C4 003F17C4  57 BF 01 4B */	rlwinm. r31, r29, 0, 5, 5
/* 803F49C8 003F17C8  40 82 00 1C */	bne lbl_803F49E4
/* 803F49CC 003F17CC  80 7A 00 08 */	lwz r3, 8(r26)
/* 803F49D0 003F17D0  7F A4 EB 78 */	mr r4, r29
/* 803F49D4 003F17D4  80 A3 00 00 */	lwz r5, 0(r3)
/* 803F49D8 003F17D8  81 85 00 3C */	lwz r12, 0x3c(r5)
/* 803F49DC 003F17DC  7D 89 03 A6 */	mtctr r12
/* 803F49E0 003F17E0  4E 80 04 21 */	bctrl
lbl_803F49E4:
/* 803F49E4 003F17E4  83 DA 00 0C */	lwz r30, 0xc(r26)
/* 803F49E8 003F17E8  48 00 00 28 */	b lbl_803F4A10
lbl_803F49EC:
/* 803F49EC 003F17EC  80 DE 00 00 */	lwz r6, 0(r30)
/* 803F49F0 003F17F0  7F C3 F3 78 */	mr r3, r30
/* 803F49F4 003F17F4  7F 64 DB 78 */	mr r4, r27
/* 803F49F8 003F17F8  7F 85 E3 78 */	mr r5, r28
/* 803F49FC 003F17FC  81 86 00 3C */	lwz r12, 0x3c(r6)
/* 803F4A00 003F1800  7F A6 EB 78 */	mr r6, r29
/* 803F4A04 003F1804  7D 89 03 A6 */	mtctr r12
/* 803F4A08 003F1808  4E 80 04 21 */	bctrl
/* 803F4A0C 003F180C  83 DE 00 04 */	lwz r30, 4(r30)
lbl_803F4A10:
/* 803F4A10 003F1810  28 1E 00 00 */	cmplwi r30, 0
/* 803F4A14 003F1814  40 82 FF D8 */	bne lbl_803F49EC
/* 803F4A18 003F1818  28 1F 00 00 */	cmplwi r31, 0
/* 803F4A1C 003F181C  40 82 00 1C */	bne lbl_803F4A38
/* 803F4A20 003F1820  80 7A 00 08 */	lwz r3, 8(r26)
/* 803F4A24 003F1824  7F A4 EB 78 */	mr r4, r29
/* 803F4A28 003F1828  80 A3 00 00 */	lwz r5, 0(r3)
/* 803F4A2C 003F182C  81 85 00 50 */	lwz r12, 0x50(r5)
/* 803F4A30 003F1830  7D 89 03 A6 */	mtctr r12
/* 803F4A34 003F1834  4E 80 04 21 */	bctrl
lbl_803F4A38:
/* 803F4A38 003F1838  38 60 00 00 */	li r3, 0
/* 803F4A3C 003F183C  48 00 4E 81 */	bl func_803F98BC
/* 803F4A40 003F1840  39 61 00 20 */	addi r11, r1, 0x20
/* 803F4A44 003F1844  4B FB 91 59 */	bl _restgpr_26
/* 803F4A48 003F1848  80 01 00 24 */	lwz r0, 0x24(r1)
/* 803F4A4C 003F184C  7C 08 03 A6 */	mtlr r0
/* 803F4A50 003F1850  38 21 00 20 */	addi r1, r1, 0x20
/* 803F4A54 003F1854  4E 80 00 20 */	blr
}
#pragma pop

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
