#include "initialize.h"

#include <sysdolphin/video.h>

extern void* FrameBuffer[HSD_VI_XFB_MAX];
extern HSD_MemReport memReport;
extern BOOL init_done;

extern GXRenderModeObj* rmode;

extern int lbl_805DCBC0;
extern int lbl_805DCBBC, lbl_805DE2A8;
void HSD_OSInit();

char lbl_80503C60[] = "initialize.c";

void HSD_InitComponent(void)
{
    void* fifo;
    DVDInit();
    HSD_AllocateXFB(lbl_805DCBC0, rmode);
    fifo = HSD_AllocateFIFO(lbl_805DCBBC);
    lbl_805DE2A8 = GXInit(fifo, lbl_805DCBBC);
    memReport.gxfifo = lbl_805DCBBC;
    HSD_OSInit(lbl_805DE2A8, &memReport);

    {
        HSD_VIStatus vi_status;
        GXColor black = { 0, 0, 0, 0 };

        vi_status.rmode = *rmode;
        vi_status.black = GX_TRUE;
        vi_status.vf = GX_TRUE;
        vi_status.gamma = GX_GM_1_0;
        vi_status.clear_clr = black;
        vi_status.clear_z = GX_MAX_Z24;
        vi_status.update_clr = GX_ENABLE;
        vi_status.update_alpha = GX_ENABLE;
        vi_status.update_z = GX_ENABLE;

        HSD_VIInit(&vi_status, FrameBuffer[0], FrameBuffer[1], FrameBuffer[2]);
    }

    HSD_GXInit();
    HSD_DVDInit();
    HSD_IDSetup();
    VIWaitForRetrace();
    HSD_ObjInit();
    init_done = TRUE;
}

void HSD_DVDInit(void)
{
}
