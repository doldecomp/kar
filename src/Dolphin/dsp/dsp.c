#include "dolphin/types.h"
//#include <stdlib.h>
//#include <stddef.h>

//#include "DSPAssert.h"
//#include "dsp_private.h"

//static BOOL __DSP_init_flag = FALSE;

volatile u16 __DSPRegs[] : 0xcc005000;

#define DSP_CDMBHI_IDX 0
#define DSP_CDMBLO_IDX 1
#define DSP_DCMBHI_IDX 2
#define DSP_DCMBLO_IDX 3

//extern DSPTaskInfo *__DSP_curr_task;
//extern DSPTaskInfo *__DSP_first_task;
//extern DSPTaskInfo *__DSP_last_task;
//extern DSPTaskInfo *__DSP_tmp_task;

//extern DSPTaskInfo *__DSP_rude_task;

//extern BOOL         __DSP_rude_task_pending;

s32 DSPCheckMailToDSP(void)
{
    //return ((u32) *(u16 *)__DSPRegs[DSP_CDMBHI_IDX] >> 0xFU) & 1;
    return ((u32) *(u16 *)0xcc005000 >> 0xFU) & 1;
}

s32 DSPCheckMailFromDSP(void)
{
    //return ((u32) *(u16 *)__DSPRegs[DSP_DCMBHI_IDX] >> 0xFU) & 1;
    return ((u32) *(u16 *)0xcc005004 >> 0xFU) & 1;
}

s32 DSPReadMailFromDSP(void)
{
    return (__DSPRegs[DSP_DCMBHI_IDX] << 16) | __DSPRegs[DSP_DCMBLO_IDX];
}

void DSPSendMailToDSP(u32 mail)
{
    __DSPRegs[DSP_CDMBHI_IDX] = (u16)((mail >> 16) & 0xffff);
    __DSPRegs[DSP_CDMBLO_IDX] = (u16)(mail & 0xffff);
}