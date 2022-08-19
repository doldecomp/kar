#include "class.h"

extern u32 lbl_805DE300;

extern void _hsdClassInfoInit();
HSD_ClassInfo hsdClass = { _hsdClassInfoInit };

void hsdInitClassInfo(HSD_ClassInfo* class_info, HSD_ClassInfo* parent_info,
                      char* base_class_library, char* type, s32 info_size,
                      s32 class_size)
{

    class_info->head.flags = 1;
    class_info->head.library_name = base_class_library;
    class_info->head.class_name = type;
    class_info->head.obj_size = (s16) class_size;
    class_info->head.info_size = (s16) info_size;
    class_info->head.parent = parent_info;
    class_info->head.child = NULL;
    class_info->head.next = NULL;
    class_info->head.nb_exist = (u32) NULL;
    class_info->head.nb_peak = (u32) NULL;
    if (parent_info != NULL) {
        if ((parent_info->head.flags & 1) == 0) {
            parent_info->head.info_init();
        }
        assert_line(95, class_info->head.obj_size >= parent_info->head.obj_size);
        assert_line(96, class_info->head.info_size >= parent_info->head.info_size);
        memcpy(&class_info->alloc, &parent_info->alloc, parent_info->head.info_size - 0x28);
        class_info->head.next = parent_info->head.child;
        parent_info->head.child = class_info;
    }
}

char lbl_805DCD58[] = " ";
void OSReport_PrintSpaces(s32 count) {
    s32 i;

    for (i = 0; i < count; i++) {
        _OSReport(lbl_805DCD58);
    }
}

void* _HSD_MemAlloc();                     /* extern */
extern HSD_MemoryEntry** memory_list;
extern s32 nb_memory_list;

extern char lbl_805048B0[0xC];

#define OSRoundDown32B(x) (((u32)(x)) & ~(32 - 1))
#define OSRoundUp32B(x)   (((u32)(x) + 32 - 1) & ~(32 - 1))


#pragma push
#pragma force_active on
char unused1[] = "entry %d <null>\n";
char unused2[] = "entry %d - %d <null>\n";
char unused3[] = "entry %d(%d)";
char unused4[] = "  nb_alloc %d nb_free %d\n";
#pragma pop

HSD_MemoryEntry* GetMemoryEntry(s32 idx)
{
    assert_line(174, idx >= 0);

    if (idx >= nb_memory_list) {
        if (nb_memory_list == 0) {
            s32 new_nb;
            for (new_nb = 32; idx >= new_nb;) {
                new_nb *= 2;
            }
            memory_list = _HSD_MemAlloc(new_nb * 4, 4, 1);
            if (memory_list == NULL) {
                return NULL;
            }
            memset(memory_list, 0, new_nb * 4);
            nb_memory_list = new_nb;
        } else {
            s32 new_nb;
            HSD_FreeList* old_list;
            HSD_MemoryEntry** new_list;
            s32 old_nb;

            new_nb = nb_memory_list * 2;
            while (idx >= new_nb) {
                new_nb *= 2;
            }

            new_list = _HSD_MemAlloc(new_nb * 4, 4, 1);
            if (new_list == NULL) {
                return NULL;
            }

            memcpy(new_list, memory_list, 4 * nb_memory_list);
            memset(&new_list[nb_memory_list], 0, (new_nb - nb_memory_list) * 4);

            old_list = (HSD_FreeList*) memory_list;
            old_nb = OSRoundDown32B(nb_memory_list * 4);
            memory_list = new_list;
            nb_memory_list = new_nb;

            hsdFreeMemPiece(old_list, old_nb);
            memory_list[OSRoundUp32B(old_nb)/32 - 1]->nb_alloc += 1;
        }
    }
    {
        int i;
        BOOL found;
        HSD_MemoryEntry* entry;
        if (memory_list[idx] == NULL) {
            entry = _HSD_MemAlloc(0x14, 4, 1);
            if (entry == NULL) {
                return NULL;
            }
            memset(entry, 0, 0x14);
            entry->size = (idx + 1) * 32;
            memory_list[idx] = entry;

            found = FALSE;
            for (i = idx - 1; i >= 0; --i) {
                if (memory_list[i] != NULL) {
                    found = TRUE;
                    entry->next = memory_list[i]->next;
                    memory_list[i]->next = entry;
                    break;
                }
            }

            if (found == FALSE) {
                for (i = idx + 1; i < nb_memory_list; i++) {
                    if (memory_list[i] != NULL) {
                        entry->next = memory_list[i];
                        break;
                    }
                }

            }
        }
    }
    return memory_list[idx];
}

