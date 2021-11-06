#include "mobj.h"

void HSD_MObjSetCurrent(HSD_MObj *mobj)
{
  current_mobj = mobj;
}

void HSD_MObjSetFlags(HSD_MObj *mobj, u32 flags)
{
  if (mobj) mobj->rendermode |= flags;
}

void HSD_MObjClearFlags(HSD_MObj *mobj, u32 flags)
{
  if (mobj) mobj->rendermode &= ~flags;
}

void HSD_MObjRemoveAnimByFlags(HSD_MObj *mobj, u32 flags)
{
  if (mobj == NULL)
    return;
  
  if (flags & MOBJ_ANIM) {
    HSD_AObjRemove(mobj->aobj);
    mobj->aobj = NULL;
  }
  if (flags & TOBJ_ANIM) {
    HSD_TObjRemoveAnimAll(mobj->tobj);
  }
}

void HSD_MObjAddAnim(HSD_MObj *mobj, HSD_MatAnim *matanim)
{
  if (mobj == NULL)
    return;

  if (matanim) {
    if (mobj->aobj) {
      HSD_AObjRemove(mobj->aobj);
    }
    mobj->aobj = HSD_AObjLoadDesc(matanim->aobjdesc);
    HSD_TObjAddAnimAll(mobj->tobj, matanim->texanim); 
  }
}

void HSD_MObjReqAnimByFlags(HSD_MObj *mobj, float startframe, u32 flags)
{
  if (mobj == NULL)
    return;
  if (flags & MOBJ_ANIM) {
    HSD_AObjReqAnim(mobj->aobj, startframe);
  }
  HSD_TObjReqAnimAllByFlags(mobj->tobj, startframe, flags);
}

static void MObjUpdateFunc(void *obj, u32 type, FObjData *val)
{
  HSD_MObj *mobj = obj;

  if (mobj == NULL)
    return;
  switch (type) {
  case HSD_A_M_AMBIENT_R:
    if (mobj->mat) {
      mobj->mat->ambient.r = (u8)(255.0F * HSD_ClampFloat(val->fv, 0, 1));
    }
    break;
  case HSD_A_M_AMBIENT_G:
    if (mobj->mat) {
      mobj->mat->ambient.g = (u8)(255.0F * HSD_ClampFloat(val->fv, 0, 1));
    }
    break;
  case HSD_A_M_AMBIENT_B:
    if (mobj->mat) {
      mobj->mat->ambient.b = (u8)(255.0F * HSD_ClampFloat(val->fv, 0, 1));
    }
    break;
  case HSD_A_M_DIFFUSE_R:
    if (mobj->mat) {
      mobj->mat->diffuse.r = (u8)(255.0F * HSD_ClampFloat(val->fv, 0, 1));
    }
    break;
  case HSD_A_M_DIFFUSE_G:
    if (mobj->mat) {
      mobj->mat->diffuse.g = (u8)(255.0F * HSD_ClampFloat(val->fv, 0, 1));
    }
    break;
  case HSD_A_M_DIFFUSE_B:
    if (mobj->mat) {
      mobj->mat->diffuse.b = (u8)(255.0F * HSD_ClampFloat(val->fv, 0, 1));
    }
    break;
  case HSD_A_M_ALPHA:
    if (mobj->mat) {
      mobj->mat->alpha = HSD_ClampFloat(1.0F - val->fv, 0, 1);
    }
    break;
  case HSD_A_M_SPECULAR_R:
    if (mobj->mat) {
      mobj->mat->specular.r = (u8)(255.0F * HSD_ClampFloat(val->fv, 0, 1));
    }
    break;
  case HSD_A_M_SPECULAR_G:
    if (mobj->mat) {
      mobj->mat->specular.g = (u8)(255.0F * HSD_ClampFloat(val->fv, 0, 1));
    }
    break;
  case HSD_A_M_SPECULAR_B:
    if (mobj->mat) {
      mobj->mat->specular.b = (u8)(255.0F * HSD_ClampFloat(val->fv, 0, 1));
    }
    break;
  case HSD_A_M_PE_REF0:
    if (mobj->pe) {
      mobj->pe->ref0 = (u8)(255.0F * HSD_ClampFloat(val->fv, 0, 1));
    }
    break;
  case HSD_A_M_PE_REF1:
    if (mobj->pe) {
      mobj->pe->ref1 = (u8)(255.0F * HSD_ClampFloat(val->fv, 0, 1));
    }
    break;
  case HSD_A_M_PE_DSTALPHA:
    if (mobj->pe) {
      mobj->pe->dst_alpha = (u8)(255.0F * HSD_ClampFloat(val->fv, 0, 1));
    }
    break;
  }
}

void HSD_MObjAnim(HSD_MObj *mobj)
{
  if (mobj == NULL)
    return;
  HSD_AObjInterpretAnim(mobj->aobj, mobj, MObjUpdateFunc);
  HSD_TObjAnimAll(mobj->tobj);
}

static int MObjLoad(HSD_MObj *mobj, HSD_MObjDesc *desc)
{
  mobj->rendermode = desc->rendermode;
  mobj->tobj = HSD_TObjLoadDesc(desc->texdesc);
  mobj->mat = HSD_MaterialAlloc();
  memcpy(mobj->mat, desc->mat, sizeof(HSD_Material));
  mobj->rendermode |= RENDER_TOON;
  if (desc->pedesc) {
    mobj->pe = hsdAllocMemPiece(sizeof(HSD_PEDesc));
    memcpy(mobj->pe, desc->pedesc, sizeof(HSD_PEDesc));
  }
  mobj->aobj = NULL;
  return 0;
}

void HSD_MObjSetDefaultClass(HSD_MObjInfo *info)
{
  if (info) {
    assert(hsdIsDescendantOf(info, &hsdMObj));
  }
  default_class = info;
}

HSD_MObjInfo *HSD_MObjGetDefaultClass(void)
{
  return default_class? default_class : &hsdMObj;
}

HSD_MObj *HSD_MObjLoadDesc(HSD_MObjDesc *mobjdesc)
{
  if (mobjdesc) {
    HSD_MObj *mobj;
    HSD_ClassInfo *info;
    
    if (!mobjdesc->class_name ||
        !(info = hsdSearchClassInfo(mobjdesc->class_name)))
    {
      mobj = HSD_MObjAlloc();
    } else {
      mobj = hsdNew(info);
      assert(mobj);
    }

    HSD_MOBJ_METHOD(mobj)->load(mobj, mobjdesc);
    HSD_MObjCompileTev(mobj);

    return mobj;
  } else {
    return NULL;
  }
}
