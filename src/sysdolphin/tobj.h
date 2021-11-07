#ifndef _tobj_h_
#define _tobj_h_

#include "dolphin/mtx/mtxtypes.h"

#include "src/sysdolphin/object.h"

//Texture Palette Information
typedef struct _HSD_Tlut {
  void          *lut;		// Texture look-up table
  GXTlutFmt     fmt;		// Tlut Format
  u32           tlut_name;	// Where allocations will be stored
  u16           n_entries;	// Number of palettes
} HSD_Tlut;

//Texture Object
struct _HSD_TObj {
  HSD_Obj	    object;
  struct _HSD_TObj  *next;
  GXTexMapID        id;
  GXTexGenSrc       src;
  u32		    mtxid;
  Quaternion        rotate;
  Vec               scale;
  Vec               translate;
  GXTexWrapMode     wrap_s;
  GXTexWrapMode     wrap_t;
  u8                repeat_s;
  u8                repeat_t;
  u16		    anim_id;
  u32               flag;
  float             blending;
  GXTexFilter	    magFilt;
  HSD_ImageDesc	    *imagedesc;
  HSD_Tlut          *tlut;
  HSD_TexLODDesc    *lod;
  struct _HSD_AObj  *aobj;
  HSD_ImageDesc	    **imagetbl;
  HSD_Tlut	    **tluttbl;
  u8		    tlut_no;
  Mtx 		    mtx;
  GXTexCoordID	    coord;
  HSD_TObjTev       *tev;
};

typedef struct _HSD_TObjTev {
    u8 color_op;
    u8 alpha_op;
    u8 color_bias;
    u8 alpha_bias;
    u8 color_scale;
    u8 alpha_scale;
    u8 color_clamp;
    u8 alpha_clamp;
    u8 color_a, color_b, color_c, color_d;
    u8 alpha_a, alpha_b, alpha_c, alpha_d;
    GXColor constant, tev0, tev1;
    u32 active;
} HSD_TObjTev;

#endif
