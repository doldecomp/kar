#include <sysdolphin/gobj.h>
#include <sysdolphin/gobjuserdata.h>

void func_80429D0C(HSD_GObj* gobj, u8 kind, void (*remove_func)(void*), void* data)
{
    if (gobj->user_data_kind != HSD_GOBJ_USER_DATA_NONE) {
        __assert(__FILE__, 40, "gobj->user_data_kind == HSD_GOBJ_USER_DATA_NONE");
    }
    gobj->user_data_kind = kind;
    gobj->user_data = data;
    gobj->user_data_remove_func = remove_func;
}

void* func_80429D88(HSD_GObj* gobj)
{
    void* ret;
    if (gobj->user_data_kind != HSD_GOBJ_USER_DATA_NONE) {
        gobj->user_data_kind = HSD_GOBJ_USER_DATA_NONE;
        ret = gobj->user_data;
        gobj->user_data = NULL;
        gobj->user_data_remove_func = NULL;
    } else {
        ret = NULL;
    }
    return ret;
}

void GObj_RemoveUserData(HSD_GObj* gobj)
{
    if (gobj->user_data_kind == HSD_GOBJ_USER_DATA_NONE)
        return;

    if (gobj->user_data_remove_func == NULL) {
        __assert(__FILE__, 99, "gobj->user_data_remove_func");
    }
    (*gobj->user_data_remove_func)(gobj->user_data);
    gobj->user_data_kind = HSD_GOBJ_USER_DATA_NONE;
    gobj->user_data = NULL;
}

