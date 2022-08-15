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
extern HSD_LObj* active_lights[10];

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
