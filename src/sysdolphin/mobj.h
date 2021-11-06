#ifndef _mobj_h_
#define _mobj_h_

#include "include/dolphin/types.h"

#include "src/sysdolphin/object.h"

//#include "sysdolphin/tobj.h"

#define	HSD_A_M_AMBIENT_R   1	/* Ambient Color */
#define	HSD_A_M_AMBIENT_G   2	/* Ambient Color */
#define	HSD_A_M_AMBIENT_B   3	/* Ambient Color */
#define	HSD_A_M_DIFFUSE_R   4	/* Diffuse Color */
#define	HSD_A_M_DIFFUSE_G   5	/* Diffuse Color */
#define	HSD_A_M_DIFFUSE_B   6	/* Diffuse Color */
#define	HSD_A_M_SPECULAR_R  7 	/* Specular Color */
#define	HSD_A_M_SPECULAR_G  8	/* Specular Color */
#define	HSD_A_M_SPECULAR_B  9 	/* Specular Color */
#define	HSD_A_M_ALPHA      10	/* Transparency */
/* Animation using PE shaders */
#define	HSD_A_M_PE_REF0    	11	/*  */
#define	HSD_A_M_PE_REF1    	12	/*  */
#define	HSD_A_M_PE_DSTALPHA	13	/*  */

//Material Object
typedef struct _HSD_MObj {
    HSD_Class parent;
    u32 rendermode;
    struct _HSD_TObj *tobj;
    HSD_Material *mat;
    HSD_PEDesc *pe;
    struct _HSD_AObj *aobj;
	HSD_TExpTevDesc *tevdesc;
	HSD_TExp *texp;
	HSD_TObj *tobj_toon;
	HSD_TObj *tobj_gradation;
	HSD_TObj *tobj_backlight;
	f32 zofst;
} HSD_MObj;

typedef struct _HSD_MatAnim {
  struct _HSD_MatAnim *next;
  struct _HSD_AObjDesc *aobjdesc;
  struct _HSD_TexAnim *texanim;
  struct _HSD_RenderAnim *renderanim;
} HSD_MatAnim;

typedef struct _HSD_MatAnimJoint {
  struct _HSD_MatAnimJoint *child;
  struct _HSD_MatAnimJoint *next;
  struct _HSD_MatAnim *matanim;
} HSD_MatAnimJoint;

#define HSD_MOBJ(o)		((HSD_MObj *)(o))
#define HSD_MOBJ_INFO(i)	((HSD_MObjInfo *)(i))
#define HSD_MOBJ_METHOD(o)	HSD_MOBJ_INFO(HSD_CLASS_METHOD(o))

#endif
