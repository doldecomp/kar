#include "mobj.h"

void* hsdAllocMemPiece();

void MObjInfoInit();
HSD_MObjInfo hsdMObj = { MObjInfoInit };

static HSD_TObj* tobj_shadows;
static HSD_TObj* tobj_toon;
static HSD_MObj* current_mobj;
static HSD_MObjInfo* default_class;

void HSD_MObjSetCurrent(HSD_MObj *mobj)
{
    current_mobj = mobj;
}

void HSD_MObjSetFlags(HSD_MObj *mobj, u32 flags)
{
    if (mobj != NULL)
        mobj->rendermode |= flags;
}

void HSD_MObjClearFlags(HSD_MObj *mobj, u32 flags)
{
    if (mobj != NULL)
        mobj->rendermode &= ~flags;
}

void HSD_MObjRemoveAnimByFlags(HSD_MObj *mobj, u32 flags)
{
    if (mobj == NULL)
        return;

    if (flags & MOBJ_ANIM) {
        HSD_AObjRemove(mobj->aobj);
        mobj->aobj = NULL;
    }
    if (flags & TOBJ_ANIM) {
        HSD_TObjRemoveAnimAll(mobj->tobj);
    }
}

void HSD_MObjAddAnim(HSD_MObj* mobj, HSD_MatAnim* matanim)
{
    if (mobj == NULL)
        return;

    if (matanim != NULL) {
        if (mobj->aobj != NULL) {
            HSD_AObjRemove(mobj->aobj);
        }
        mobj->aobj = HSD_AObjLoadDesc(matanim->aobjdesc);
        HSD_TObjAddAnim(mobj->tobj, matanim->texanim);
    }
}

void HSD_MObjReqAnimByFlags(HSD_MObj* mobj, f32 startframe, u32 flags)
{
    if (mobj == NULL)
        return;
    if (flags & MOBJ_ANIM) {
        HSD_AObjReqAnim(mobj->aobj, startframe);
    }
    HSD_TObjReqAnimAllByFlags(mobj->tobj, startframe, flags);
}

inline f32 HSD_ClampFloat(f32 val, f32 min, f32 max)
{
    if (val <= min) return min;
    if (val >= max) return max;
    return val;
}

void MObjUpdateFunc(void* obj, u32 type, FObjData* val)
{
    HSD_MObj* mobj = obj;

    if (mobj == NULL)
        return;

    switch (type) {
    case HSD_A_M_AMBIENT_R:
        if (mobj->mat)
            mobj->mat->ambient.r = 255 * HSD_ClampFloat(val->fv, 0, 1);
        break;
    case HSD_A_M_AMBIENT_G:
        if (mobj->mat)
            mobj->mat->ambient.g = 255 * HSD_ClampFloat(val->fv, 0, 1);
        break;
    case HSD_A_M_AMBIENT_B:
        if (mobj->mat)
            mobj->mat->ambient.b = 255 * HSD_ClampFloat(val->fv, 0, 1);
        break;
    case HSD_A_M_DIFFUSE_R:
        if (mobj->mat)
            mobj->mat->diffuse.r = 255 * HSD_ClampFloat(val->fv, 0, 1);
        break;
    case HSD_A_M_DIFFUSE_G:
        if (mobj->mat)
            mobj->mat->diffuse.g = 255 * HSD_ClampFloat(val->fv, 0, 1);
        break;
    case HSD_A_M_DIFFUSE_B:
        if (mobj->mat)
            mobj->mat->diffuse.b = 255 * HSD_ClampFloat(val->fv, 0, 1);
        break;
    case HSD_A_M_ALPHA:
        if (mobj->mat)
            mobj->mat->alpha = HSD_ClampFloat(1 - val->fv, 0, 1);
        break;
    case HSD_A_M_SPECULAR_R:
        if (mobj->mat)
            mobj->mat->specular.r = 255 * HSD_ClampFloat(val->fv, 0, 1);
        break;
    case HSD_A_M_SPECULAR_G:
        if (mobj->mat)
            mobj->mat->specular.g = 255 * HSD_ClampFloat(val->fv, 0, 1);
        break;
    case HSD_A_M_SPECULAR_B:
        if (mobj->mat)
            mobj->mat->specular.b = 255 * HSD_ClampFloat(val->fv, 0, 1);
        break;
    case HSD_A_M_PE_REF0:
        if (mobj->pe) {
            mobj->pe->ref0 = 255 * HSD_ClampFloat(val->fv, 0, 1);
        }
        break;
    case HSD_A_M_PE_REF1:
        if (mobj->pe) {
            mobj->pe->ref1 = 255 * HSD_ClampFloat(val->fv, 0, 1);
        }
        break;
    case HSD_A_M_PE_DSTALPHA:
        if (mobj->pe) {
            mobj->pe->dst_alpha = 255 * HSD_ClampFloat(val->fv, 0, 1);
        }
        break;
    }
}

void HSD_MObjAnim(HSD_MObj* mobj)
{
    if (mobj == NULL) {
        return;
    }

    HSD_AObjInterpretAnim(mobj->aobj, mobj, HSD_MOBJ_METHOD(mobj)->update);
    HSD_TObjAnimAll(mobj->tobj);
}

int MObjLoad(HSD_MObj *mobj, HSD_MObjDesc *desc)
{
    mobj->rendermode = desc->rendermode;
    mobj->tobj = HSD_TObjLoadDesc(desc->texdesc);
    mobj->mat = HSD_MaterialAlloc();
    memcpy(mobj->mat, desc->mat, sizeof(HSD_Material));
    mobj->rendermode |= RENDER_TOON;
    if (desc->pedesc) {
        mobj->pe = hsdAllocMemPiece(sizeof(HSD_PEDesc));
        memcpy(mobj->pe, desc->pedesc, sizeof(HSD_PEDesc));
    }
    mobj->aobj = NULL;
    return 0;
}

char lbl_805DCAA0[] = "mobj.c";
extern HSD_MObjInfo hsdMObj;
void func_803F9FA4(HSD_MObjInfo* info) {
    if (info != NULL) {
        if (!hsdIsDescendantOf(info, &hsdMObj))
            __assert(lbl_805DCAA0, 0x14E, "hsdIsDescendantOf(info, &hsdMObj)");
    }
    default_class = info;
}

HSD_MObjInfo* HSD_MObjGetDefaultClass(void)
{
    return default_class? default_class : &hsdMObj;
}

void* hsdNew(HSD_ClassInfo* info);
HSD_MObj* HSD_MObjLoadDesc(HSD_MObjDesc* mobjdesc)
{
    if (mobjdesc) {
        HSD_MObj* mobj;
        HSD_ClassInfo* info;

        if (!mobjdesc->class_name || !(info = hsdSearchClassInfo(mobjdesc->class_name))) {
            mobj = HSD_MObjAlloc();
        } else {
            mobj = hsdNew(info);
            if (mobj == NULL) {
                __assert(lbl_805DCAA0, 0x175, "mobj");
            }
        }

        HSD_MOBJ_METHOD(mobj)->load(mobj, mobjdesc);
        HSD_MObjCompileTev(mobj);

        return mobj;
    } else {
        return NULL;
    }
}

