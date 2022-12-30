#include "lobj.h"

extern s32 lightmask_diffuse;
extern s32 lightmask_attnfunc;
extern s32 lightmask_alpha;
extern s32 lightmask_specular;
extern s32 nb_active_lights;

void LObjInfoInit(void);
HSD_LObjInfo hsdLObj = { LObjInfoInit };

HSD_LObj* active_lights[MAX_GXLIGHT];

s32 HSD_LightID2Index(u32);

u32 HSD_LObjGetFlags(HSD_LObj* lobj)
{
    return (lobj) ? lobj->flags : 0;
}

void HSD_LObjSetFlags(HSD_LObj* lobj, u32 flags)
{
    if (lobj == NULL)
        return;
    lobj->flags |= flags;
}

void HSD_LObjClearFlags(HSD_LObj* lobj, u32 flags)
{
    if (lobj == NULL)
        return;
    lobj->flags &= ~flags;
}

s32 HSD_LObjGetLightMaskDiffuse(void)
{
    return lightmask_diffuse;
}

s32 HSD_LObjGetLightMaskAttnFunc(void)
{
    return lightmask_attnfunc;
}

s32 HSD_LObjGetLightMaskAlpha(void)
{
    return lightmask_alpha;
}

s32 HSD_LObjGetLightMaskSpecular(void)
{
    return lightmask_specular;
}

s32 HSD_LObjGetNbActive(void)
{
    return nb_active_lights;
}

HSD_LObj* HSD_LObjGetActiveByID(u32 id)
{
    s32 idx = HSD_LightID2Index(id);
    if (idx >= 0 && idx < 9) {
        return active_lights[idx];
    }
    return NULL;
}

HSD_LObj* HSD_LObjGetActiveByIndex(s32 idx)
{
    if (idx >= 0 && idx < 8) {
        return active_lights[idx];
    }
    return NULL;
}

inline f32 HSD_ClampFloat(f32 val, f32 min, f32 max)
{
    if (val <= min) {
        return min;
    } else if (val >= max) {
        return max;
    }
    return val;
}

void LObjUpdateFunc(HSD_LObj* lobj, s32 type, FObjData* val)
{
    if (lobj == NULL) {
        return;
    }
    switch (type) {
    case HSD_A_L_VIS:
        if (val->fv >= 0.5) {
            lobj->flags &= ~0x20;
        } else {
            lobj->flags |= 0x20;
        }
        break;
    case HSD_A_L_A0:
    case HSD_A_L_CUTOFF:
        if (lobj->flags & 0x40) {
            lobj->u.attn.a0 = val->fv;
        } else {
            lobj->u.spot.cutoff = val->fv;
        }
        break;
    case HSD_A_L_A1:
    case HSD_A_L_REFDIST:
        if (lobj->flags & 0x40) {
            lobj->u.attn.a1 = val->fv;
        } else {
            lobj->u.spot.ref_dist = val->fv;
        }
        break;
    case HSD_A_L_A2:
    case HSD_A_L_REFBRIGHT:
        if (lobj->flags & 0x40) {
            lobj->u.attn.a2 = val->fv;
        } else {
            lobj->u.spot.ref_br = val->fv;
        }
        break;
    case HSD_A_L_K0:
        if (lobj->flags & 0x40) {
            lobj->u.attn.k0 = val->fv;
        }
        break;
    case HSD_A_L_K1:
        if (lobj->flags & 0x40) {
            lobj->u.attn.k1 = val->fv;
        }
        break;
    case HSD_A_L_K2:
        if (lobj->flags & 0x40) {
            lobj->u.attn.k2 = val->fv;
        }
        break;
    case HSD_A_L_LITC_R:
        lobj->color.r = 255.0F * HSD_ClampFloat(val->fv, 0, 1);
        break;
    case HSD_A_L_LITC_G:
        lobj->color.g = 255.0F * HSD_ClampFloat(val->fv, 0, 1);
        break;
    case HSD_A_L_LITC_B:
        lobj->color.b = 255.0F * HSD_ClampFloat(val->fv, 0, 1);
        break;
    case HSD_A_L_LITC_A:
        lobj->color.a = 255.0F * HSD_ClampFloat(val->fv, 0, 1);
        break;
    }
}

