#include <sysdolphin/aobj.h>

#include <sysdolphin/jobj.h>

extern HSD_ObjAllocData aobj_alloc_data;
extern s32 lbl_805DE200;
extern s32 lbl_805DE1FC;
extern HSD_SList* lbl_805DE1F8;

void HSD_AObjInitAllocData(void)
{
    HSD_ObjAllocInit(&aobj_alloc_data, sizeof(HSD_AObj), 4);
}

HSD_ObjAllocData* HSD_AObjGetAllocData(void)
{
    return &aobj_alloc_data;
}

u32 HSD_AObjGetFlags(HSD_AObj* aobj)
{
    return (aobj) ? aobj->flags : 0;
}

void HSD_AObjSetFlags(HSD_AObj* aobj, u32 flags)
{
    if (aobj) {
        flags &= (AOBJ_LOOP | AOBJ_NO_UPDATE);
        aobj->flags |= flags;
    }
}

void HSD_AObjClearFlags(HSD_AObj* aobj, u32 flags)
{
    if (aobj) {
        flags &= (AOBJ_LOOP | AOBJ_NO_UPDATE);
        aobj->flags &= ~flags;
    }
}

void HSD_AObjSetFObj(HSD_AObj* aobj, HSD_FObj* fobj)
{
    if (!aobj)
        return;

    if (aobj->fobj)
        HSD_FObjRemoveAll(aobj->fobj);
    aobj->fobj = fobj;
}

void HSD_AObjInitEndCallBack(void)
{
    lbl_805DE200 = 0;
    lbl_805DE1FC = 0;
}

void HSD_AObjInvokeCallBacks(void)
{
    HSD_SList* list;

    if (lbl_805DE200 != 0 && lbl_805DE1FC == 0) {
        list = lbl_805DE1F8;
        while (list) {
            void (*func)(void) = list->data;
            (*func)();
            list = list->next;
        }
    }
}

void HSD_AObjReqAnim(HSD_AObj* aobj, f32 frame)
{
    u32 flags;

    if (!aobj)
        return;

    aobj->curr_frame = frame;

    flags = aobj->flags & 0xBFFFFFFF;
    aobj->flags = flags | AOBJ_FIRST_PLAY;

    HSD_FObjReqAnimAll(aobj->fobj, frame);
}

void HSD_AObjStopAnim(HSD_AObj* aobj, void* obj, void (*func)())
{
    if (!aobj)
        return;

    HSD_FObjStopAnimAll(aobj->fobj, obj, func, aobj->framerate);
    aobj->flags |= AOBJ_NO_ANIM;
}