char lbl_805DCAAD = 0xFF;
char lbl_805DCAB0[] = "list";
void _restgpr_24();
void _savegpr_24();
void HSD_TExpOrder();
void HSD_TExpAlphaIn();
void HSD_TExpAlphaOp();
void HSD_TExpCnst();
void HSD_TExpColorIn();
void HSD_TExpColorOp();
void HSD_TExpTev();
asm HSD_TExp* MObjMakeTExp(HSD_MObj*, HSD_TObj*, HSD_TExp**)
{
    nofralloc
/* 803FA0B4 003F6EB4  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 803FA0B8 003F6EB8  7C 08 02 A6 */	mflr r0
/* 803FA0BC 003F6EBC  90 01 00 44 */	stw r0, 0x44(r1)
/* 803FA0C0 003F6EC0  39 61 00 40 */	addi r11, r1, 0x40
/* 803FA0C4 003F6EC4  4B FB 3A 85 */	bl _savegpr_24
/* 803FA0C8 003F6EC8  7C BB 2B 79 */	or. r27, r5, r5
/* 803FA0CC 003F6ECC  7C 79 1B 78 */	mr r25, r3
/* 803FA0D0 003F6ED0  7C 9A 23 78 */	mr r26, r4
/* 803FA0D4 003F6ED4  3B C0 00 00 */	li r30, 0
/* 803FA0D8 003F6ED8  3B A0 00 00 */	li r29, 0
/* 803FA0DC 003F6EDC  40 82 00 14 */	bne lbl_803FA0F0
/* 803FA0E0 003F6EE0  38 6D F9 C0 */	la r3, lbl_805DCAA0
/* 803FA0E4 003F6EE4  38 80 01 8B */	li r4, 0x18b
/* 803FA0E8 003F6EE8  38 AD F9 D0 */	la r5, lbl_805DCAB0
/* 803FA0EC 003F6EEC  48 02 E3 CD */	bl __assert
lbl_803FA0F0:
/* 803FA0F0 003F6EF0  38 00 00 00 */	li r0, 0
/* 803FA0F4 003F6EF4  7F 43 D3 78 */	mr r3, r26
/* 803FA0F8 003F6EF8  90 1B 00 00 */	stw r0, 0(r27)
/* 803FA0FC 003F6EFC  48 00 00 1C */	b lbl_803FA118
lbl_803FA100:
/* 803FA100 003F6F00  80 03 00 4C */	lwz r0, 0x4c(r3)
/* 803FA104 003F6F04  54 00 07 3E */	clrlwi r0, r0, 0x1c
/* 803FA108 003F6F08  28 00 00 04 */	cmplwi r0, 4
/* 803FA10C 003F6F0C  40 82 00 08 */	bne lbl_803FA114
/* 803FA110 003F6F10  7C 7E 1B 78 */	mr r30, r3
lbl_803FA114:
/* 803FA114 003F6F14  80 63 00 08 */	lwz r3, 8(r3)
lbl_803FA118:
/* 803FA118 003F6F18  28 03 00 00 */	cmplwi r3, 0
/* 803FA11C 003F6F1C  40 82 FF E4 */	bne lbl_803FA100
/* 803FA120 003F6F20  80 19 00 04 */	lwz r0, 4(r25)
/* 803FA124 003F6F24  54 18 07 BF */	clrlwi. r24, r0, 0x1e
/* 803FA128 003F6F28  40 82 00 08 */	bne lbl_803FA130
/* 803FA12C 003F6F2C  3B 00 00 01 */	li r24, 1
lbl_803FA130:
/* 803FA130 003F6F30  54 1C 04 65 */	rlwinm. r28, r0, 0, 0x11, 0x12
/* 803FA134 003F6F34  40 82 00 08 */	bne lbl_803FA13C
/* 803FA138 003F6F38  57 1C 68 24 */	slwi r28, r24, 0xd
lbl_803FA13C:
/* 803FA13C 003F6F3C  7F 63 DB 78 */	mr r3, r27
/* 803FA140 003F6F40  48 02 7F E1 */	bl HSD_TExpTev
/* 803FA144 003F6F44  80 19 00 04 */	lwz r0, 4(r25)
/* 803FA148 003F6F48  7C 7F 1B 78 */	mr r31, r3
/* 803FA14C 003F6F4C  54 00 07 7B */	rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 803FA150 003F6F50  41 82 01 78 */	beq lbl_803FA2C8
/* 803FA154 003F6F54  2C 18 00 02 */	cmpwi r24, 2
/* 803FA158 003F6F58  41 82 00 08 */	beq lbl_803FA160
/* 803FA15C 003F6F5C  48 00 00 48 */	b lbl_803FA1A4
lbl_803FA160:
/* 803FA160 003F6F60  38 80 00 00 */	li r4, 0
/* 803FA164 003F6F64  38 A0 00 00 */	li r5, 0
/* 803FA168 003F6F68  38 C0 00 00 */	li r6, 0
/* 803FA16C 003F6F6C  38 E0 00 01 */	li r7, 1
/* 803FA170 003F6F70  48 02 81 91 */	bl HSD_TExpColorOp
/* 803FA174 003F6F74  38 00 00 00 */	li r0, 0
/* 803FA178 003F6F78  7F E3 FB 78 */	mr r3, r31
/* 803FA17C 003F6F7C  90 01 00 08 */	stw r0, 8(r1)
/* 803FA180 003F6F80  38 80 00 07 */	li r4, 7
/* 803FA184 003F6F84  38 A0 00 00 */	li r5, 0
/* 803FA188 003F6F88  38 C0 00 07 */	li r6, 7
/* 803FA18C 003F6F8C  38 E0 00 00 */	li r7, 0
/* 803FA190 003F6F90  39 00 00 07 */	li r8, 7
/* 803FA194 003F6F94  39 20 00 00 */	li r9, 0
/* 803FA198 003F6F98  39 40 00 08 */	li r10, 8
/* 803FA19C 003F6F9C  48 02 88 ED */	bl HSD_TExpColorIn
/* 803FA1A0 003F6FA0  48 00 00 60 */	b lbl_803FA200
lbl_803FA1A4:
/* 803FA1A4 003F6FA4  80 79 00 0C */	lwz r3, 0xc(r25)
/* 803FA1A8 003F6FA8  7F 66 DB 78 */	mr r6, r27
/* 803FA1AC 003F6FAC  38 80 00 01 */	li r4, 1
/* 803FA1B0 003F6FB0  38 A0 00 00 */	li r5, 0
/* 803FA1B4 003F6FB4  38 63 00 04 */	addi r3, r3, 4
/* 803FA1B8 003F6FB8  48 02 80 29 */	bl HSD_TExpCnst
/* 803FA1BC 003F6FBC  7C 78 1B 78 */	mr r24, r3
/* 803FA1C0 003F6FC0  7F E3 FB 78 */	mr r3, r31
/* 803FA1C4 003F6FC4  38 80 00 00 */	li r4, 0
/* 803FA1C8 003F6FC8  38 A0 00 00 */	li r5, 0
/* 803FA1CC 003F6FCC  38 C0 00 00 */	li r6, 0
/* 803FA1D0 003F6FD0  38 E0 00 01 */	li r7, 1
/* 803FA1D4 003F6FD4  48 02 81 2D */	bl HSD_TExpColorOp
/* 803FA1D8 003F6FD8  93 01 00 08 */	stw r24, 8(r1)
/* 803FA1DC 003F6FDC  7F E3 FB 78 */	mr r3, r31
/* 803FA1E0 003F6FE0  38 80 00 07 */	li r4, 7
/* 803FA1E4 003F6FE4  38 A0 00 00 */	li r5, 0
/* 803FA1E8 003F6FE8  38 C0 00 07 */	li r6, 7
/* 803FA1EC 003F6FEC  38 E0 00 00 */	li r7, 0
/* 803FA1F0 003F6FF0  39 00 00 07 */	li r8, 7
/* 803FA1F4 003F6FF4  39 20 00 00 */	li r9, 0
/* 803FA1F8 003F6FF8  39 40 00 01 */	li r10, 1
/* 803FA1FC 003F6FFC  48 02 88 8D */	bl HSD_TExpColorIn
lbl_803FA200:
/* 803FA200 003F7000  2C 1C 40 00 */	cmpwi r28, 0x4000
/* 803FA204 003F7004  41 82 00 08 */	beq lbl_803FA20C
/* 803FA208 003F7008  48 00 00 60 */	b lbl_803FA268
lbl_803FA20C:
/* 803FA20C 003F700C  7F 66 DB 78 */	mr r6, r27
/* 803FA210 003F7010  38 6D F9 CD */	la r3, lbl_805DCAAD
/* 803FA214 003F7014  38 80 00 06 */	li r4, 6
/* 803FA218 003F7018  38 A0 00 00 */	li r5, 0
/* 803FA21C 003F701C  48 02 7F C5 */	bl HSD_TExpCnst
/* 803FA220 003F7020  7C 78 1B 78 */	mr r24, r3
/* 803FA224 003F7024  7F E3 FB 78 */	mr r3, r31
/* 803FA228 003F7028  38 80 00 00 */	li r4, 0
/* 803FA22C 003F702C  38 A0 00 00 */	li r5, 0
/* 803FA230 003F7030  38 C0 00 00 */	li r6, 0
/* 803FA234 003F7034  38 E0 00 01 */	li r7, 1
/* 803FA238 003F7038  48 02 81 B1 */	bl HSD_TExpAlphaOp
/* 803FA23C 003F703C  93 01 00 08 */	stw r24, 8(r1)
/* 803FA240 003F7040  7F E3 FB 78 */	mr r3, r31
/* 803FA244 003F7044  38 80 00 07 */	li r4, 7
/* 803FA248 003F7048  38 A0 00 00 */	li r5, 0
/* 803FA24C 003F704C  38 C0 00 07 */	li r6, 7
/* 803FA250 003F7050  38 E0 00 00 */	li r7, 0
/* 803FA254 003F7054  39 00 00 07 */	li r8, 7
/* 803FA258 003F7058  39 20 00 00 */	li r9, 0
/* 803FA25C 003F705C  39 40 00 06 */	li r10, 6
/* 803FA260 003F7060  48 02 8D 29 */	bl HSD_TExpAlphaIn
/* 803FA264 003F7064  48 00 02 F4 */	b lbl_803FA558
lbl_803FA268:
/* 803FA268 003F7068  80 79 00 0C */	lwz r3, 0xc(r25)
/* 803FA26C 003F706C  7F 66 DB 78 */	mr r6, r27
/* 803FA270 003F7070  38 80 00 06 */	li r4, 6
/* 803FA274 003F7074  38 A0 00 03 */	li r5, 3
/* 803FA278 003F7078  38 63 00 0C */	addi r3, r3, 0xc
/* 803FA27C 003F707C  48 02 7F 65 */	bl HSD_TExpCnst
/* 803FA280 003F7080  7C 78 1B 78 */	mr r24, r3
/* 803FA284 003F7084  7F E3 FB 78 */	mr r3, r31
/* 803FA288 003F7088  38 80 00 00 */	li r4, 0
/* 803FA28C 003F708C  38 A0 00 00 */	li r5, 0
/* 803FA290 003F7090  38 C0 00 00 */	li r6, 0
/* 803FA294 003F7094  38 E0 00 01 */	li r7, 1
/* 803FA298 003F7098  48 02 81 51 */	bl HSD_TExpAlphaOp
/* 803FA29C 003F709C  93 01 00 08 */	stw r24, 8(r1)
/* 803FA2A0 003F70A0  7F E3 FB 78 */	mr r3, r31
/* 803FA2A4 003F70A4  38 80 00 07 */	li r4, 7
/* 803FA2A8 003F70A8  38 A0 00 00 */	li r5, 0
/* 803FA2AC 003F70AC  38 C0 00 07 */	li r6, 7
/* 803FA2B0 003F70B0  38 E0 00 00 */	li r7, 0
/* 803FA2B4 003F70B4  39 00 00 07 */	li r8, 7
/* 803FA2B8 003F70B8  39 20 00 00 */	li r9, 0
/* 803FA2BC 003F70BC  39 40 00 06 */	li r10, 6
/* 803FA2C0 003F70C0  48 02 8C C9 */	bl HSD_TExpAlphaIn
/* 803FA2C4 003F70C4  48 00 02 94 */	b lbl_803FA558
lbl_803FA2C8:
/* 803FA2C8 003F70C8  2C 18 00 02 */	cmpwi r24, 2
/* 803FA2CC 003F70CC  41 82 00 74 */	beq lbl_803FA340
/* 803FA2D0 003F70D0  40 80 00 D0 */	bge lbl_803FA3A0
/* 803FA2D4 003F70D4  2C 18 00 01 */	cmpwi r24, 1
/* 803FA2D8 003F70D8  40 80 00 08 */	bge lbl_803FA2E0
/* 803FA2DC 003F70DC  48 00 00 C4 */	b lbl_803FA3A0
lbl_803FA2E0:
/* 803FA2E0 003F70E0  80 79 00 0C */	lwz r3, 0xc(r25)
/* 803FA2E4 003F70E4  7F 66 DB 78 */	mr r6, r27
/* 803FA2E8 003F70E8  38 80 00 01 */	li r4, 1
/* 803FA2EC 003F70EC  38 A0 00 00 */	li r5, 0
/* 803FA2F0 003F70F0  38 63 00 04 */	addi r3, r3, 4
/* 803FA2F4 003F70F4  48 02 7E ED */	bl HSD_TExpCnst
/* 803FA2F8 003F70F8  7C 78 1B 78 */	mr r24, r3
/* 803FA2FC 003F70FC  7F E3 FB 78 */	mr r3, r31
/* 803FA300 003F7100  38 80 00 00 */	li r4, 0
/* 803FA304 003F7104  38 A0 00 00 */	li r5, 0
/* 803FA308 003F7108  38 C0 00 00 */	li r6, 0
/* 803FA30C 003F710C  38 E0 00 01 */	li r7, 1
/* 803FA310 003F7110  48 02 7F F1 */	bl HSD_TExpColorOp
/* 803FA314 003F7114  93 01 00 08 */	stw r24, 8(r1)
/* 803FA318 003F7118  7F E3 FB 78 */	mr r3, r31
/* 803FA31C 003F711C  38 80 00 07 */	li r4, 7
/* 803FA320 003F7120  38 A0 00 00 */	li r5, 0
/* 803FA324 003F7124  38 C0 00 07 */	li r6, 7
/* 803FA328 003F7128  38 E0 00 00 */	li r7, 0
/* 803FA32C 003F712C  39 00 00 07 */	li r8, 7
/* 803FA330 003F7130  39 20 00 00 */	li r9, 0
/* 803FA334 003F7134  39 40 00 01 */	li r10, 1
/* 803FA338 003F7138  48 02 87 51 */	bl HSD_TExpColorIn
/* 803FA33C 003F713C  48 00 00 DC */	b lbl_803FA418
lbl_803FA340:
/* 803FA340 003F7140  7F C4 F3 78 */	mr r4, r30
/* 803FA344 003F7144  38 A0 00 04 */	li r5, 4
/* 803FA348 003F7148  48 02 8D 49 */	bl HSD_TExpOrder
/* 803FA34C 003F714C  7F E3 FB 78 */	mr r3, r31
/* 803FA350 003F7150  38 80 00 00 */	li r4, 0
/* 803FA354 003F7154  38 A0 00 00 */	li r5, 0
/* 803FA358 003F7158  38 C0 00 00 */	li r6, 0
/* 803FA35C 003F715C  38 E0 00 01 */	li r7, 1
/* 803FA360 003F7160  48 02 7F A1 */	bl HSD_TExpColorOp
/* 803FA364 003F7164  28 1E 00 00 */	cmplwi r30, 0
/* 803FA368 003F7168  38 00 FF FE */	li r0, -2
/* 803FA36C 003F716C  41 82 00 08 */	beq lbl_803FA374
/* 803FA370 003F7170  38 00 FF FF */	li r0, -1
lbl_803FA374:
/* 803FA374 003F7174  90 01 00 08 */	stw r0, 8(r1)
/* 803FA378 003F7178  7F E3 FB 78 */	mr r3, r31
/* 803FA37C 003F717C  38 80 00 07 */	li r4, 7
/* 803FA380 003F7180  38 A0 00 00 */	li r5, 0
/* 803FA384 003F7184  38 C0 00 07 */	li r6, 7
/* 803FA388 003F7188  38 E0 00 00 */	li r7, 0
/* 803FA38C 003F718C  39 00 00 07 */	li r8, 7
/* 803FA390 003F7190  39 20 00 00 */	li r9, 0
/* 803FA394 003F7194  39 40 00 01 */	li r10, 1
/* 803FA398 003F7198  48 02 86 F1 */	bl HSD_TExpColorIn
/* 803FA39C 003F719C  48 00 00 7C */	b lbl_803FA418
lbl_803FA3A0:
/* 803FA3A0 003F71A0  80 79 00 0C */	lwz r3, 0xc(r25)
/* 803FA3A4 003F71A4  7F 66 DB 78 */	mr r6, r27
/* 803FA3A8 003F71A8  38 80 00 01 */	li r4, 1
/* 803FA3AC 003F71AC  38 A0 00 00 */	li r5, 0
/* 803FA3B0 003F71B0  38 63 00 04 */	addi r3, r3, 4
/* 803FA3B4 003F71B4  48 02 7E 2D */	bl HSD_TExpCnst
/* 803FA3B8 003F71B8  7C 78 1B 78 */	mr r24, r3
/* 803FA3BC 003F71BC  7F E3 FB 78 */	mr r3, r31
/* 803FA3C0 003F71C0  7F C4 F3 78 */	mr r4, r30
/* 803FA3C4 003F71C4  38 A0 00 04 */	li r5, 4
/* 803FA3C8 003F71C8  48 02 8C C9 */	bl HSD_TExpOrder
/* 803FA3CC 003F71CC  7F E3 FB 78 */	mr r3, r31
/* 803FA3D0 003F71D0  38 80 00 00 */	li r4, 0
/* 803FA3D4 003F71D4  38 A0 00 00 */	li r5, 0
/* 803FA3D8 003F71D8  38 C0 00 00 */	li r6, 0
/* 803FA3DC 003F71DC  38 E0 00 01 */	li r7, 1
/* 803FA3E0 003F71E0  48 02 7F 21 */	bl HSD_TExpColorOp
/* 803FA3E4 003F71E4  28 1E 00 00 */	cmplwi r30, 0
/* 803FA3E8 003F71E8  93 01 00 08 */	stw r24, 8(r1)
/* 803FA3EC 003F71EC  7F E3 FB 78 */	mr r3, r31
/* 803FA3F0 003F71F0  38 80 00 01 */	li r4, 1
/* 803FA3F4 003F71F4  38 A0 FF FE */	li r5, -2
/* 803FA3F8 003F71F8  41 82 00 08 */	beq lbl_803FA400
/* 803FA3FC 003F71FC  38 A0 FF FF */	li r5, -1
lbl_803FA400:
/* 803FA400 003F7200  38 C0 00 07 */	li r6, 7
/* 803FA404 003F7204  38 E0 00 00 */	li r7, 0
/* 803FA408 003F7208  39 00 00 07 */	li r8, 7
/* 803FA40C 003F720C  39 20 00 00 */	li r9, 0
/* 803FA410 003F7210  39 40 00 01 */	li r10, 1
/* 803FA414 003F7214  48 02 86 75 */	bl HSD_TExpColorIn
lbl_803FA418:
/* 803FA418 003F7218  2C 1C 40 00 */	cmpwi r28, 0x4000
/* 803FA41C 003F721C  41 82 00 74 */	beq lbl_803FA490
/* 803FA420 003F7220  40 80 00 C8 */	bge lbl_803FA4E8
/* 803FA424 003F7224  2C 1C 20 00 */	cmpwi r28, 0x2000
/* 803FA428 003F7228  41 82 00 08 */	beq lbl_803FA430
/* 803FA42C 003F722C  48 00 00 BC */	b lbl_803FA4E8
lbl_803FA430:
/* 803FA430 003F7230  80 79 00 0C */	lwz r3, 0xc(r25)
/* 803FA434 003F7234  7F 66 DB 78 */	mr r6, r27
/* 803FA438 003F7238  38 80 00 06 */	li r4, 6
/* 803FA43C 003F723C  38 A0 00 03 */	li r5, 3
/* 803FA440 003F7240  38 63 00 0C */	addi r3, r3, 0xc
/* 803FA444 003F7244  48 02 7D 9D */	bl HSD_TExpCnst
/* 803FA448 003F7248  7C 78 1B 78 */	mr r24, r3
/* 803FA44C 003F724C  7F E3 FB 78 */	mr r3, r31
/* 803FA450 003F7250  38 80 00 00 */	li r4, 0
/* 803FA454 003F7254  38 A0 00 00 */	li r5, 0
/* 803FA458 003F7258  38 C0 00 00 */	li r6, 0
/* 803FA45C 003F725C  38 E0 00 01 */	li r7, 1
/* 803FA460 003F7260  48 02 7F 89 */	bl HSD_TExpAlphaOp
/* 803FA464 003F7264  93 01 00 08 */	stw r24, 8(r1)
/* 803FA468 003F7268  7F E3 FB 78 */	mr r3, r31
/* 803FA46C 003F726C  38 80 00 07 */	li r4, 7
/* 803FA470 003F7270  38 A0 00 00 */	li r5, 0
/* 803FA474 003F7274  38 C0 00 07 */	li r6, 7
/* 803FA478 003F7278  38 E0 00 00 */	li r7, 0
/* 803FA47C 003F727C  39 00 00 07 */	li r8, 7
/* 803FA480 003F7280  39 20 00 00 */	li r9, 0
/* 803FA484 003F7284  39 40 00 06 */	li r10, 6
/* 803FA488 003F7288  48 02 8B 01 */	bl HSD_TExpAlphaIn
/* 803FA48C 003F728C  48 00 00 CC */	b lbl_803FA558
lbl_803FA490:
/* 803FA490 003F7290  7F E3 FB 78 */	mr r3, r31
/* 803FA494 003F7294  7F C4 F3 78 */	mr r4, r30
/* 803FA498 003F7298  38 A0 00 04 */	li r5, 4
/* 803FA49C 003F729C  48 02 8B F5 */	bl HSD_TExpOrder
/* 803FA4A0 003F72A0  7F E3 FB 78 */	mr r3, r31
/* 803FA4A4 003F72A4  38 80 00 00 */	li r4, 0
/* 803FA4A8 003F72A8  38 A0 00 00 */	li r5, 0
/* 803FA4AC 003F72AC  38 C0 00 00 */	li r6, 0
/* 803FA4B0 003F72B0  38 E0 00 01 */	li r7, 1
/* 803FA4B4 003F72B4  48 02 7F 35 */	bl HSD_TExpAlphaOp
/* 803FA4B8 003F72B8  38 00 FF FE */	li r0, -2
/* 803FA4BC 003F72BC  7F E3 FB 78 */	mr r3, r31
/* 803FA4C0 003F72C0  90 01 00 08 */	stw r0, 8(r1)
/* 803FA4C4 003F72C4  38 80 00 07 */	li r4, 7
/* 803FA4C8 003F72C8  38 A0 00 00 */	li r5, 0
/* 803FA4CC 003F72CC  38 C0 00 07 */	li r6, 7
/* 803FA4D0 003F72D0  38 E0 00 00 */	li r7, 0
/* 803FA4D4 003F72D4  39 00 00 07 */	li r8, 7
/* 803FA4D8 003F72D8  39 20 00 00 */	li r9, 0
/* 803FA4DC 003F72DC  39 40 00 05 */	li r10, 5
/* 803FA4E0 003F72E0  48 02 8A A9 */	bl HSD_TExpAlphaIn
/* 803FA4E4 003F72E4  48 00 00 74 */	b lbl_803FA558
lbl_803FA4E8:
/* 803FA4E8 003F72E8  80 79 00 0C */	lwz r3, 0xc(r25)
/* 803FA4EC 003F72EC  7F 66 DB 78 */	mr r6, r27
/* 803FA4F0 003F72F0  38 80 00 06 */	li r4, 6
/* 803FA4F4 003F72F4  38 A0 00 03 */	li r5, 3
/* 803FA4F8 003F72F8  38 63 00 0C */	addi r3, r3, 0xc
/* 803FA4FC 003F72FC  48 02 7C E5 */	bl HSD_TExpCnst
/* 803FA500 003F7300  7C 78 1B 78 */	mr r24, r3
/* 803FA504 003F7304  7F E3 FB 78 */	mr r3, r31
/* 803FA508 003F7308  7F C4 F3 78 */	mr r4, r30
/* 803FA50C 003F730C  38 A0 00 04 */	li r5, 4
/* 803FA510 003F7310  48 02 8B 81 */	bl HSD_TExpOrder
/* 803FA514 003F7314  7F E3 FB 78 */	mr r3, r31
/* 803FA518 003F7318  38 80 00 00 */	li r4, 0
/* 803FA51C 003F731C  38 A0 00 00 */	li r5, 0
/* 803FA520 003F7320  38 C0 00 00 */	li r6, 0
/* 803FA524 003F7324  38 E0 00 01 */	li r7, 1
/* 803FA528 003F7328  48 02 7E C1 */	bl HSD_TExpAlphaOp
/* 803FA52C 003F732C  38 00 00 00 */	li r0, 0
/* 803FA530 003F7330  7F E3 FB 78 */	mr r3, r31
/* 803FA534 003F7334  90 01 00 08 */	stw r0, 8(r1)
/* 803FA538 003F7338  7F 09 C3 78 */	mr r9, r24
/* 803FA53C 003F733C  38 80 00 07 */	li r4, 7
/* 803FA540 003F7340  38 A0 00 00 */	li r5, 0
/* 803FA544 003F7344  38 C0 00 05 */	li r6, 5
/* 803FA548 003F7348  38 E0 FF FE */	li r7, -2
/* 803FA54C 003F734C  39 00 00 06 */	li r8, 6
/* 803FA550 003F7350  39 40 00 07 */	li r10, 7
/* 803FA554 003F7354  48 02 8A 35 */	bl HSD_TExpAlphaIn
lbl_803FA558:
/* 803FA558 003F7358  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 803FA55C 003F735C  7F 58 D3 78 */	mr r24, r26
/* 803FA560 003F7360  93 E1 00 10 */	stw r31, 0x10(r1)
/* 803FA564 003F7364  48 00 00 48 */	b lbl_803FA5AC
lbl_803FA568:
/* 803FA568 003F7368  80 18 00 4C */	lwz r0, 0x4c(r24)
/* 803FA56C 003F736C  70 00 00 50 */	andi. r0, r0, 0x50
/* 803FA570 003F7370  41 82 00 38 */	beq lbl_803FA5A8
/* 803FA574 003F7374  80 18 00 0C */	lwz r0, 0xc(r24)
/* 803FA578 003F7378  2C 00 00 FF */	cmpwi r0, 0xff
/* 803FA57C 003F737C  41 82 00 2C */	beq lbl_803FA5A8
/* 803FA580 003F7380  80 98 00 00 */	lwz r4, 0(r24)
/* 803FA584 003F7384  7F 03 C3 78 */	mr r3, r24
/* 803FA588 003F7388  7F 68 DB 78 */	mr r8, r27
/* 803FA58C 003F738C  38 C1 00 1C */	addi r6, r1, 0x1c
/* 803FA590 003F7390  81 84 00 44 */	lwz r12, 0x44(r4)
/* 803FA594 003F7394  38 E1 00 10 */	addi r7, r1, 0x10
/* 803FA598 003F7398  38 80 00 50 */	li r4, 0x50
/* 803FA59C 003F739C  38 A0 00 00 */	li r5, 0
/* 803FA5A0 003F73A0  7D 89 03 A6 */	mtctr r12
/* 803FA5A4 003F73A4  4E 80 04 21 */	bctrl 
lbl_803FA5A8:
/* 803FA5A8 003F73A8  83 18 00 08 */	lwz r24, 8(r24)
lbl_803FA5AC:
/* 803FA5AC 003F73AC  28 18 00 00 */	cmplwi r24, 0
/* 803FA5B0 003F73B0  40 82 FF B8 */	bne lbl_803FA568
/* 803FA5B4 003F73B4  80 19 00 04 */	lwz r0, 4(r25)
/* 803FA5B8 003F73B8  63 BD 00 50 */	ori r29, r29, 0x50
/* 803FA5BC 003F73BC  54 00 07 7B */	rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 803FA5C0 003F73C0  41 82 02 08 */	beq lbl_803FA7C8
/* 803FA5C4 003F73C4  57 98 04 63 */	rlwinm. r24, r28, 0, 0x11, 0x11
/* 803FA5C8 003F73C8  41 82 00 AC */	beq lbl_803FA674
/* 803FA5CC 003F73CC  7F 63 DB 78 */	mr r3, r27
/* 803FA5D0 003F73D0  48 02 7B 51 */	bl HSD_TExpTev
/* 803FA5D4 003F73D4  38 80 00 00 */	li r4, 0
/* 803FA5D8 003F73D8  7C 7C 1B 78 */	mr r28, r3
/* 803FA5DC 003F73DC  38 A0 00 05 */	li r5, 5
/* 803FA5E0 003F73E0  48 02 8A B1 */	bl HSD_TExpOrder
/* 803FA5E4 003F73E4  7F 83 E3 78 */	mr r3, r28
/* 803FA5E8 003F73E8  38 80 00 00 */	li r4, 0
/* 803FA5EC 003F73EC  38 A0 00 00 */	li r5, 0
/* 803FA5F0 003F73F0  38 C0 00 00 */	li r6, 0
/* 803FA5F4 003F73F4  38 E0 00 01 */	li r7, 1
/* 803FA5F8 003F73F8  48 02 7D 09 */	bl HSD_TExpColorOp
/* 803FA5FC 003F73FC  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 803FA600 003F7400  7F 83 E3 78 */	mr r3, r28
/* 803FA604 003F7404  38 80 00 07 */	li r4, 7
/* 803FA608 003F7408  38 A0 00 00 */	li r5, 0
/* 803FA60C 003F740C  90 01 00 08 */	stw r0, 8(r1)
/* 803FA610 003F7410  38 C0 00 07 */	li r6, 7
/* 803FA614 003F7414  38 E0 00 00 */	li r7, 0
/* 803FA618 003F7418  39 00 00 07 */	li r8, 7
/* 803FA61C 003F741C  39 20 00 00 */	li r9, 0
/* 803FA620 003F7420  39 40 00 01 */	li r10, 1
/* 803FA624 003F7424  48 02 84 65 */	bl HSD_TExpColorIn
/* 803FA628 003F7428  7F 83 E3 78 */	mr r3, r28
/* 803FA62C 003F742C  38 80 00 00 */	li r4, 0
/* 803FA630 003F7430  38 A0 00 00 */	li r5, 0
/* 803FA634 003F7434  38 C0 00 00 */	li r6, 0
/* 803FA638 003F7438  38 E0 00 01 */	li r7, 1
/* 803FA63C 003F743C  48 02 7D AD */	bl HSD_TExpAlphaOp
/* 803FA640 003F7440  38 00 00 00 */	li r0, 0
/* 803FA644 003F7444  7F 83 E3 78 */	mr r3, r28
/* 803FA648 003F7448  90 01 00 08 */	stw r0, 8(r1)
/* 803FA64C 003F744C  38 80 00 05 */	li r4, 5
/* 803FA650 003F7450  38 C0 00 07 */	li r6, 7
/* 803FA654 003F7454  38 E0 00 00 */	li r7, 0
/* 803FA658 003F7458  80 A1 00 10 */	lwz r5, 0x10(r1)
/* 803FA65C 003F745C  39 00 00 05 */	li r8, 5
/* 803FA660 003F7460  39 20 FF FE */	li r9, -2
/* 803FA664 003F7464  39 40 00 07 */	li r10, 7
/* 803FA668 003F7468  48 02 89 21 */	bl HSD_TExpAlphaIn
/* 803FA66C 003F746C  93 81 00 1C */	stw r28, 0x1c(r1)
/* 803FA670 003F7470  93 81 00 10 */	stw r28, 0x10(r1)
lbl_803FA674:
/* 803FA674 003F7474  7F 63 DB 78 */	mr r3, r27
/* 803FA678 003F7478  48 02 7A A9 */	bl HSD_TExpTev
/* 803FA67C 003F747C  28 1E 00 00 */	cmplwi r30, 0
/* 803FA680 003F7480  7C 7C 1B 78 */	mr r28, r3
/* 803FA684 003F7484  41 82 00 58 */	beq lbl_803FA6DC
/* 803FA688 003F7488  7F C4 F3 78 */	mr r4, r30
/* 803FA68C 003F748C  38 A0 00 04 */	li r5, 4
/* 803FA690 003F7490  48 02 8A 01 */	bl HSD_TExpOrder
/* 803FA694 003F7494  7F 83 E3 78 */	mr r3, r28
/* 803FA698 003F7498  38 80 00 00 */	li r4, 0
/* 803FA69C 003F749C  38 A0 00 00 */	li r5, 0
/* 803FA6A0 003F74A0  38 C0 00 00 */	li r6, 0
/* 803FA6A4 003F74A4  38 E0 00 01 */	li r7, 1
/* 803FA6A8 003F74A8  48 02 7C 59 */	bl HSD_TExpColorOp
/* 803FA6AC 003F74AC  38 00 00 00 */	li r0, 0
/* 803FA6B0 003F74B0  7F 83 E3 78 */	mr r3, r28
/* 803FA6B4 003F74B4  90 01 00 08 */	stw r0, 8(r1)
/* 803FA6B8 003F74B8  38 80 00 07 */	li r4, 7
/* 803FA6BC 003F74BC  38 A0 00 00 */	li r5, 0
/* 803FA6C0 003F74C0  38 C0 00 01 */	li r6, 1
/* 803FA6C4 003F74C4  80 E1 00 1C */	lwz r7, 0x1c(r1)
/* 803FA6C8 003F74C8  39 00 00 01 */	li r8, 1
/* 803FA6CC 003F74CC  39 20 FF FF */	li r9, -1
/* 803FA6D0 003F74D0  39 40 00 07 */	li r10, 7
/* 803FA6D4 003F74D4  48 02 83 B5 */	bl HSD_TExpColorIn
/* 803FA6D8 003F74D8  48 00 00 54 */	b lbl_803FA72C
lbl_803FA6DC:
/* 803FA6DC 003F74DC  38 80 00 00 */	li r4, 0
/* 803FA6E0 003F74E0  38 A0 00 04 */	li r5, 4
/* 803FA6E4 003F74E4  48 02 89 AD */	bl HSD_TExpOrder
/* 803FA6E8 003F74E8  7F 83 E3 78 */	mr r3, r28
/* 803FA6EC 003F74EC  38 80 00 00 */	li r4, 0
/* 803FA6F0 003F74F0  38 A0 00 00 */	li r5, 0
/* 803FA6F4 003F74F4  38 C0 00 00 */	li r6, 0
/* 803FA6F8 003F74F8  38 E0 00 01 */	li r7, 1
/* 803FA6FC 003F74FC  48 02 7C 05 */	bl HSD_TExpColorOp
/* 803FA700 003F7500  38 00 00 00 */	li r0, 0
/* 803FA704 003F7504  7F 83 E3 78 */	mr r3, r28
/* 803FA708 003F7508  90 01 00 08 */	stw r0, 8(r1)
/* 803FA70C 003F750C  38 80 00 07 */	li r4, 7
/* 803FA710 003F7510  38 A0 00 00 */	li r5, 0
/* 803FA714 003F7514  38 C0 00 01 */	li r6, 1
/* 803FA718 003F7518  80 E1 00 1C */	lwz r7, 0x1c(r1)
/* 803FA71C 003F751C  39 00 00 01 */	li r8, 1
/* 803FA720 003F7520  39 20 FF FE */	li r9, -2
/* 803FA724 003F7524  39 40 00 07 */	li r10, 7
/* 803FA728 003F7528  48 02 83 61 */	bl HSD_TExpColorIn
lbl_803FA72C:
/* 803FA72C 003F752C  28 18 00 00 */	cmplwi r24, 0
/* 803FA730 003F7530  93 81 00 1C */	stw r28, 0x1c(r1)
/* 803FA734 003F7534  41 82 00 4C */	beq lbl_803FA780
/* 803FA738 003F7538  7F 83 E3 78 */	mr r3, r28
/* 803FA73C 003F753C  38 80 00 00 */	li r4, 0
/* 803FA740 003F7540  38 A0 00 00 */	li r5, 0
/* 803FA744 003F7544  38 C0 00 00 */	li r6, 0
/* 803FA748 003F7548  38 E0 00 01 */	li r7, 1
/* 803FA74C 003F754C  48 02 7C 9D */	bl HSD_TExpAlphaOp
/* 803FA750 003F7550  38 00 00 00 */	li r0, 0
/* 803FA754 003F7554  7F 83 E3 78 */	mr r3, r28
/* 803FA758 003F7558  90 01 00 08 */	stw r0, 8(r1)
/* 803FA75C 003F755C  38 80 00 07 */	li r4, 7
/* 803FA760 003F7560  38 A0 00 00 */	li r5, 0
/* 803FA764 003F7564  38 C0 00 05 */	li r6, 5
/* 803FA768 003F7568  80 E1 00 10 */	lwz r7, 0x10(r1)
/* 803FA76C 003F756C  39 00 00 05 */	li r8, 5
/* 803FA770 003F7570  39 20 FF FE */	li r9, -2
/* 803FA774 003F7574  39 40 00 07 */	li r10, 7
/* 803FA778 003F7578  48 02 88 11 */	bl HSD_TExpAlphaIn
/* 803FA77C 003F757C  48 00 00 48 */	b lbl_803FA7C4
lbl_803FA780:
/* 803FA780 003F7580  7F 83 E3 78 */	mr r3, r28
/* 803FA784 003F7584  38 80 00 00 */	li r4, 0
/* 803FA788 003F7588  38 A0 00 00 */	li r5, 0
/* 803FA78C 003F758C  38 C0 00 00 */	li r6, 0
/* 803FA790 003F7590  38 E0 00 01 */	li r7, 1
/* 803FA794 003F7594  48 02 7C 55 */	bl HSD_TExpAlphaOp
/* 803FA798 003F7598  38 00 00 00 */	li r0, 0
/* 803FA79C 003F759C  7F 83 E3 78 */	mr r3, r28
/* 803FA7A0 003F75A0  90 01 00 08 */	stw r0, 8(r1)
/* 803FA7A4 003F75A4  38 80 00 05 */	li r4, 5
/* 803FA7A8 003F75A8  38 C0 00 07 */	li r6, 7
/* 803FA7AC 003F75AC  38 E0 00 00 */	li r7, 0
/* 803FA7B0 003F75B0  80 A1 00 10 */	lwz r5, 0x10(r1)
/* 803FA7B4 003F75B4  39 00 00 05 */	li r8, 5
/* 803FA7B8 003F75B8  39 20 FF FE */	li r9, -2
/* 803FA7BC 003F75BC  39 40 00 07 */	li r10, 7
/* 803FA7C0 003F75C0  48 02 87 C9 */	bl HSD_TExpAlphaIn
lbl_803FA7C4:
/* 803FA7C4 003F75C4  93 81 00 10 */	stw r28, 0x10(r1)
lbl_803FA7C8:
/* 803FA7C8 003F75C8  80 19 00 04 */	lwz r0, 4(r25)
/* 803FA7CC 003F75CC  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 803FA7D0 003F75D0  41 82 01 74 */	beq lbl_803FA944
/* 803FA7D4 003F75D4  80 79 00 0C */	lwz r3, 0xc(r25)
/* 803FA7D8 003F75D8  7F 66 DB 78 */	mr r6, r27
/* 803FA7DC 003F75DC  38 80 00 01 */	li r4, 1
/* 803FA7E0 003F75E0  38 A0 00 00 */	li r5, 0
/* 803FA7E4 003F75E4  38 63 00 08 */	addi r3, r3, 8
/* 803FA7E8 003F75E8  48 02 79 F9 */	bl HSD_TExpCnst
/* 803FA7EC 003F75EC  7C 79 1B 78 */	mr r25, r3
/* 803FA7F0 003F75F0  7F 63 DB 78 */	mr r3, r27
/* 803FA7F4 003F75F4  48 02 79 2D */	bl HSD_TExpTev
/* 803FA7F8 003F75F8  38 80 00 00 */	li r4, 0
/* 803FA7FC 003F75FC  7C 78 1B 78 */	mr r24, r3
/* 803FA800 003F7600  38 A0 00 00 */	li r5, 0
/* 803FA804 003F7604  38 C0 00 00 */	li r6, 0
/* 803FA808 003F7608  38 E0 00 01 */	li r7, 1
/* 803FA80C 003F760C  48 02 7A F5 */	bl HSD_TExpColorOp
/* 803FA810 003F7610  93 21 00 08 */	stw r25, 8(r1)
/* 803FA814 003F7614  7F 03 C3 78 */	mr r3, r24
/* 803FA818 003F7618  38 80 00 07 */	li r4, 7
/* 803FA81C 003F761C  38 A0 00 00 */	li r5, 0
/* 803FA820 003F7620  38 C0 00 07 */	li r6, 7
/* 803FA824 003F7624  38 E0 00 00 */	li r7, 0
/* 803FA828 003F7628  39 00 00 07 */	li r8, 7
/* 803FA82C 003F762C  39 20 00 00 */	li r9, 0
/* 803FA830 003F7630  39 40 00 01 */	li r10, 1
/* 803FA834 003F7634  48 02 82 55 */	bl HSD_TExpColorIn
/* 803FA838 003F7638  93 01 00 18 */	stw r24, 0x18(r1)
/* 803FA83C 003F763C  7F 58 D3 78 */	mr r24, r26
/* 803FA840 003F7640  48 00 00 48 */	b lbl_803FA888
lbl_803FA844:
/* 803FA844 003F7644  80 18 00 4C */	lwz r0, 0x4c(r24)
/* 803FA848 003F7648  54 00 06 B5 */	rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 803FA84C 003F764C  41 82 00 38 */	beq lbl_803FA884
/* 803FA850 003F7650  80 18 00 0C */	lwz r0, 0xc(r24)
/* 803FA854 003F7654  2C 00 00 FF */	cmpwi r0, 0xff
/* 803FA858 003F7658  41 82 00 2C */	beq lbl_803FA884
/* 803FA85C 003F765C  80 98 00 00 */	lwz r4, 0(r24)
/* 803FA860 003F7660  7F 03 C3 78 */	mr r3, r24
/* 803FA864 003F7664  7F A5 EB 78 */	mr r5, r29
/* 803FA868 003F7668  7F 68 DB 78 */	mr r8, r27
/* 803FA86C 003F766C  81 84 00 44 */	lwz r12, 0x44(r4)
/* 803FA870 003F7670  38 C1 00 18 */	addi r6, r1, 0x18
/* 803FA874 003F7674  38 E1 00 10 */	addi r7, r1, 0x10
/* 803FA878 003F7678  38 80 00 20 */	li r4, 0x20
/* 803FA87C 003F767C  7D 89 03 A6 */	mtctr r12
/* 803FA880 003F7680  4E 80 04 21 */	bctrl 
lbl_803FA884:
/* 803FA884 003F7684  83 18 00 08 */	lwz r24, 8(r24)
lbl_803FA888:
/* 803FA888 003F7688  28 18 00 00 */	cmplwi r24, 0
/* 803FA88C 003F768C  40 82 FF B8 */	bne lbl_803FA844
/* 803FA890 003F7690  7F 63 DB 78 */	mr r3, r27
/* 803FA894 003F7694  63 BD 00 20 */	ori r29, r29, 0x20
/* 803FA898 003F7698  48 02 78 89 */	bl HSD_TExpTev
/* 803FA89C 003F769C  38 80 00 00 */	li r4, 0
/* 803FA8A0 003F76A0  7C 78 1B 78 */	mr r24, r3
/* 803FA8A4 003F76A4  38 A0 00 05 */	li r5, 5
/* 803FA8A8 003F76A8  48 02 87 E9 */	bl HSD_TExpOrder
/* 803FA8AC 003F76AC  7F 03 C3 78 */	mr r3, r24
/* 803FA8B0 003F76B0  38 80 00 00 */	li r4, 0
/* 803FA8B4 003F76B4  38 A0 00 00 */	li r5, 0
/* 803FA8B8 003F76B8  38 C0 00 00 */	li r6, 0
/* 803FA8BC 003F76BC  38 E0 00 01 */	li r7, 1
/* 803FA8C0 003F76C0  48 02 7A 41 */	bl HSD_TExpColorOp
/* 803FA8C4 003F76C4  38 00 00 00 */	li r0, 0
/* 803FA8C8 003F76C8  7F 03 C3 78 */	mr r3, r24
/* 803FA8CC 003F76CC  90 01 00 08 */	stw r0, 8(r1)
/* 803FA8D0 003F76D0  38 80 00 07 */	li r4, 7
/* 803FA8D4 003F76D4  38 A0 00 00 */	li r5, 0
/* 803FA8D8 003F76D8  38 C0 00 01 */	li r6, 1
/* 803FA8DC 003F76DC  80 E1 00 18 */	lwz r7, 0x18(r1)
/* 803FA8E0 003F76E0  39 00 00 01 */	li r8, 1
/* 803FA8E4 003F76E4  39 20 FF FE */	li r9, -2
/* 803FA8E8 003F76E8  39 40 00 07 */	li r10, 7
/* 803FA8EC 003F76EC  48 02 81 9D */	bl HSD_TExpColorIn
/* 803FA8F0 003F76F0  93 01 00 18 */	stw r24, 0x18(r1)
/* 803FA8F4 003F76F4  7F 63 DB 78 */	mr r3, r27
/* 803FA8F8 003F76F8  48 02 78 29 */	bl HSD_TExpTev
/* 803FA8FC 003F76FC  38 80 00 00 */	li r4, 0
/* 803FA900 003F7700  7C 78 1B 78 */	mr r24, r3
/* 803FA904 003F7704  38 A0 00 00 */	li r5, 0
/* 803FA908 003F7708  38 C0 00 00 */	li r6, 0
/* 803FA90C 003F770C  38 E0 00 01 */	li r7, 1
/* 803FA910 003F7710  48 02 79 F1 */	bl HSD_TExpColorOp
/* 803FA914 003F7714  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 803FA918 003F7718  7F 03 C3 78 */	mr r3, r24
/* 803FA91C 003F771C  38 80 00 01 */	li r4, 1
/* 803FA920 003F7720  38 C0 00 07 */	li r6, 7
/* 803FA924 003F7724  90 01 00 08 */	stw r0, 8(r1)
/* 803FA928 003F7728  38 E0 00 00 */	li r7, 0
/* 803FA92C 003F772C  39 00 00 07 */	li r8, 7
/* 803FA930 003F7730  39 20 00 00 */	li r9, 0
/* 803FA934 003F7734  80 A1 00 18 */	lwz r5, 0x18(r1)
/* 803FA938 003F7738  39 40 00 01 */	li r10, 1
/* 803FA93C 003F773C  48 02 81 4D */	bl HSD_TExpColorIn
/* 803FA940 003F7740  93 01 00 1C */	stw r24, 0x1c(r1)
lbl_803FA944:
/* 803FA944 003F7744  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 803FA948 003F7748  7F 58 D3 78 */	mr r24, r26
/* 803FA94C 003F774C  90 01 00 14 */	stw r0, 0x14(r1)
/* 803FA950 003F7750  48 00 00 48 */	b lbl_803FA998
lbl_803FA954:
/* 803FA954 003F7754  80 18 00 4C */	lwz r0, 0x4c(r24)
/* 803FA958 003F7758  54 00 06 31 */	rlwinm. r0, r0, 0, 0x18, 0x18
/* 803FA95C 003F775C  41 82 00 38 */	beq lbl_803FA994
/* 803FA960 003F7760  80 18 00 0C */	lwz r0, 0xc(r24)
/* 803FA964 003F7764  2C 00 00 FF */	cmpwi r0, 0xff
/* 803FA968 003F7768  41 82 00 2C */	beq lbl_803FA994
/* 803FA96C 003F776C  80 98 00 00 */	lwz r4, 0(r24)
/* 803FA970 003F7770  7F 03 C3 78 */	mr r3, r24
/* 803FA974 003F7774  7F A5 EB 78 */	mr r5, r29
/* 803FA978 003F7778  7F 68 DB 78 */	mr r8, r27
/* 803FA97C 003F777C  81 84 00 44 */	lwz r12, 0x44(r4)
/* 803FA980 003F7780  38 C1 00 14 */	addi r6, r1, 0x14
/* 803FA984 003F7784  38 E1 00 10 */	addi r7, r1, 0x10
/* 803FA988 003F7788  38 80 00 80 */	li r4, 0x80
/* 803FA98C 003F778C  7D 89 03 A6 */	mtctr r12
/* 803FA990 003F7790  4E 80 04 21 */	bctrl 
lbl_803FA994:
/* 803FA994 003F7794  83 18 00 08 */	lwz r24, 8(r24)
lbl_803FA998:
/* 803FA998 003F7798  28 18 00 00 */	cmplwi r24, 0
/* 803FA99C 003F779C  40 82 FF B8 */	bne lbl_803FA954
/* 803FA9A0 003F77A0  80 61 00 14 */	lwz r3, 0x14(r1)
/* 803FA9A4 003F77A4  80 01 00 10 */	lwz r0, 0x10(r1)
/* 803FA9A8 003F77A8  7C 03 00 40 */	cmplw r3, r0
/* 803FA9AC 003F77AC  40 82 00 20 */	bne lbl_803FA9CC
/* 803FA9B0 003F77B0  48 02 6E 11 */	bl HSD_TExpGetType
/* 803FA9B4 003F77B4  2C 03 00 01 */	cmpwi r3, 1
/* 803FA9B8 003F77B8  40 82 00 14 */	bne lbl_803FA9CC
/* 803FA9BC 003F77BC  80 61 00 10 */	lwz r3, 0x10(r1)
/* 803FA9C0 003F77C0  48 02 6E 01 */	bl HSD_TExpGetType
/* 803FA9C4 003F77C4  2C 03 00 01 */	cmpwi r3, 1
/* 803FA9C8 003F77C8  41 82 00 9C */	beq lbl_803FAA64
lbl_803FA9CC:
/* 803FA9CC 003F77CC  7F 63 DB 78 */	mr r3, r27
/* 803FA9D0 003F77D0  48 02 77 51 */	bl HSD_TExpTev
/* 803FA9D4 003F77D4  38 80 00 00 */	li r4, 0
/* 803FA9D8 003F77D8  7C 78 1B 78 */	mr r24, r3
/* 803FA9DC 003F77DC  38 A0 00 00 */	li r5, 0
/* 803FA9E0 003F77E0  38 C0 00 00 */	li r6, 0
/* 803FA9E4 003F77E4  38 E0 00 01 */	li r7, 1
/* 803FA9E8 003F77E8  48 02 79 19 */	bl HSD_TExpColorOp
/* 803FA9EC 003F77EC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803FA9F0 003F77F0  7F 03 C3 78 */	mr r3, r24
/* 803FA9F4 003F77F4  38 80 00 07 */	li r4, 7
/* 803FA9F8 003F77F8  38 A0 00 00 */	li r5, 0
/* 803FA9FC 003F77FC  90 01 00 08 */	stw r0, 8(r1)
/* 803FAA00 003F7800  38 C0 00 07 */	li r6, 7
/* 803FAA04 003F7804  38 E0 00 00 */	li r7, 0
/* 803FAA08 003F7808  39 00 00 07 */	li r8, 7
/* 803FAA0C 003F780C  39 20 00 00 */	li r9, 0
/* 803FAA10 003F7810  39 40 00 01 */	li r10, 1
/* 803FAA14 003F7814  48 02 80 75 */	bl HSD_TExpColorIn
/* 803FAA18 003F7818  7F 03 C3 78 */	mr r3, r24
/* 803FAA1C 003F781C  38 80 00 00 */	li r4, 0
/* 803FAA20 003F7820  38 A0 00 00 */	li r5, 0
/* 803FAA24 003F7824  38 C0 00 00 */	li r6, 0
/* 803FAA28 003F7828  38 E0 00 01 */	li r7, 1
/* 803FAA2C 003F782C  48 02 79 BD */	bl HSD_TExpAlphaOp
/* 803FAA30 003F7830  80 01 00 10 */	lwz r0, 0x10(r1)
/* 803FAA34 003F7834  7F 03 C3 78 */	mr r3, r24
/* 803FAA38 003F7838  38 80 00 07 */	li r4, 7
/* 803FAA3C 003F783C  38 A0 00 00 */	li r5, 0
/* 803FAA40 003F7840  90 01 00 08 */	stw r0, 8(r1)
/* 803FAA44 003F7844  38 C0 00 07 */	li r6, 7
/* 803FAA48 003F7848  38 E0 00 00 */	li r7, 0
/* 803FAA4C 003F784C  39 00 00 07 */	li r8, 7
/* 803FAA50 003F7850  39 20 00 00 */	li r9, 0
/* 803FAA54 003F7854  39 40 00 05 */	li r10, 5
/* 803FAA58 003F7858  48 02 85 31 */	bl HSD_TExpAlphaIn
/* 803FAA5C 003F785C  7F 03 C3 78 */	mr r3, r24
/* 803FAA60 003F7860  48 00 00 08 */	b lbl_803FAA68
lbl_803FAA64:
/* 803FAA64 003F7864  80 61 00 14 */	lwz r3, 0x14(r1)
lbl_803FAA68:
/* 803FAA68 003F7868  39 61 00 40 */	addi r11, r1, 0x40
/* 803FAA6C 003F786C  4B FB 31 29 */	bl _restgpr_24
/* 803FAA70 003F7870  80 01 00 44 */	lwz r0, 0x44(r1)
/* 803FAA74 003F7874  7C 08 03 A6 */	mtlr r0
/* 803FAA78 003F7878  38 21 00 40 */	addi r1, r1, 0x40
/* 803FAA7C 003F787C  4E 80 00 20 */	blr 
}

