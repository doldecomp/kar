#ifndef _dobj_h_
#define _dobj_h_

#include "dolphin/types.h"

#include "object.h"

void HSD_DObjSetCurrent(dobj);

u16 HSD_dobjGetFlags(HSD_dobj* dobj);

void HSD_DObjSetFlags(int dobj,u8 flags);

#endif
