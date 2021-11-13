#include "src/sysdolphin/aobj.h"

//#include <math.h>

#include "src/sysdolphin/jobj.h"

extern HSD_ObjAllocData aobj_alloc_data;

void HSD_AObjInitAllocData(void)
{
    HSD_ObjAllocInit(&aobj_alloc_data, sizeof(HSD_AObj), 4);
}

HSD_ObjAllocData* HSD_AObjGetAllocData(void)
{
    return &aobj_alloc_data;
}
