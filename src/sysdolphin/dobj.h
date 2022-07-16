#ifndef _dobj_h_
#define _dobj_h_

#include <dolphin/types.h>

#include "object.h"
#include "class.h"
#include "mobj.h"
#include "pobj.h"

typedef struct _HSD_DObj {
    HSD_Class parent;
    struct _HSD_DObj* next; //0x04
    struct _HSD_MObj* mobj; //0x08
    struct _HSD_PObj* pobj; //0x0C
    struct _HSD_AObj* aobj; //0x10
    u32 flags; //0x14
} HSD_DObj;

typedef struct _HSD_DObjDesc {
    char* class_name;
    struct _HSD_DObjDesc* next;
    struct _HSD_MObjDesc* mobjdesc;
    struct _HSD_PObjDesc* pobjdesc;
} HSD_DObjDesc;

typedef struct _HSD_DObjInfo {
    HSD_ClassInfo parent;
    void (*disp)(HSD_DObj* dobj, Mtx vmtx, Mtx pmtx, u32 rendermode); //0x3C
    int (*load)(HSD_DObj* dobj, HSD_DObjDesc* desc); //0x40
} HSD_DObjInfo;

typedef struct _HSD_ShapeAnimDObj {
    struct _HSD_ShapeAnimDObj* next;
    struct _HSD_ShapeAnim* shapeanim;
} HSD_ShapeAnimDObj;

#define HSD_DOBJ(o) ((HSD_DObj*)(o))
#define HSD_DOBJ_INFO(i) ((HSD_DObjInfo*)(i))
#define HSD_DOBJ_METHOD(o) HSD_DOBJ_INFO(HSD_CLASS_METHOD(o))

void HSD_DObjSetCurrent(HSD_DObj* dobj);

u32 HSD_DObjGetFlags(HSD_DObj* dobj);

void HSD_DObjSetFlags(HSD_DObj* dobj, u32 flags);

HSD_DObj* HSD_DObjAlloc(void);

#endif
