#include "dobj.h"

void HSD_DObjSetCurrent(dobj) 
{
    current_dobj = dobj;
    return;
}

u16 HSD_DObjGetFlags(HSD_DObj* dobj)
{
    if (dobj != NULL) {
        return dobj->flags;
    }
    return 0;
}

void HSD_DObjSetFlags(int dobj,u8 flags) 
{
    if (dobj == 0)
    {
        return;
    }
    *(u8 *)(dobj + 0x14) = *(u8 *)(dobj + 0x14) | flags;
    return;
}

