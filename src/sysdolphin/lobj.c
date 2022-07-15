#include "lobj.h"

extern s32 lightmask_diffuse;
extern s32 lightmask_attnfunc;
extern s32 lightmask_alpha;
extern s32 lightmask_specular;

extern s32 nb_active_lights;

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

s32 func_803FF8E4(void);
extern s32 lbl_805899B0[10];

s32 func_803FDB3C(void)
{
    s32 temp_r3 = func_803FF8E4();
    if (temp_r3 >= 0 && temp_r3 < 9) {
        return lbl_805899B0[temp_r3];
    }
    return 0;
}

s32 func_803FDB84(s32 arg0)
{
    if (arg0 >= 0 && arg0 < 8) {
        return lbl_805899B0[arg0];
    }
    return 0;
}