void HSD_MObjCompileTev(HSD_MObj* mobj)
{
    HSD_TObj* sp8;
    HSD_TObj** var_r31 = NULL;
    HSD_TExp* texp;

    if (mobj == NULL) {
        return;
    }
    if (mobj->tevdesc != NULL) {
        HSD_TExpFreeTevDesc(mobj->tevdesc);
        mobj->tevdesc = NULL;
    }
    if (mobj->texp != NULL) {
        HSD_TExpFreeList(mobj->texp, HSD_TE_ALL, 1);
        mobj->texp = NULL;
    }
    sp8 = mobj->tobj;
    if (mobj->rendermode & RENDER_SHADOW && tobj_shadows != NULL) {
        var_r31 = &sp8;
        while (*var_r31 != NULL) {
            var_r31 = &(*var_r31)->next;
        }
        *var_r31 = tobj_shadows;
    }
    if (mobj->rendermode & RENDER_TOON && tobj_toon != NULL && tobj_toon->imagedesc != NULL) {
        tobj_toon->next = sp8;
        sp8 = tobj_toon;
    }
    HSD_TObjAssignResources(sp8);
    texp = HSD_MOBJ_METHOD(mobj)->make_texp(mobj, sp8, &mobj->texp);
    HSD_TExpCompile(texp, &mobj->tevdesc, &mobj->texp);
    if (var_r31 != NULL) {
        *var_r31 = NULL;
    }
}

