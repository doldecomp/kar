#include "object.h"

extern HSD_ClassInfo objInfo; // hsdObj
extern const char sysdolphin_base_library[24]; // "sysdolphin_base_library\0"
extern HSD_ClassInfo hsdClass; // hsdClass
extern char hsd_obj[8]; // "hsd_obj\0"

void ObjInfoInit(void)
{
    hsdInitClassInfo(&objInfo, &hsdClass, sysdolphin_base_library, hsd_obj, sizeof(HSD_ObjInfo), sizeof(HSD_Obj));
}