void* hsdAllocMemPiece(s32 size)
{
    HSD_FreeList* temp_r3_2;
    HSD_FreeList* temp_r4;
    HSD_FreeList* temp_r4_2;
    HSD_FreeList* temp_r5;
    HSD_MemoryEntry* temp_r3_3;
    HSD_MemoryEntry* temp_r3_4;
    HSD_MemoryEntry* var_r28;
    HSD_MemoryEntry* var_r30;
    s32 temp_r28;
    s32 temp_r29;
    void* temp_r3;

    temp_r29 = (size + 31) / 32 - 1;
    temp_r3_3 = GetMemoryEntry((size + 31) / 32 - 1);
    if (temp_r3_3 == NULL) {
        return NULL;
    }
    temp_r3_2 = temp_r3_3->free_list;
    if (temp_r3_2 != NULL) {
        temp_r3_3->free_list = temp_r3_2->next;
        temp_r3_3->nb_free -= 1;
        return temp_r3_2;
    }
    var_r28 = temp_r3_3->next;
    while (var_r28 != NULL) {
        if (var_r28->free_list != NULL) {
            temp_r3_4 = GetMemoryEntry((s32) (var_r28->size - temp_r3_3->size + 31) / 32 - 1);
            if (temp_r3_4 == NULL) {
                return NULL;
            }
            temp_r5 = var_r28->free_list;
            var_r28->free_list = var_r28->free_list->next;
            var_r28->nb_free -= 1;
            var_r28->nb_alloc -= 1;
            temp_r4_2 = (void*) ((char*) temp_r5 + temp_r3_3->size);
            temp_r4_2->next = temp_r3_4->free_list;
            temp_r3_4->free_list = temp_r4_2;
            temp_r3_4->nb_alloc += 1;
            temp_r3_4->nb_free += 1;
            temp_r3_3->nb_alloc += 1;
            return temp_r5;
        }
        var_r28 = var_r28->next;
    }
    temp_r28 = (nb_memory_list - temp_r29) - 2;
    if (temp_r28 >= 0) {
        var_r30 = GetMemoryEntry(temp_r28);
        if (var_r30 == NULL) {
            return NULL;
        }
    }
    temp_r3 = _HSD_MemAlloc(nb_memory_list * 32, 4, 1);
    if (temp_r3 == NULL) {
        return NULL;
    }
    if (temp_r28 >= 0) {
        temp_r4 = (void*) ((char*) temp_r3 + temp_r3_3->size);
        temp_r4->next = var_r30->free_list;
        var_r30->free_list = temp_r4;
        var_r30->nb_alloc += 1;
        var_r30->nb_free += 1;
    }
    temp_r3_3->nb_alloc += 1;
    return temp_r3;
}

void hsdFreeMemPiece(void* v, s32 i)
{
    HSD_FreeList* list = v;
    if (list != NULL) {
        HSD_MemoryEntry* entry = GetMemoryEntry((i + 31) / 32 - 1);
        list->next = entry->free_list;
        entry->free_list = list;
        entry->nb_free += 1;
    }
}

HSD_Class* _hsdClassAlloc(HSD_ClassInfo* info)
{
    HSD_Class* ret = hsdAllocMemPiece(info->head.obj_size);
    if (ret != NULL) {
        info->head.nb_exist += 1;
        if (info->head.nb_exist > info->head.nb_peak) {
            info->head.nb_peak = info->head.nb_exist;
        }
    }
    return ret;
}

int _hsdClassInit(HSD_Class*)
{
    return 0;
}

void _hsdClassRelease()
{
}

void _hsdClassDestroy(HSD_Class* c)
{
    HSD_ClassInfo* info;
    HSD_MemoryEntry* entry;
    s32 obj_size;

    info = c->class_info;
    info->head.nb_exist -= 1;
    obj_size = info->head.obj_size;
    if (c != NULL) {
        entry = GetMemoryEntry((obj_size + 31) / 32 - 1);
        c->class_info = (HSD_ClassInfo*) entry->free_list;
        entry->free_list = (HSD_FreeList*) c;
        entry->nb_free += 1;
    }
}

void _hsdClassAmnesia(HSD_ClassInfo* info)
{
    info->head.nb_exist = 0;
    info->head.nb_peak = 0;
    if (info == &hsdClass) {
        nb_memory_list = 0;
        memory_list = 0;
        lbl_805DE300 = 0;
    }
}

char lbl_805048BC[] = "sysdolphin_base_library";

void _hsdClassRelease(HSD_Class* c);

void _hsdClassInfoInit(void)
{
    hsdClass.head.flags = 1;
    hsdClass.head.library_name = lbl_805048BC;
    hsdClass.head.class_name = "hsd_class";
    hsdClass.head.obj_size = 4;
    hsdClass.head.info_size = 0x3C;
    hsdClass.head.parent = NULL;
    hsdClass.head.child = NULL;
    hsdClass.head.next = NULL;
    hsdClass.head.nb_exist = 0;
    hsdClass.head.nb_peak = 0;

    hsdClass.alloc = _hsdClassAlloc;
    hsdClass.init = _hsdClassInit;
    hsdClass.release = _hsdClassRelease;
    hsdClass.destroy = _hsdClassDestroy;
    hsdClass.amnesia = _hsdClassAmnesia;
}