void MObjSetupTev(HSD_MObj* mobj, HSD_TObj* tobj, u32 rendermode)
{
    if (mobj->tevdesc == NULL) {
        __assert(lbl_805DCAA0, 0x31E, "mobj->tevdesc");
    }
    HSD_TExpSetupTev(mobj->tevdesc, mobj->texp);
    HSD_TObjSetupVolatileTev(tobj, rendermode);
}

void HSD_MObjSetup(HSD_MObj* mobj, u32 rendermode)
{
    HSD_TObj* tobj;
    GXColor sp10;
    GXColor spC;
    GXColor sp8;
    HSD_TObj** tail;

    HSD_StateInitTev();
    rendermode = mobj->rendermode;
    sp8 = mobj->mat->specular;
    spC = mobj->mat->diffuse;
    sp10 = mobj->mat->ambient;
    HSD_SetMaterialColor(&sp10, &spC, &sp8, mobj->mat, mobj->mat->alpha);
    if (rendermode & RENDER_SPECULAR) {
        HSD_SetMaterialShininess(mobj->mat, mobj->mat->shininess);
    }
    tail = NULL;
    tobj = mobj->tobj;
    if (rendermode & RENDER_SHADOW && tobj_shadows != NULL) {
        tail = &tobj;
        while (*tail != NULL) {
            tail = &(*tail)->next;
        }
        *tail = tobj_shadows;
    }
    if (rendermode & RENDER_TOON && tobj_toon != NULL && tobj_toon->imagedesc != NULL) {
        tobj_toon->next = tobj;
        tobj = tobj_toon;
    }
    HSD_TObjSetup(tobj);
    HSD_TObjSetupTextureCoordGen(tobj);
    HSD_MOBJ_METHOD(mobj)->setup_tev(mobj, tobj, rendermode);
    HSD_SetupRenderModeWithCustomPE(rendermode, mobj->pe);
    if (tail != NULL) {
        *tail = NULL;
    }
}

