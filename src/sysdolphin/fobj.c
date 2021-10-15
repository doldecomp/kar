#include "fobj.h"
#include "objalloc.h"

HSD_ObjAllocData fobj_alloc_data;

HSD_ObjAllocData* HSD_FObjGetAllocData(void)
{
    return &fobj_alloc_data;
}

void HSD_FObjInitAllocData(void)
{
    HSD_ObjAllocInit(&fobj_alloc_data, sizeof(HSD_FObj), 4);
}

#ifdef PSY
void HSD_FObjRemove(HSD_FObj* fobj)
{
    if (!fobj)
        return;

    HSD_FObjFree(fobj);
}
#else
void HSD_FObjRemove(HSD_FObj* fobj)
{
    if (!fobj)
		HSD_FObjFree(fobj);
	return;
}
#endif

inline HSD_FObj *HSD_FObjGetNext(struct _HSD_FObj *fobj) {
    return fobj->next;
}

inline void *HSD_FObjRemoveAll_Inlined(struct _HSD_FObj *fobj) {
    if (!fobj)
        return;
    HSD_FObjRemoveAll(fobj->next);
    HSD_FObjRemove(fobj);
}

void HSD_FObjRemoveAll(HSD_FObj* fobj)
{
    HSD_FObj* t1;
    HSD_FObj* t2;
    HSD_FObj* t3;
    HSD_FObj* t4;
    HSD_FObj* t5;
    HSD_FObj* t6;
    HSD_FObj* t7;
    HSD_FObj* t8;

    if (fobj)
    {
		t8 = HSD_FObjGetNext(fobj);
        if (t8)
        {
			t7 = HSD_FObjGetNext(t8);
			if (t7)
			{
				t6 = HSD_FObjGetNext(t7);
				if (t6)
				{
					t5 = HSD_FObjGetNext(t6);
					if (t5)
					{
						t4 = HSD_FObjGetNext(t5);
						if (t4)
						{
							t3 = HSD_FObjGetNext(t4);
							if (t3)
							{
								t2 = HSD_FObjGetNext(t3);
								if (t2)
								{
									t1 = HSD_FObjGetNext(t2);
									if (t1)
									{
										HSD_FObjRemoveAll_Inlined(t1->next);
										if (t1) {
											HSD_FObjFree(t1);
										}
									}
									if (t2) {
										HSD_FObjFree(t2);
									}
								}
								if (t3) {
									HSD_FObjFree(t3);
								}
							}
							if (t4) {
								HSD_FObjFree(t4);
							}
						}
						if (t5) {
							HSD_FObjFree(t5);
						}
					}
					if (t6) {
						HSD_FObjFree(t6);
					}
				}
				if (t7) {
					HSD_FObjFree(t7);
				}
			}
			if (t8) {
				HSD_FObjFree(t8);
			}
        }
        if (fobj) {
            HSD_FObjFree(fobj);
        }
    }
}
