.include "macros.inc"

.section .text  # 0x80005940 - 0x80489440

.global ObjInfoInit
ObjInfoInit:
/* 8041BED8 00418CD8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8041BEDC 00418CDC  7C 08 02 A6 */	mflr r0
/* 8041BEE0 00418CE0  3C 60 80 50 */	lis r3, objInfo@ha
/* 8041BEE4 00418CE4  3C 80 80 50 */	lis r4, hsdClass@ha
/* 8041BEE8 00418CE8  3C A0 80 50 */	lis r5, sysdolphin_base_library@ha
/* 8041BEEC 00418CEC  90 01 00 14 */	stw r0, 0x14(r1)
/* 8041BEF0 00418CF0  38 CD FC 30 */	addi r6, r13, hsd_obj@sda21
/* 8041BEF4 00418CF4  38 63 44 A8 */	addi r3, r3, objInfo@l
/* 8041BEF8 00418CF8  38 84 47 A8 */	addi r4, r4, hsdClass@l
/* 8041BEFC 00418CFC  38 A5 44 E4 */	addi r5, r5, sysdolphin_base_library@l
/* 8041BF00 00418D00  38 E0 00 3C */	li r7, 0x3c
/* 8041BF04 00418D04  39 00 00 08 */	li r8, 8
/* 8041BF08 00418D08  48 00 46 39 */	bl hsdInitClassInfo
/* 8041BF0C 00418D0C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8041BF10 00418D10  7C 08 03 A6 */	mtlr r0
/* 8041BF14 00418D14  38 21 00 10 */	addi r1, r1, 0x10
/* 8041BF18 00418D18  4E 80 00 20 */	blr 


.section .data
    .balign 8
.global objInfo
objInfo:
	.4byte 0x8041BED8
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
.global sysdolphin_base_library
sysdolphin_base_library:
	.4byte 0x73797364
	.4byte 0x6F6C7068
	.4byte 0x696E5F62
	.4byte 0x6173655F
	.4byte 0x6C696272
	.4byte 0x61727900
	.4byte 0x00000000


.section .sdata
    .balign 8
.global hsd_obj
hsd_obj:
	.4byte 0x6873645F
	.4byte 0x6F626A00
.global shadow
shadow:
#	.string "shadow"
	.4byte 0x73686164
	.4byte 0x6F770000
.global lbl_805DCD20
lbl_805DCD20:
	.4byte 0x30000000
.global lbl_805DCD24
lbl_805DCD24:
	.4byte 0x72656374
	.4byte 0x00000000
	.4byte 0x00000000
.global lbl_805DCD30
lbl_805DCD30:
	.4byte 0x00000001
.global lbl_805DCD34
lbl_805DCD34:
	.4byte 0x00008000
.global lbl_805DCD38
lbl_805DCD38:
	.4byte 0x805DCD30
	.4byte 0x00000000
.global lbl_805DCD40
lbl_805DCD40:
	.4byte 0x00000000
.global lbl_805DCD44
lbl_805DCD44:
	.4byte 0x73746163
	.4byte 0x6B000000
	.4byte 0x00000000
