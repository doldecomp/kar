#include "shadow.h"

#include <sysdolphin/cobj.h>
#include <sysdolphin/mobj.h>
#include <sysdolphin/tobj.h>

extern HSD_ObjAllocData shadow_alloc_data;

struct _HSD_CObj* HSD_CObjAlloc();
void HSD_CObjSetViewportfx4(struct _HSD_CObj*, f32, f32, f32, f32);

#define HSD_OBJ(o) ((HSD_Obj*)o)

HSD_ObjAllocData* HSD_ShadowGetAllocData(void)
{
    return &shadow_alloc_data;
}

void HSD_ShadowInitAllocData(void)
{
    HSD_ObjAllocInit(&shadow_alloc_data, sizeof(HSD_Shadow), 4);
}

HSD_TObj* allocShadowTObj()
{
    HSD_TObj* tobj = HSD_TObjAlloc();
    tobj->src = 0;
    tobj->wrap_s = 0;
    tobj->wrap_t = 0;
    tobj->flags = 0x540103;
    tobj->imagedesc = HSD_ImageDescAlloc();
    return tobj;
}

void HSD_CObjSetScissorx4(struct _HSD_CObj*, s32, u16, s32, u16);        /* extern */

HSD_Shadow* HSD_ShadowAlloc(void)
{
    HSD_Shadow* shadow = HSD_ObjAlloc(&shadow_alloc_data);
    memset(shadow, 0, sizeof(HSD_Shadow));
    shadow->camera = HSD_CObjAlloc();
    shadow->texture = allocShadowTObj();
    shadow->scaleS = 0.5;
    shadow->scaleT = -0.5;
    shadow->transS = 0.5;
    shadow->transT = 0.5;
    shadow->intensity = 0;
    shadow->texture->imagedesc->format = 0;
    shadow->texture->imagedesc->width = 256;
    shadow->texture->imagedesc->height = 256;
    HSD_CObjSetViewportfx4(shadow->camera, 0, 256, 0, 256);
    HSD_CObjSetScissorx4(shadow->camera, 0, 256, 0, 256);
    return shadow;
}

inline BOOL decref(HSD_Obj* obj)
{
    u16 ref_count = obj->ref_count;
    BOOL noref = ref_count == 0xffff;
    if (noref) {
        return noref;
    }
    obj->ref_count--;
    return ref_count == 0;
}

void HSD_ShadowFree(HSD_Shadow* shadow)
{
    HSD_CObj* camera;
    HSD_TObj* tobj;
    if (shadow == NULL) {
        return;
    }
    camera = shadow->camera;
    if (camera != NULL) {
        if (decref(HSD_OBJ(camera)) && camera != NULL) {
            camera->parent.parent.class_info->release((HSD_Class*) camera);
            camera->parent.parent.class_info->destroy((HSD_Class*) camera);
        }
    }
    HSD_ShadowDeleteObject(shadow, 0);
    if (shadow->active) {
        HSD_MObjDeleteShadowTexture(shadow->texture);
    }
    if (shadow->texture->imagedesc->img_ptr != NULL) {
        HSD_Free(shadow->texture->imagedesc->img_ptr);
    }
    tobj = shadow->texture;
    HSD_ImageDescFree(tobj->imagedesc);
    HSD_TObjFree(tobj);
    HSD_ObjFree(&shadow_alloc_data, shadow);
}

void HSD_ShadowInit(HSD_Shadow* shadow)
{
    HSD_ImageDesc* imagedesc;

    assert_line(0xF5, shadow);
    imagedesc = shadow->texture->imagedesc;
    GXSetTexCopySrc(0, 0, imagedesc->width, imagedesc->height);
    GXSetTexCopyDst(imagedesc->width, imagedesc->height, 32, 0);
}

void* HSD_Alloc(s32);
void HSD_CObjSetViewportfx4(struct _HSD_CObj*, f32, f32, f32, f32);
s32 GXGetTexBufferSize(u16, u16, s32, s32, s32);          /* extern */
void HSD_CObjSetViewportfx4(struct _HSD_CObj*, f32, f32, f32, f32); /* extern */