void HSD_MObjUnset(HSD_MObj* mobj, u32 rendermode)
{
    HSD_TObjSetup(NULL);
}

void HSD_MObjSetAlpha(HSD_MObj* mobj, f32 alpha)
{
    if (mobj == NULL || mobj->mat == NULL) {
        return;
    }
    mobj->mat->alpha = alpha;
}

HSD_TObj* HSD_MObjGetTObj(HSD_MObj* mobj)
{
    if (mobj == NULL) {
        return NULL;
    }
    return mobj->tobj;
}

void HSD_MObjRemove(HSD_MObj* mobj)
{
    if (mobj != NULL) {
        HSD_CLASS_METHOD(mobj)->release((HSD_Class*)mobj);
        HSD_CLASS_METHOD(mobj)->destroy((HSD_Class*)mobj);
    }
}

HSD_MObj* HSD_MObjAlloc(void)
{
    HSD_MObj* temp_r3;

    temp_r3 = hsdNew((HSD_ClassInfo*) HSD_MObjGetDefaultClass());
    if (temp_r3 == NULL) {
        __assert(lbl_805DCAA0, 0x44A, "mobj");
    }
    return temp_r3;
}

HSD_Material* HSD_MaterialAlloc(void)
{
    HSD_Material* mat = hsdAllocMemPiece(sizeof(HSD_Material));
    if (mat == NULL)
        __assert(lbl_805DCAA0, 0x466, "mat");
    memset(mat, 0, sizeof(HSD_Material));
    mat->alpha = 1.0F;
    return mat;
}

