.section .ctors, "wa"  # 0x80489440 - 0x80489460
.global lbl_80489440
lbl_80489440:
	.incbin "baserom.dol", 0x486440, 0x20
