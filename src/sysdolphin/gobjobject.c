#include "gobj.h"

extern void (**lbl_805DE318)(void*);

void func_80429C14(HSD_GObj* gobj, u8 kind, void* obj)
{
    assert_line(42, gobj->obj_kind == HSD_GOBJ_OBJ_NONE);
    gobj->obj_kind = kind;
    gobj->hsd_obj = obj;
}

void* func_80429C80(HSD_GObj* gobj)
{
    void* obj;
    if (gobj->obj_kind != HSD_GOBJ_OBJ_NONE) {
        gobj->obj_kind = HSD_GOBJ_OBJ_NONE;
        obj = gobj->hsd_obj;
        gobj->hsd_obj = NULL;
    } else {
        obj = NULL;
    }
    return obj;
}

void func_80429CB0(HSD_GObj* gobj)
{
    if (gobj->obj_kind != HSD_GOBJ_OBJ_NONE) {
        lbl_805DE318[gobj->obj_kind](gobj->hsd_obj);
        gobj->obj_kind = HSD_GOBJ_OBJ_NONE;
        gobj->hsd_obj = NULL;
    }
}