void HSD_MObjAddShadowTexture(HSD_TObj* tobj)
{
    HSD_TObj* tp;
    if (tobj == NULL)
        __assert(lbl_805DCAA0, 0x495, "tobj");
    for (tp = tobj_shadows; tp != NULL; tp = tp->next) {
        if (tp == tobj)
            return;
    }
    tobj->next = tobj_shadows;
    tobj_shadows = tobj;
}

void HSD_MObjDeleteShadowTexture(HSD_TObj* tobj)
{
    if (tobj != NULL) {
        HSD_TObj** tp;
        for (tp = &tobj_shadows; *tp != NULL; tp = &(*tp)->next) {
            if (*tp == tobj) {
                *tp = tobj->next;
                tobj->next = NULL;
                return;
            }
        }
    } else {
        while (tobj_shadows != NULL) {
            HSD_TObj* next = tobj_shadows->next;
            tobj_shadows->next = NULL;
            tobj_shadows = next;
        }
    }
}

void MObjRelease(HSD_Class* o)
{
    HSD_MObj* mobj = HSD_MOBJ(o);

    HSD_AObjRemove(mobj->aobj);
    hsdFreeMemPiece(mobj->mat, sizeof(HSD_Material));
    HSD_TObjRemoveAll(mobj->tobj);

    if (mobj->tevdesc != NULL)
        HSD_TExpFreeTevDesc(mobj->tevdesc);
    if (mobj->texp != NULL)
        HSD_TExpFreeList(mobj->texp, HSD_TE_ALL, 1);
    if (mobj->pe != NULL)
        hsdFreeMemPiece(mobj->pe, sizeof(HSD_PEDesc));
    HSD_PARENT_INFO(&hsdMObj)->release(o);
}