void HSD_LObjAnim(HSD_LObj* lobj)
{
    if (lobj != NULL) {
        HSD_AObjInterpretAnim(lobj->aobj, lobj, HSD_LOBJ_METHOD(lobj)->update);
        HSD_WObjInterpretAnim(HSD_LObjGetPositionWObj(lobj));
        HSD_WObjInterpretAnim(HSD_LObjGetInterestWObj(lobj));
    }
}

void HSD_LObjAnimAll(HSD_LObj* lobj)
{
    if (lobj != NULL) {
        HSD_LObj* cur;
        for (cur = lobj; cur != NULL; cur = cur->next) {
            HSD_LObjAnim(cur);
        }
    }
}

void HSD_LObjReqAnim(HSD_LObj* lobj, f32 startframe)
{
    if (lobj != NULL) {
        HSD_AObjReqAnim(lobj->aobj, startframe);
        HSD_WObjReqAnim(HSD_LObjGetPositionWObj(lobj), startframe);
        HSD_WObjReqAnim(HSD_LObjGetInterestWObj(lobj), startframe);
    }
}

void HSD_LObjReqAnimAll(HSD_LObj* lobj, f32 startframe)
{
    if (lobj != NULL) {
        HSD_LObj* cur;
        for (cur = lobj; cur != NULL; cur = cur->next) {
            HSD_LObjReqAnim(cur, startframe);
        }
    }
}

extern f32 lbl_805DC8B8[];

inline BOOL TryNormalize(Vec* v)
{
    if (v == NULL || v == NULL) {
        return ~0;
    }
    if (__fabs(v->x) <= lbl_805DC8B8[0] &&
        __fabs(v->y) <= lbl_805DC8B8[0] &&
        __fabs(v->z) <= lbl_805DC8B8[0]) {
        return ~0;
    }
    PSVECNormalize(v, v);
    return 0;
}

void HSD_LObjGetLightVector(HSD_LObj* lobj, Vec* v)
{
    Vec position = { 0, 0, 0 };
    Vec interest = { 0, 0, 0 };

    if (lobj == NULL) {
        return;
    }
    HSD_LObjGetPosition(lobj, &position);
    HSD_LObjGetInterest(lobj, &interest);
    PSVECSubtract(&interest, &position, v);
    if (TryNormalize(v)) {
        v->x = 0;
        v->y = 0;
        v->z = 1;
    }
}

void GXInitLightAttn(GXLightObj*, f32, f32, f32, f32, f32, f32);
extern f32 lbl_805E5A34;

void HSD_LObjSetup(HSD_LObj* lobj, GXColor* color, f32 arg8)
{
    if (lobj->flags & LOBJ_HIDDEN || HSD_LObjGetType(lobj) == LOBJ_AMBIENT) {
        return;
    }
    if (lobj->flags & (LOBJ_DIFFUSE | LOBJ_ALPHA)) {
        if (lobj->hw_color.r != color->r || lobj->hw_color.g != color->g ||
            lobj->hw_color.b != color->b || lobj->hw_color.a != color->a) {
            func_803CD230(&lobj->lightobj, *color);
            lobj->hw_color = *color;
            lobj->flags |= LOBJ_DIFF_DIRTY;
        }
        if (lobj->flags & LOBJ_DIFF_DIRTY) {
            GXLoadLightObjImm(&lobj->lightobj, lobj->id);
            lobj->flags &= ~LOBJ_DIFF_DIRTY;
        }
    }
    if (lobj->spec_id != 0) {
        if (lobj->shininess != arg8) {
            f32 temp_f4 = arg8 * lbl_805E5A34;
            lobj->shininess = arg8;
            GXInitLightAttn(&lobj->spec_lightobj, 0.0f, 0.0f, 1.0f, temp_f4, 0.0f, 1.0f - temp_f4);
            lobj->flags |= LOBJ_SPEC_DIRTY;
        }
        if (lobj->flags & LOBJ_SPEC_DIRTY) {
            GXLoadLightObjImm(&lobj->spec_lightobj, lobj->spec_id);
            lobj->flags &= ~LOBJ_SPEC_DIRTY;
        }
    }
}

