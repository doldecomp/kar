.include "macros.inc"

.section .text

.global HSD_GetNbBits
HSD_GetNbBits:
/* 80417DB8 00414BB8  38 00 00 04 */	li r0, 4
/* 80417DBC 00414BBC  38 A0 00 00 */	li r5, 0
/* 80417DC0 00414BC0  38 C0 00 00 */	li r6, 0
/* 80417DC4 00414BC4  38 80 00 01 */	li r4, 1
/* 80417DC8 00414BC8  7C 09 03 A6 */	mtctr r0
lbl_80417DCC:
/* 80417DCC 00414BCC  7C 80 30 30 */	slw r0, r4, r6
/* 80417DD0 00414BD0  7C 60 00 39 */	and. r0, r3, r0
/* 80417DD4 00414BD4  41 82 00 08 */	beq lbl_80417DDC
/* 80417DD8 00414BD8  38 A5 00 01 */	addi r5, r5, 1
lbl_80417DDC:
/* 80417DDC 00414BDC  38 C6 00 01 */	addi r6, r6, 1
/* 80417DE0 00414BE0  7C 80 30 30 */	slw r0, r4, r6
/* 80417DE4 00414BE4  7C 60 00 39 */	and. r0, r3, r0
/* 80417DE8 00414BE8  41 82 00 08 */	beq lbl_80417DF0
/* 80417DEC 00414BEC  38 A5 00 01 */	addi r5, r5, 1
lbl_80417DF0:
/* 80417DF0 00414BF0  38 C6 00 01 */	addi r6, r6, 1
/* 80417DF4 00414BF4  7C 80 30 30 */	slw r0, r4, r6
/* 80417DF8 00414BF8  7C 60 00 39 */	and. r0, r3, r0
/* 80417DFC 00414BFC  41 82 00 08 */	beq lbl_80417E04
/* 80417E00 00414C00  38 A5 00 01 */	addi r5, r5, 1
lbl_80417E04:
/* 80417E04 00414C04  38 C6 00 01 */	addi r6, r6, 1
/* 80417E08 00414C08  7C 80 30 30 */	slw r0, r4, r6
/* 80417E0C 00414C0C  7C 60 00 39 */	and. r0, r3, r0
/* 80417E10 00414C10  41 82 00 08 */	beq lbl_80417E18
/* 80417E14 00414C14  38 A5 00 01 */	addi r5, r5, 1
lbl_80417E18:
/* 80417E18 00414C18  38 C6 00 01 */	addi r6, r6, 1
/* 80417E1C 00414C1C  7C 80 30 30 */	slw r0, r4, r6
/* 80417E20 00414C20  7C 60 00 39 */	and. r0, r3, r0
/* 80417E24 00414C24  41 82 00 08 */	beq lbl_80417E2C
/* 80417E28 00414C28  38 A5 00 01 */	addi r5, r5, 1
lbl_80417E2C:
/* 80417E2C 00414C2C  38 C6 00 01 */	addi r6, r6, 1
/* 80417E30 00414C30  7C 80 30 30 */	slw r0, r4, r6
/* 80417E34 00414C34  7C 60 00 39 */	and. r0, r3, r0
/* 80417E38 00414C38  41 82 00 08 */	beq lbl_80417E40
/* 80417E3C 00414C3C  38 A5 00 01 */	addi r5, r5, 1
lbl_80417E40:
/* 80417E40 00414C40  38 C6 00 01 */	addi r6, r6, 1
/* 80417E44 00414C44  7C 80 30 30 */	slw r0, r4, r6
/* 80417E48 00414C48  7C 60 00 39 */	and. r0, r3, r0
/* 80417E4C 00414C4C  41 82 00 08 */	beq lbl_80417E54
/* 80417E50 00414C50  38 A5 00 01 */	addi r5, r5, 1
lbl_80417E54:
/* 80417E54 00414C54  38 C6 00 01 */	addi r6, r6, 1
/* 80417E58 00414C58  7C 80 30 30 */	slw r0, r4, r6
/* 80417E5C 00414C5C  7C 60 00 39 */	and. r0, r3, r0
/* 80417E60 00414C60  41 82 00 08 */	beq lbl_80417E68
/* 80417E64 00414C64  38 A5 00 01 */	addi r5, r5, 1
lbl_80417E68:
/* 80417E68 00414C68  38 C6 00 01 */	addi r6, r6, 1
/* 80417E6C 00414C6C  42 00 FF 60 */	bdnz lbl_80417DCC
/* 80417E70 00414C70  7C A3 2B 78 */	mr r3, r5
/* 80417E74 00414C74  4E 80 00 20 */	blr 


.section .data
    .balign 8
.global lbl_80503FC0
lbl_80503FC0:
	.float 1
	.float 0
	.float 0
	.float 0
	.float 0
	.float 1
	.float 0
	.float 0
	.float 0
	.float 0
	.float 1
	.float 0
.global lbl_80503FF0
lbl_80503FF0:
	.4byte 0x00
	.4byte 0x03
	.4byte 0x06
	.4byte 0x09
	.4byte 0x0C
	.4byte 0x0F
	.4byte 0x12
	.4byte 0x15
	.4byte 0x18
	.4byte 0x1B
