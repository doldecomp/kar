#include "objalloc.h"
#include "dolphin/types.h"

extern objheap heap;

void HSD_ObjSetHeap(u32 size, void* ptr)
{
    objheap* heap = heap;
    heap->curr = (u32)ptr;
    heap->top = (u32)ptr;
    heap->remain = size;
    heap->size = size;
}