void* hsdNew(HSD_ClassInfo* info)
{
    HSD_Class* cls;

    if (!(info->head.flags & 1)) {
        info->head.info_init();
    }
    cls = info->alloc(info);
    if (cls == NULL) {
        return NULL;
    }
    if (!(info->head.flags & 1)) {
        info->head.info_init();
    }
    memset(cls, 0, info->head.obj_size);
    cls->class_info = info;
    if (info->init(cls) < 0) {
        info->destroy(cls);
        return NULL;
    }
    return cls;
}

extern char lbl_805DCD5C[4];

BOOL func_80420D5C(HSD_Class* object, HSD_ClassInfo* class_info)
{
    HSD_ClassInfo* info1;
    HSD_ClassInfo* info2;

    assert_line(586, object);
    assert_line(587, class_info);

    info1 = object->class_info;
    info2 = class_info = class_info;
    if (!(class_info->head.flags & 1)) {
        class_info->head.info_init();
    }
    if (info1->head.obj_size != info2->head.obj_size) {
        return FALSE;
    }
    while (info1->head.parent != NULL && info1->head.parent->head.obj_size == info1->head.obj_size) {
        info1 = info1->head.parent;
    }
    while (info2->head.parent != NULL && info2->head.parent->head.obj_size == info2->head.obj_size) {
        info2 = info2->head.parent;
    }
    if (info1 == info2) {
        info1->head.nb_exist -= 1;
        class_info->head.nb_exist += 1;
        if (class_info->head.nb_exist > class_info->head.nb_peak) {
            class_info->head.nb_peak = class_info->head.nb_exist;
        }
        object->class_info = class_info;
        return TRUE;
    }
    return FALSE;
}

BOOL hsdIsDescendantOf(HSD_ClassInfo* info, HSD_ClassInfo* class_info)
{
    HSD_ClassInfo* var_r31;

    if (info == NULL || class_info == NULL) {
        return FALSE;
    }
    var_r31 = info = info;
    if (!(info->head.flags & 1)) {
        var_r31->head.info_init();
    }
    if (!(class_info->head.flags & 1)) {
        class_info->head.info_init();
    }
    while (var_r31 != NULL) {
        if (var_r31 == class_info) {
            return TRUE;
        }
        var_r31 = var_r31->head.parent;
    }
    return FALSE;
}

BOOL func_80420F34(HSD_Class* cls, HSD_ClassInfo* class_info)
{
    HSD_ClassInfo* var_r31;

    if (cls == NULL || class_info == NULL) {
        return FALSE;
    }
    var_r31 = cls->class_info;
    if (!(class_info->head.flags & 1)) {
        class_info->head.info_init();
    }
    while (var_r31 != NULL) {
        if (var_r31 == class_info) {
            return TRUE;
        }
        var_r31 = var_r31->head.parent;
    }
    return FALSE;
}

void func_80420FBC(HSD_ClassInfo* class_info, s32 arg1, s32 arg2)
{
    class_info->head.flags = class_info->head.flags & ~arg2 | arg1;
}

void func_80420FD0(HSD_ClassInfo* class_info)
{
    HSD_ClassInfo* cur = class_info->head.child;
    HSD_ClassInfo* next;
    while (cur != NULL) {
        next = cur->head.next;
        cur->head.next = NULL;
        func_80420FD0(cur);
        cur = next;
    }
    class_info->amnesia(class_info);
    class_info->head.child = NULL;
    class_info->head.parent = NULL;
    func_80420FBC(class_info, 0, 1);
}

void func_804211B4(char* name, HSD_ClassInfo* class_info)
{
    HSD_ClassInfo** cur = &class_info->head.child;
    while (*cur != NULL) {
        if (strcmp(name, (*cur)->head.library_name) == 0) {
            func_80420FD0(*cur);
            *cur = (*cur)->head.next;
        } else {
            cur = &(*cur)->head.next;
        }
    }
}

void func_8042122C(char* name)
{
    if (name == NULL) {
        name = lbl_805048BC;
    }
    if (!(hsdClass.head.flags & 1)) {
        return;
    }
    if (strcmp(name, hsdClass.head.library_name) == 0) {
        lbl_805DE300 = 0;
        func_80420FD0(&hsdClass);
    } else {
        func_804211B4(name, &hsdClass);
    }
}

HSD_ClassInfo* HSD_HashSearch();
HSD_ClassInfo* hsdSearchClassInfo(char* arg0)
{
    if (lbl_805DE300 != 0) {
        return HSD_HashSearch(lbl_805DE300, arg0, 0);
    }
    return NULL;
}

#pragma push
#pragma force_active on
char unused5[] = "info_hash";
#pragma pop

void func_804212F4(HSD_ClassInfo* info, s32 indent)
{
    OSReport_PrintSpaces(indent);
    _OSReport("<class %s>\n", info->head.class_name);
    OSReport_PrintSpaces(indent);
    _OSReport("    info %d object %d nb_exist %d nb_peak %d\n",
        info->head.info_size, info->head.obj_size, info->head.nb_exist, info->head.nb_peak);
}
