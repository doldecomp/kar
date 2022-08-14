#include "fog.h"

extern HSD_Fog* lbl_805DE2E8;

void FogInfoInit(void);
void FogAdjInfoInit(void);

HSD_FogInfo hsdFog = { FogInfoInit };
HSD_FogAdjInfo hsdFogAdj = { FogAdjInfoInit };

void func_8041B0D0(HSD_Fog* fog)
{
    lbl_805DE2E8 = fog;
    HSD_FogSet(fog);
}

HSD_Fog* func_8041B0F4(void)
{
    return lbl_805DE2E8;
}
