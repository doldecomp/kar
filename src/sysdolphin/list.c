#include <sysdolphin/list.h>

extern HSD_ObjAllocData slist_alloc_data;
extern HSD_ObjAllocData dlist_alloc_data;

void HSD_ListInitAllocData()
{
    HSD_ObjAllocInit(&slist_alloc_data, sizeof(HSD_SList), 4);
    HSD_ObjAllocInit(&dlist_alloc_data, sizeof(HSD_DList), 4);
}

HSD_ObjAllocData* HSD_SListGetAllocData()
{
    return &slist_alloc_data;
}

HSD_ObjAllocData* HSD_DListGetAllocData()
{
    return &dlist_alloc_data;
}

HSD_SList *HSD_SListAlloc()
{
    HSD_SList *list;

    list = HSD_ObjAlloc(&slist_alloc_data);
    assert_line(76, list);

    memset(list, 0, sizeof(HSD_SList));
    return list;
}

void HSD_SListAppend(HSD_SList* list, void* data)
{
    HSD_SList* next = HSD_SListAlloc();
    next->data = data;
    HSD_SListAppendList(list, next);
}

void HSD_SListPrepend(HSD_SList* list, void* data)
{
    HSD_SList* next = HSD_SListAlloc();
    next->data = data;
    HSD_SListPrependList(list, next);
}

HSD_SList* HSD_SListAppendList(HSD_SList* list, HSD_SList* next)
{
    assert_line(179, next);
    if (list != NULL) {
        next->next = list->next;
        list->next = next;
        return list;
    }
    next->next = NULL;
    return next;
}

HSD_SList *HSD_SListPrependList(HSD_SList *list, HSD_SList *prev)
{
    assert_line(202, prev);
    prev->next = list;
    return prev;
}

HSD_SList *HSD_SListRemove(HSD_SList *list)
{
    HSD_SList *next;

    if (list != NULL) {
        next = list->next;
        HSD_ObjFree(&slist_alloc_data, list);
        return next;
    }

    return NULL;
}