void HSD_ShadowSetSize(HSD_Shadow* shadow, u16 width, u16 height)
{
    u32 size;
    HSD_ImageDesc* imgdesc;

    assert_line(0x115, shadow);
    assert_line(0x116, width > 0);
    assert_line(0x117, height > 0);

    imgdesc = shadow->texture->imagedesc;
    if (imgdesc->img_ptr == NULL || imgdesc->width != width || imgdesc->height != height) {
        if (imgdesc->img_ptr != NULL) {
            HSD_Free(imgdesc->img_ptr);
        }
        size = GXGetTexBufferSize(width, height, 0, 0, 0);
        assert_line(0x122, size > 0);

        imgdesc->img_ptr = HSD_Alloc(size);
        imgdesc->width = width;
        imgdesc->height = height;
        HSD_CObjSetViewportfx4(shadow->camera, 0, width, 0, height);
        HSD_CObjSetScissorx4(shadow->camera, 0, width, 0, height);
    }
}

typedef struct _HSD_Chan {
    struct _HSD_Chan* next;
    u32 chan;
    u32 flags;
    GXColor amb_color;
    GXColor mat_color;
    u8 enable;
    u32 amb_src;
    u32 mat_src;
    u32 light_mask;
    u32 diff_fn;
    u32 attn_fn;
    struct _HSD_AObj* aobj;
} HSD_Chan;

HSD_Chan channel = {
    NULL, // next
    4,    // chan
    0,    // flags
    { 0 },    // amb_color
    { 0, 0, 0, 255 }, // mat_color
    FALSE, // enable
    0,     // amb_src
    0,     // mat_src
    0,     // light_mask
    2,     // diff_fn
    2,     // attn_fn
};

extern Mtx lbl_80503FC0;
extern f32 lbl_805DC8C0[];

extern struct {
    u8 x0_pad[0xC];
    s32 unkC;
} lbl_80504418;

struct {
    u32 unused[29];
} tevstage = {
    0,
    1,
    0,
    0xFF,
    0xFF,
    4,
    0,
    15,
    15,
    15,
    10,
    0,
    0,
    0x1000000,
    0,
    0,
    7,
    7,
    7,
    5,
    0,
    0,
    0x1000000,
};

HSD_PEDesc pedesc = {
    9,
    0,
    0,
    0,
    0,
    4,
    5,
    15,
    7,
    7,
    0,
    7,
};


f32 HSD_CObjGetEyeDistance();
void C_MTXOrtho(void*, f32, f32, f32, f32, f32, f32);
void GXSetViewport(f32, f32, f32, f32, f32, f32);

void HSD_ShadowStartRender(HSD_Shadow* shadow)
{
    Mtx44 sp8;
    HSD_Chan* chan;
    HSD_CObj* camera;
    u8 temp_r0;
    HSD_ImageDesc* imgdesc;
    HSD_SList* var_r26;

    assert_line(0x159, shadow);
    assert_line(0x15A, shadow->camera);
    assert_line(0x15B, shadow->texture);
    assert_line(0x15C, shadow->texture->imagedesc);

    camera = shadow->camera;
    imgdesc = shadow->texture->imagedesc;
    if (shadow->active) {
        HSD_StateInitTev();
        HSD_SetupTevStageAll(&tevstage);
        HSD_StateSetNumTexGens();
        HSD_SetupPEMode(0, &pedesc);
        channel.mat_color.r = 0xFF;
        channel.mat_color.g = 0xFF;
        channel.mat_color.b = 0xFF;
        HSD_SetupChannelAll(&channel);
        C_MTXOrtho(&sp8, 1.0F, 0.0F, 0.0F, 1.0F, -1.0F, 1.0F);
        GXSetProjection(&sp8, 1);
        GXSetViewport(0.0F, 0.0F, imgdesc->width, imgdesc->height, 0.0F, 1.0F);
        GXSetScissor(0, 0, imgdesc->width, imgdesc->height);
        GXLoadPosMtxImm(&lbl_80503FC0, 0);
        GXSetCurrentMtx(0, lbl_80504418.unkC++, &lbl_80504418);
        HSD_ClearVtxDesc();
        GXSetVtxDesc(9, 1);
        GXSetVtxAttrFmt(0, 9, 0, 0, 0);
        HSD_StateSetCullMode(2);
        GXBegin(0x80, 0, 4);
        *(s8*) 0xCC008000 = 0;
        *(s8*) 0xCC008000 = 1;
        *(s8*) 0xCC008000 = 1;
        *(s8*) 0xCC008000 = 1;
        *(s8*) 0xCC008000 = 1;
        *(s8*) 0xCC008000 = 0;
        *(s8*) 0xCC008000 = 0;
        *(s8*) 0xCC008000 = 0;
        temp_r0 = shadow->intensity;
        channel.mat_color.r = temp_r0;
        channel.mat_color.g = temp_r0;
        channel.mat_color.b = temp_r0;
        HSD_SetupChannelAll(&channel);
        if (shadow->objects != NULL && HSD_CObjGetEyeDistance(camera) >= lbl_805DC8C0[0] && HSD_CObjSetCurrent(camera)) {
            GXSetScissor(2, 2, imgdesc->width - 4, imgdesc->height - 4);
            for (var_r26 = shadow->objects; var_r26 != NULL; var_r26 = var_r26->next) {
                HSD_JObjDispAll(var_r26->data, 0, 5, 0x04000000);
            }
            HSD_CObjEndCurrent();
        }
    }
}

