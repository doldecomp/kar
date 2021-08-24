.include "macros.inc"

.section ._exidx, "wa"  # 0x80005700 - 0x80005800
	.incbin "baserom.dol", 0x486340, 0xCC
.global lbl_800057CC
lbl_800057CC:
	.incbin "baserom.dol", 0x48640C, 0x34