void MObjAmnesia(HSD_ClassInfo* info)
{
    if (info == HSD_CLASS_INFO(default_class)) {
        default_class = NULL;
    }
    if (info == HSD_CLASS_INFO(&hsdMObj)) {
        tobj_toon = NULL;
        tobj_shadows = NULL;
    }
    HSD_PARENT_INFO(&hsdMObj)->amnesia(info);
}

#pragma push
#pragma force_active on
static u32 unused1[] = {
    0x00000000,
    0x00000000,
    0x00000007,
    0x00000013,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000004,
    0x3F800000,
    0x00000001,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
static char unused2[] = "cannot allocate tobj for toon.";
static char unused3[] = "tobj_toon";
#pragma pop

extern HSD_ClassInfo hsdClass;

void MObjInfoInit(void)
{
    hsdInitClassInfo(HSD_CLASS_INFO(&hsdMObj), HSD_CLASS_INFO(&hsdClass),
            "sysdolphin_base_library", "hsd_mobj",
            sizeof(HSD_MObjInfo), sizeof(HSD_MObj));

    HSD_CLASS_INFO(&hsdMObj)->release = MObjRelease;
    HSD_CLASS_INFO(&hsdMObj)->amnesia = MObjAmnesia;
    HSD_MOBJ_INFO(&hsdMObj)->setup = HSD_MObjSetup;
    HSD_MOBJ_INFO(&hsdMObj)->unset = HSD_MObjUnset;
    HSD_MOBJ_INFO(&hsdMObj)->load = MObjLoad;
    HSD_MOBJ_INFO(&hsdMObj)->make_texp = MObjMakeTExp;
    HSD_MOBJ_INFO(&hsdMObj)->setup_tev = MObjSetupTev;
    HSD_MOBJ_INFO(&hsdMObj)->update = MObjUpdateFunc;
}