void HSD_ShadowEndRender(HSD_Shadow* shadow)
{
    HSD_ImageDesc* imgdesc;
    assert_line(0x1ED, shadow);
    imgdesc = shadow->texture->imagedesc;
    if (imgdesc->img_ptr == NULL) {
        HSD_ShadowSetSize(shadow, imgdesc->width, imgdesc->height);
    }
    GXCopyTex(imgdesc->img_ptr, 1);
    GXPixModeSync();
    GXInvalidateTexAll();
    makeMatrix(shadow);
}

void HSD_ShadowSetActive(HSD_Shadow *shadow, s32 active)
{
    assert_line(0x23A, shadow);
    // skip if already in requested state
    if (shadow->active && active || !shadow->active && !active) {
        return;
    }

    shadow->active = active;
    if (active) {
        HSD_ImageDesc* imgdesc = shadow->texture->imagedesc;
        if (imgdesc->img_ptr == NULL) {
            HSD_ShadowSetSize(shadow, imgdesc->width, imgdesc->height);
        }
        HSD_MObjAddShadowTexture(shadow->texture);
    } else {
        HSD_MObjDeleteShadowTexture(shadow->texture);
    }
}

HSD_SList* HSD_SListPrepend();

void HSD_ShadowAddObject(HSD_Shadow* shadow, HSD_Obj* obj)
{
    HSD_SList* cur;

    if (shadow == NULL || obj == NULL) {
        return;
    }
    for (cur = shadow->objects; cur != NULL; cur = cur->next) {
        if (cur->data == obj) {
            return;
        }
    }
    shadow->objects = HSD_SListPrepend(shadow->objects, obj);
    if (obj != NULL) {
        obj->ref_count += 1;
        if (obj->ref_count == (u16) -1) {
            __assert("object.h", 0x5D, "HSD_OBJ(o)->ref_count != HSD_OBJ_NOREF");
        }
    }
}

HSD_SList* HSD_SListRemove(HSD_SList*);

void HSD_ShadowDeleteObject(HSD_Shadow* shadow, struct _HSD_JObj* jobj)
{
    if (shadow == NULL) {
        return;
    }
    if (jobj != NULL) {
        HSD_SList* list = (HSD_SList*) shadow;
        while (list->next != NULL) {
            if (list->next->data == jobj) {
                HSD_JObjUnref(jobj);
                list->next = HSD_SListRemove(list->next);
                break;
            }
            list = list->next;
        }
    } else {
        while (shadow->objects != NULL) {
            HSD_JObjUnref(shadow->objects->data);
            shadow->objects = HSD_SListRemove(shadow->objects);
        }
    }
}
