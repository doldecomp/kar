.include "macros.inc"

.section ._extab, "wa"  # 0x80005600 - 0x80005700
	.incbin "baserom.dol", 0x486240, 0x100
	