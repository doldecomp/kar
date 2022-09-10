#include "gobj.h"

extern HSD_GObj** lbl_805DE334;
extern HSD_GObj** plinklow_gobjs;

extern HSD_ObjAllocData gobj_alloc_data;

extern HSD_GObjLibInitDataType HSD_GObjLibInitData;

void GObj_PReorder(HSD_GObj* gobj, HSD_GObj* hiprio_gobj)
{
    s32 link = gobj->p_link;
    gobj->prev = hiprio_gobj;
    if (hiprio_gobj != NULL) {
        gobj->next = hiprio_gobj->next;
        hiprio_gobj->next = gobj;
    } else {
        gobj->next = lbl_805DE334[link];
        lbl_805DE334[link] = gobj;
    }
    if (gobj->next != NULL) {
        gobj->next->prev = gobj;
    } else {
        plinklow_gobjs[link] = gobj;
    }
}

inline HSD_GObj* gobj_allocate(void)
{
    return HSD_ObjAlloc(&gobj_alloc_data);
}

inline void gobj_first_lower_prio(HSD_GObj* gobj)
{
    HSD_GObj* var_r4 = plinklow_gobjs[gobj->p_link];
    while (var_r4 != NULL && var_r4->p_priority > gobj->p_priority) {
        var_r4 = var_r4->prev;
    }
    GObj_PReorder(gobj, var_r4);
}

inline void gobj_first_higher_prio(HSD_GObj* gobj)
{
    HSD_GObj* var_r4 = lbl_805DE334[gobj->p_link];
    while (var_r4 != NULL && var_r4->p_priority < gobj->p_priority) {
        var_r4 = var_r4->next;
    }
    GObj_PReorder(gobj, var_r4 != NULL ? var_r4->prev : plinklow_gobjs[gobj->p_link]);
}

// CreateGObj
extern char lbl_80504DD8[];
extern char lbl_80504DE4[]; // = "p_link <= HSD_GObjLibInitData.p_link_max"
HSD_GObj* CreateGObj(s32 where, u16 classifier, u8 p_link, u8 priority, HSD_GObj* position)
{
    HSD_GObj* gobj;

    //assert_line(0xA8, p_link <= HSD_GObjLibInitData.p_link_max);
    if (!(p_link <= HSD_GObjLibInitData.p_link_max))
        __assert(lbl_80504DD8, 0xA8, lbl_80504DE4);

    if ((gobj = gobj_allocate()) == NULL) {
        return NULL;
    }
    gobj->classifier = classifier;
    gobj->p_link = p_link;
    gobj->gx_link = HSD_GOBJ_GXLINK_NONE;
    gobj->p_priority = priority;
    gobj->render_priority = 0;
    gobj->obj_kind = HSD_GOBJ_OBJ_NONE;
    gobj->user_data_kind = 0xFF;
    gobj->prev_gx = NULL;
    gobj->next_gx = NULL;
    gobj->proc = NULL;
    gobj->render_cb = NULL;
    gobj->gxlink_prios = 0;
    gobj->hsd_obj = NULL;
    gobj->user_data = NULL;
    gobj->user_data_remove_func = NULL;
    switch (where) {
    case 0:
        gobj_first_lower_prio(gobj);
        break;
    case 1:
        gobj_first_higher_prio(gobj);
        break;
    case 2: // insert after position
        GObj_PReorder(gobj, position);
        break;
    case 3: // insert before position
        GObj_PReorder(gobj, position->prev);
        break;
    }
    return gobj;
}

HSD_GObj* func_80428F28(u16 classifier, u8 p_link, u8 priority)
{
    return CreateGObj(0, classifier, p_link, priority, NULL);
}

extern HSD_GObj* lbl_805DE324;

void func_80428F64(HSD_GObj* gobj)
{
    if (!lbl_8058C1F4.b0 && gobj == lbl_805DE324) {
        lbl_8058C1F4.b1 = 1;
        return;
    }
    GObj_RemoveUserData(gobj);
    func_80429CB0(gobj);
    func_80428AD8(gobj);
    if (gobj->gx_link != HSD_GOBJ_GXLINK_NONE) {
        func_80429774(gobj);
    }
    if (gobj->prev != NULL) {
        gobj->prev->next = gobj->next;
    } else {
        lbl_805DE334[gobj->p_link] = gobj->next;
    }
    if (gobj->next != NULL) {
        gobj->next->prev = gobj->prev;
    } else {
        plinklow_gobjs[gobj->p_link] = gobj->prev;
    }
    HSD_ObjFree(&gobj_alloc_data, gobj);
}

