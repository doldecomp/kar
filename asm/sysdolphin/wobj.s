.include "macros.inc"

.set _SDA_BASE_, 0x805D50E0+32768

.section .text

.global WObjInfoInit
WObjInfoInit:
/* 8041B050 00417E50  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8041B054 00417E54  7C 08 02 A6 */	mflr r0
/* 8041B058 00417E58  3C 80 80 50 */	lis r4, lbl_805041C8@ha
/* 8041B05C 00417E5C  3C 60 80 50 */	lis r3, objInfo@ha
/* 8041B060 00417E60  90 01 00 14 */	stw r0, 0x14(r1)
/* 8041B064 00417E64  38 E0 00 44 */	li r7, 0x44
/* 8041B068 00417E68  39 00 00 20 */	li r8, 0x20
/* 8041B06C 00417E6C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8041B070 00417E70  3B E4 41 C8 */	addi r31, r4, lbl_805041C8@l
/* 8041B074 00417E74  38 83 44 A8 */	addi r4, r3, objInfo@l
/* 8041B078 00417E78  38 7F 00 00 */	addi r3, r31, 0
/* 8041B07C 00417E7C  38 BF 00 84 */	addi r5, r31, 0x84
/* 8041B080 00417E80  38 DF 00 9C */	addi r6, r31, 0x9c
/* 8041B084 00417E84  48 00 54 BD */	bl hsdInitClassInfo
/* 8041B088 00417E88  3C C0 80 42 */	lis r6, WObjRelease@ha
/* 8041B08C 00417E8C  3C A0 80 42 */	lis r5, WObjAmnesia@ha
/* 8041B090 00417E90  3C 80 80 42 */	lis r4, WObjLoad@ha
/* 8041B094 00417E94  3C 60 80 42 */	lis r3, WObjUpdateFunc@ha
/* 8041B098 00417E98  38 E6 AF B4 */	addi r7, r6, WObjRelease@l
/* 8041B09C 00417E9C  38 DF 00 00 */	addi r6, r31, 0
/* 8041B0A0 00417EA0  38 A5 B0 08 */	addi r5, r5, WObjAmnesia@l
/* 8041B0A4 00417EA4  38 84 AA 38 */	addi r4, r4, WObjLoad@l
/* 8041B0A8 00417EA8  38 03 A8 AC */	addi r0, r3, WObjUpdateFunc@l
/* 8041B0AC 00417EAC  90 E6 00 30 */	stw r7, 0x30(r6)
/* 8041B0B0 00417EB0  90 A6 00 38 */	stw r5, 0x38(r6)
/* 8041B0B4 00417EB4  90 86 00 3C */	stw r4, 0x3c(r6)
/* 8041B0B8 00417EB8  90 06 00 40 */	stw r0, 0x40(r6)
/* 8041B0BC 00417EBC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8041B0C0 00417EC0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8041B0C4 00417EC4  7C 08 03 A6 */	mtlr r0
/* 8041B0C8 00417EC8  38 21 00 10 */	addi r1, r1, 0x10
/* 8041B0CC 00417ECC  4E 80 00 20 */	blr 


.section .data
    .balign 8
.global lbl_805041C8
lbl_805041C8:
	.4byte WObjInfoInit
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
.global lbl_8050420C
lbl_8050420C:
    .asciz "wobj->aobj"
    .balign 4
.global lbl_80504218
lbl_80504218:
    .asciz "jp->u.spline"
    .balign 4
    .asciz "hsdIsDescendantOf(info, &hsdWObj)"
    .balign 4
    .asciz "sysdolphin_base_library"
    .balign 4
    .asciz "had_wobj"
