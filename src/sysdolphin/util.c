#include <dolphin/gx/gxtypes.h>

void HSD_MulColor(GXColor* arg0, GXColor* arg1, GXColor* dest)
{
    dest->r = (arg0->r * arg1->r) / 255U;
    dest->g = (arg0->g * arg1->g) / 255U;
    dest->b = (arg0->b * arg1->b) / 255U;
    dest->a = (arg0->a * arg1->a) / 255U;
}
