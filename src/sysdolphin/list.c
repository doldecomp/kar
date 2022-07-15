#include <sysdolphin/list.h>

extern HSD_ObjAllocData lbl_8058BE28;
extern HSD_ObjAllocData lbl_8058BE54;

void HSD_ListInitAllocData()
{
    HSD_ObjAllocInit(&lbl_8058BE28, sizeof(HSD_SList), 4);
    HSD_ObjAllocInit(&lbl_8058BE54, sizeof(HSD_DList), 4);
}

HSD_ObjAllocData* HSD_SListGetAllocData()
{
    return &lbl_8058BE28;
}

HSD_ObjAllocData* HSD_DListGetAllocData()
{
    return &lbl_8058BE54;
}
