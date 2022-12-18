#ifndef _gobj_h_
#define _gobj_h_

#include <dolphin/types.h>

#include <sysdolphin/objalloc.h>

#define HSD_GOBJ_GXLINK_NONE 0xFF
#define HSD_GOBJ_OBJ_NONE 0xFF

typedef struct _HSD_GObj {
    u16 classifier;
    u8 p_link;
    u8 gx_link;
    u8 p_priority;
    u8 render_priority;
    u8 obj_kind;
    u8 user_data_kind;
    struct _HSD_GObj* next; //0x08
    struct _HSD_GObj* prev; //0x0C
    struct _HSD_GObj* next_gx; //0x10
    struct _HSD_GObj* prev_gx; //0x14
    struct _HSD_GObjProc* proc; //0x18
    void (*render_cb)(struct _HSD_GObj* gobj, s32 code); //0x1C
    u64 gxlink_prios; //x20
    void* hsd_obj;  //x28
    void* user_data;  //x2C
    void (*user_data_remove_func)(void* data);  ///x30
    void* x34_unk;
} HSD_GObj;

typedef struct _HSD_GObjProc {
    struct _HSD_GObjProc* child; //0x0
    struct _HSD_GObjProc* next; //0x4
    struct _HSD_GObjProc* prev; //0x8
    u8 s_link; //0xC
    u8 flags_1:1; //0xD
    u8 flags_2:1;
    u8 flags_3:2;
    struct _HSD_GObj* gobj; //0x10
    void (*callback)(struct _HSD_GObj*); //0x14
} HSD_GObjProc;

typedef struct _HSD_GObjLibInitDataType {
    u8 p_link_max; //804CE380
    u8 gx_link_max; //804CE381
    u8 gproc_pri_max; //804CE382
    u32 unk_1; //804CE384
    u32* unk_2; //804CE388
    HSD_ObjAllocData gobj_def; //804CE38C
    HSD_ObjAllocData gobj_proc_def; //804CE3B8
} HSD_GObjLibInitDataType;

extern struct _unk_gobj_struct {
    union {
        u32 flags;
        struct {
            u32 b0 : 1;
            u32 b1 : 1;
            u32 b2 : 1;
            u32 b3 : 1;
        };
    };
    u32 type;
    u8 p_link;
    u8 p_prio;
    HSD_GObj* gobj;
} lbl_8058C1F4;

void func_80390C5C(HSD_GObj* gobj);
void func_80390C84(HSD_GObj* gobj);
void func_80390CAC(HSD_GObj* gobj);

#endif
