#include "object.h"

extern HSD_ClassInfo hsdClass;
static void ObjInfoInit(void);

HSD_ClassInfo objInfo = { ObjInfoInit };

static void ObjInfoInit(void)
{
    hsdInitClassInfo(&objInfo, &hsdClass,
        "sysdolphin_base_library", "hsd_obj",
        sizeof(HSD_ObjInfo), sizeof(HSD_Obj));
}