extern f32 lbl_805E5A38;
extern char lbl_805DCAD8[8];
extern char lbl_805DCAE0[8];
extern void func_803CD214();
extern void func_803D2098();
asm void func_803FE234()
{
    nofralloc
/* 803FE234 003FB034  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 803FE238 003FB038  7C 08 02 A6 */	mflr r0
/* 803FE23C 003FB03C  3C 80 80 5E */	lis r4, lbl_805DC8B8@ha
/* 803FE240 003FB040  90 01 00 54 */	stw r0, 0x54(r1)
/* 803FE244 003FB044  93 E1 00 4C */	stw r31, 0x4c(r1)
/* 803FE248 003FB048  93 C1 00 48 */	stw r30, 0x48(r1)
/* 803FE24C 003FB04C  93 A1 00 44 */	stw r29, 0x44(r1)
/* 803FE250 003FB050  93 81 00 40 */	stw r28, 0x40(r1)
/* 803FE254 003FB054  C0 03 00 0C */	lfs f0, 0xc(r3)
/* 803FE258 003FB058  D0 01 00 20 */	stfs f0, 0x20(r1)
/* 803FE25C 003FB05C  FC 20 02 10 */	fabs f1, f0
/* 803FE260 003FB060  C0 04 C8 B8 */	lfs f0, lbl_805DC8B8@l(r4)
/* 803FE264 003FB064  C0 43 00 1C */	lfs f2, 0x1c(r3)
/* 803FE268 003FB068  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 803FE26C 003FB06C  D0 41 00 24 */	stfs f2, 0x24(r1)
/* 803FE270 003FB070  C0 23 00 2C */	lfs f1, 0x2c(r3)
/* 803FE274 003FB074  D0 21 00 28 */	stfs f1, 0x28(r1)
/* 803FE278 003FB078  4C 40 13 82 */	cror 2, 0, 2
/* 803FE27C 003FB07C  40 82 00 2C */	bne lbl_803FE2A8
/* 803FE280 003FB080  FC 40 12 10 */	fabs f2, f2
/* 803FE284 003FB084  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 803FE288 003FB088  4C 40 13 82 */	cror 2, 0, 2
/* 803FE28C 003FB08C  40 82 00 1C */	bne lbl_803FE2A8
/* 803FE290 003FB090  FC 20 0A 10 */	fabs f1, f1
/* 803FE294 003FB094  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 803FE298 003FB098  4C 40 13 82 */	cror 2, 0, 2
/* 803FE29C 003FB09C  40 82 00 0C */	bne lbl_803FE2A8
/* 803FE2A0 003FB0A0  38 00 FF FF */	li r0, -1
/* 803FE2A4 003FB0A4  48 00 00 14 */	b lbl_803FE2B8
lbl_803FE2A8:
/* 803FE2A8 003FB0A8  38 61 00 20 */	addi r3, r1, 0x20
/* 803FE2AC 003FB0AC  38 81 00 2C */	addi r4, r1, 0x2c
/* 803FE2B0 003FB0B0  4B FD 3E 4D */	bl PSVECNormalize
/* 803FE2B4 003FB0B4  38 00 00 00 */	li r0, 0
lbl_803FE2B8:
/* 803FE2B8 003FB0B8  2C 00 00 00 */	cmpwi r0, 0
/* 803FE2BC 003FB0BC  41 82 00 18 */	beq lbl_803FE2D4
/* 803FE2C0 003FB0C0  C0 22 F3 28 */	lfs f1, 0.0f
/* 803FE2C4 003FB0C4  C0 02 F3 38 */	lfs f0, lbl_805E5A38
/* 803FE2C8 003FB0C8  D0 21 00 2C */	stfs f1, 0x2c(r1)
/* 803FE2CC 003FB0CC  D0 21 00 30 */	stfs f1, 0x30(r1)
/* 803FE2D0 003FB0D0  D0 01 00 34 */	stfs f0, 0x34(r1)
lbl_803FE2D4:
/* 803FE2D4 003FB0D4  3C 60 80 59 */	lis r3, active_lights@ha
/* 803FE2D8 003FB0D8  83 CD 11 30 */	lwz r30, nb_active_lights(r13)
/* 803FE2DC 003FB0DC  3B A3 99 B0 */	addi r29, r3, active_lights@l
/* 803FE2E0 003FB0E0  3B 80 00 00 */	li r28, 0
/* 803FE2E4 003FB0E4  48 00 01 AC */	b lbl_803FE490
lbl_803FE2E8:
/* 803FE2E8 003FB0E8  2C 1C 00 00 */	cmpwi r28, 0
/* 803FE2EC 003FB0EC  41 80 00 14 */	blt lbl_803FE300
/* 803FE2F0 003FB0F0  2C 1C 00 08 */	cmpwi r28, 8
/* 803FE2F4 003FB0F4  40 80 00 0C */	bge lbl_803FE300
/* 803FE2F8 003FB0F8  83 FD 00 00 */	lwz r31, 0(r29)
/* 803FE2FC 003FB0FC  48 00 00 08 */	b lbl_803FE304
lbl_803FE300:
/* 803FE300 003FB100  3B E0 00 00 */	li r31, 0
lbl_803FE304:
/* 803FE304 003FB104  80 1F 00 90 */	lwz r0, 0x90(r31)
/* 803FE308 003FB108  2C 00 00 00 */	cmpwi r0, 0
/* 803FE30C 003FB10C  41 82 01 7C */	beq lbl_803FE488
/* 803FE310 003FB110  A0 1F 00 08 */	lhz r0, 8(r31)
/* 803FE314 003FB114  54 00 07 BE */	clrlwi r0, r0, 0x1e
/* 803FE318 003FB118  2C 00 00 01 */	cmpwi r0, 1
/* 803FE31C 003FB11C  41 82 00 B0 */	beq lbl_803FE3CC
/* 803FE320 003FB120  41 80 00 C0 */	blt lbl_803FE3E0
/* 803FE324 003FB124  2C 00 00 04 */	cmpwi r0, 4
/* 803FE328 003FB128  40 80 00 B8 */	bge lbl_803FE3E0
/* 803FE32C 003FB12C  38 61 00 20 */	addi r3, r1, 0x20
/* 803FE330 003FB130  38 9F 00 3C */	addi r4, r31, 0x3c
/* 803FE334 003FB134  38 A1 00 08 */	addi r5, r1, 8
/* 803FE338 003FB138  4B FD 3D 85 */	bl PSVECSubtract
/* 803FE33C 003FB13C  C0 01 00 08 */	lfs f0, 8(r1)
/* 803FE340 003FB140  3C 60 80 5E */	lis r3, lbl_805DC8B8@ha
/* 803FE344 003FB144  C0 23 C8 B8 */	lfs f1, lbl_805DC8B8@l(r3)
/* 803FE348 003FB148  FC 00 02 10 */	fabs f0, f0
/* 803FE34C 003FB14C  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 803FE350 003FB150  4C 40 13 82 */	cror 2, 0, 2
/* 803FE354 003FB154  40 82 00 34 */	bne lbl_803FE388
/* 803FE358 003FB158  C0 01 00 0C */	lfs f0, 0xc(r1)
/* 803FE35C 003FB15C  FC 00 02 10 */	fabs f0, f0
/* 803FE360 003FB160  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 803FE364 003FB164  4C 40 13 82 */	cror 2, 0, 2
/* 803FE368 003FB168  40 82 00 20 */	bne lbl_803FE388
/* 803FE36C 003FB16C  C0 01 00 10 */	lfs f0, 0x10(r1)
/* 803FE370 003FB170  FC 00 02 10 */	fabs f0, f0
/* 803FE374 003FB174  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 803FE378 003FB178  4C 40 13 82 */	cror 2, 0, 2
/* 803FE37C 003FB17C  40 82 00 0C */	bne lbl_803FE388
/* 803FE380 003FB180  38 00 FF FF */	li r0, -1
/* 803FE384 003FB184  48 00 00 14 */	b lbl_803FE398
lbl_803FE388:
/* 803FE388 003FB188  38 61 00 08 */	addi r3, r1, 8
/* 803FE38C 003FB18C  7C 64 1B 78 */	mr r4, r3
/* 803FE390 003FB190  4B FD 3D 6D */	bl PSVECNormalize
/* 803FE394 003FB194  38 00 00 00 */	li r0, 0
lbl_803FE398:
/* 803FE398 003FB198  2C 00 00 00 */	cmpwi r0, 0
/* 803FE39C 003FB19C  40 82 00 18 */	bne lbl_803FE3B4
/* 803FE3A0 003FB1A0  38 61 00 08 */	addi r3, r1, 8
/* 803FE3A4 003FB1A4  38 81 00 2C */	addi r4, r1, 0x2c
/* 803FE3A8 003FB1A8  38 A1 00 14 */	addi r5, r1, 0x14
/* 803FE3AC 003FB1AC  4B FD 3C ED */	bl func_803D2098
/* 803FE3B0 003FB1B0  48 00 00 40 */	b lbl_803FE3F0
lbl_803FE3B4:
/* 803FE3B4 003FB1B4  C0 22 F3 28 */	lfs f1, 0.0f
/* 803FE3B8 003FB1B8  C0 02 F3 2C */	lfs f0, 1.0f
/* 803FE3BC 003FB1BC  D0 21 00 14 */	stfs f1, 0x14(r1)
/* 803FE3C0 003FB1C0  D0 21 00 18 */	stfs f1, 0x18(r1)
/* 803FE3C4 003FB1C4  D0 01 00 1C */	stfs f0, 0x1c(r1)
/* 803FE3C8 003FB1C8  48 00 00 A0 */	b lbl_803FE468
lbl_803FE3CC:
/* 803FE3CC 003FB1CC  38 7F 00 3C */	addi r3, r31, 0x3c
/* 803FE3D0 003FB1D0  38 81 00 2C */	addi r4, r1, 0x2c
/* 803FE3D4 003FB1D4  38 A1 00 14 */	addi r5, r1, 0x14
/* 803FE3D8 003FB1D8  4B FD 3C C1 */	bl func_803D2098
/* 803FE3DC 003FB1DC  48 00 00 14 */	b lbl_803FE3F0
lbl_803FE3E0:
/* 803FE3E0 003FB1E0  38 6D F9 F8 */	la r3, lbl_805DCAD8
/* 803FE3E4 003FB1E4  38 80 02 7A */	li r4, 0x27a
/* 803FE3E8 003FB1E8  38 AD FA 00 */	la r5, lbl_805DCAE0
/* 803FE3EC 003FB1EC  48 02 A0 CD */	bl __assert
lbl_803FE3F0:
/* 803FE3F0 003FB1F0  C0 01 00 14 */	lfs f0, 0x14(r1)
/* 803FE3F4 003FB1F4  3C 60 80 5E */	lis r3, lbl_805DC8B8@ha
/* 803FE3F8 003FB1F8  C0 23 C8 B8 */	lfs f1, lbl_805DC8B8@l(r3)
/* 803FE3FC 003FB1FC  FC 00 02 10 */	fabs f0, f0
/* 803FE400 003FB200  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 803FE404 003FB204  4C 40 13 82 */	cror 2, 0, 2
/* 803FE408 003FB208  40 82 00 34 */	bne lbl_803FE43C
/* 803FE40C 003FB20C  C0 01 00 18 */	lfs f0, 0x18(r1)
/* 803FE410 003FB210  FC 00 02 10 */	fabs f0, f0
/* 803FE414 003FB214  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 803FE418 003FB218  4C 40 13 82 */	cror 2, 0, 2
/* 803FE41C 003FB21C  40 82 00 20 */	bne lbl_803FE43C
/* 803FE420 003FB220  C0 01 00 1C */	lfs f0, 0x1c(r1)
/* 803FE424 003FB224  FC 00 02 10 */	fabs f0, f0
/* 803FE428 003FB228  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 803FE42C 003FB22C  4C 40 13 82 */	cror 2, 0, 2
/* 803FE430 003FB230  40 82 00 0C */	bne lbl_803FE43C
/* 803FE434 003FB234  38 00 FF FF */	li r0, -1
/* 803FE438 003FB238  48 00 00 14 */	b lbl_803FE44C
lbl_803FE43C:
/* 803FE43C 003FB23C  38 61 00 14 */	addi r3, r1, 0x14
/* 803FE440 003FB240  7C 64 1B 78 */	mr r4, r3
/* 803FE444 003FB244  4B FD 3C B9 */	bl PSVECNormalize
/* 803FE448 003FB248  38 00 00 00 */	li r0, 0
lbl_803FE44C:
/* 803FE44C 003FB24C  2C 00 00 00 */	cmpwi r0, 0
/* 803FE450 003FB250  41 82 00 18 */	beq lbl_803FE468
/* 803FE454 003FB254  C0 22 F3 28 */	lfs f1, 0.0f
/* 803FE458 003FB258  C0 02 F3 2C */	lfs f0, 1.0f
/* 803FE45C 003FB25C  D0 21 00 14 */	stfs f1, 0x14(r1)
/* 803FE460 003FB260  D0 21 00 18 */	stfs f1, 0x18(r1)
/* 803FE464 003FB264  D0 01 00 1C */	stfs f0, 0x1c(r1)
lbl_803FE468:
/* 803FE468 003FB268  C0 21 00 14 */	lfs f1, 0x14(r1)
/* 803FE46C 003FB26C  38 7F 00 94 */	addi r3, r31, 0x94
/* 803FE470 003FB270  C0 41 00 18 */	lfs f2, 0x18(r1)
/* 803FE474 003FB274  C0 61 00 1C */	lfs f3, 0x1c(r1)
/* 803FE478 003FB278  4B FC ED 9D */	bl func_803CD214
/* 803FE47C 003FB27C  A0 1F 00 08 */	lhz r0, 8(r31)
/* 803FE480 003FB280  60 00 01 00 */	ori r0, r0, 0x100
/* 803FE484 003FB284  B0 1F 00 08 */	sth r0, 8(r31)
lbl_803FE488:
/* 803FE488 003FB288  3B BD 00 04 */	addi r29, r29, 4
/* 803FE48C 003FB28C  3B 9C 00 01 */	addi r28, r28, 1
lbl_803FE490:
/* 803FE490 003FB290  7C 1C F0 00 */	cmpw r28, r30
/* 803FE494 003FB294  41 80 FE 54 */	blt lbl_803FE2E8
/* 803FE498 003FB298  80 01 00 54 */	lwz r0, 0x54(r1)
/* 803FE49C 003FB29C  83 E1 00 4C */	lwz r31, 0x4c(r1)
/* 803FE4A0 003FB2A0  83 C1 00 48 */	lwz r30, 0x48(r1)
/* 803FE4A4 003FB2A4  83 A1 00 44 */	lwz r29, 0x44(r1)
/* 803FE4A8 003FB2A8  83 81 00 40 */	lwz r28, 0x40(r1)
/* 803FE4AC 003FB2AC  7C 08 03 A6 */	mtlr r0
/* 803FE4B0 003FB2B0  38 21 00 50 */	addi r1, r1, 0x50
/* 803FE4B4 003FB2B4  4E 80 00 20 */	blr 
}
