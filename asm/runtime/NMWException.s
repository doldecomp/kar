.include "macros.inc"

.section .text

.global __destroy_arr
__destroy_arr:
/* 803AD248 003AA048  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 803AD24C 003AA04C  7C 08 02 A6 */	mflr r0
/* 803AD250 003AA050  90 01 00 24 */	stw r0, 0x24(r1)
/* 803AD254 003AA054  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 803AD258 003AA058  93 C1 00 18 */	stw r30, 0x18(r1)
/* 803AD25C 003AA05C  7C DE 33 78 */	mr r30, r6
/* 803AD260 003AA060  93 A1 00 14 */	stw r29, 0x14(r1)
/* 803AD264 003AA064  7C BD 2B 78 */	mr r29, r5
/* 803AD268 003AA068  7C 1D F1 D6 */	mullw r0, r29, r30
/* 803AD26C 003AA06C  93 81 00 10 */	stw r28, 0x10(r1)
/* 803AD270 003AA070  7C 9C 23 78 */	mr r28, r4
/* 803AD274 003AA074  7F E3 02 14 */	add r31, r3, r0
/* 803AD278 003AA078  48 00 00 20 */	b lbl_803AD298
lbl_803AD27C:
/* 803AD27C 003AA07C  7F FD F8 50 */	subf r31, r29, r31
/* 803AD280 003AA080  7F 8C E3 78 */	mr r12, r28
/* 803AD284 003AA084  7F E3 FB 78 */	mr r3, r31
/* 803AD288 003AA088  38 80 FF FF */	li r4, -1
/* 803AD28C 003AA08C  7D 89 03 A6 */	mtctr r12
/* 803AD290 003AA090  4E 80 04 21 */	bctrl 
/* 803AD294 003AA094  3B DE FF FF */	addi r30, r30, -1
lbl_803AD298:
/* 803AD298 003AA098  28 1E 00 00 */	cmplwi r30, 0
/* 803AD29C 003AA09C  40 82 FF E0 */	bne lbl_803AD27C
/* 803AD2A0 003AA0A0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 803AD2A4 003AA0A4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 803AD2A8 003AA0A8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 803AD2AC 003AA0AC  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 803AD2B0 003AA0B0  83 81 00 10 */	lwz r28, 0x10(r1)
/* 803AD2B4 003AA0B4  7C 08 03 A6 */	mtlr r0
/* 803AD2B8 003AA0B8  38 21 00 20 */	addi r1, r1, 0x20
/* 803AD2BC 003AA0BC  4E 80 00 20 */	blr 

.global __construct_array
__construct_array:
/* 803AD2C0 003AA0C0  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 803AD2C4 003AA0C4  7C 08 02 A6 */	mflr r0
/* 803AD2C8 003AA0C8  90 01 00 34 */	stw r0, 0x34(r1)
/* 803AD2CC 003AA0CC  38 00 00 00 */	li r0, 0
/* 803AD2D0 003AA0D0  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 803AD2D4 003AA0D4  7C 7F 1B 78 */	mr r31, r3
/* 803AD2D8 003AA0D8  93 C1 00 28 */	stw r30, 0x28(r1)
/* 803AD2DC 003AA0DC  7C FE 3B 78 */	mr r30, r7
/* 803AD2E0 003AA0E0  93 A1 00 24 */	stw r29, 0x24(r1)
/* 803AD2E4 003AA0E4  7C DD 33 78 */	mr r29, r6
/* 803AD2E8 003AA0E8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 803AD2EC 003AA0EC  93 81 00 20 */	stw r28, 0x20(r1)
/* 803AD2F0 003AA0F0  7C 9C 23 78 */	mr r28, r4
/* 803AD2F4 003AA0F4  90 61 00 08 */	stw r3, 8(r1)
/* 803AD2F8 003AA0F8  93 A1 00 0C */	stw r29, 0xc(r1)
/* 803AD2FC 003AA0FC  93 C1 00 10 */	stw r30, 0x10(r1)
/* 803AD300 003AA100  90 A1 00 14 */	stw r5, 0x14(r1)
/* 803AD304 003AA104  90 01 00 18 */	stw r0, 0x18(r1)
/* 803AD308 003AA108  48 00 00 28 */	b lbl_803AD330
lbl_803AD30C:
/* 803AD30C 003AA10C  7F 8C E3 78 */	mr r12, r28
/* 803AD310 003AA110  7F E3 FB 78 */	mr r3, r31
/* 803AD314 003AA114  38 80 00 01 */	li r4, 1
/* 803AD318 003AA118  7D 89 03 A6 */	mtctr r12
/* 803AD31C 003AA11C  4E 80 04 21 */	bctrl 
/* 803AD320 003AA120  80 61 00 18 */	lwz r3, 0x18(r1)
/* 803AD324 003AA124  7F FF EA 14 */	add r31, r31, r29
/* 803AD328 003AA128  38 03 00 01 */	addi r0, r3, 1
/* 803AD32C 003AA12C  90 01 00 18 */	stw r0, 0x18(r1)
lbl_803AD330:
/* 803AD330 003AA130  80 81 00 18 */	lwz r4, 0x18(r1)
/* 803AD334 003AA134  7C 04 F0 40 */	cmplw r4, r30
/* 803AD338 003AA138  41 80 FF D4 */	blt lbl_803AD30C
/* 803AD33C 003AA13C  80 01 00 10 */	lwz r0, 0x10(r1)
/* 803AD340 003AA140  7C 04 00 40 */	cmplw r4, r0
/* 803AD344 003AA144  40 80 00 58 */	bge lbl_803AD39C
/* 803AD348 003AA148  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803AD34C 003AA14C  28 00 00 00 */	cmplwi r0, 0
/* 803AD350 003AA150  41 82 00 4C */	beq lbl_803AD39C
/* 803AD354 003AA154  80 01 00 0C */	lwz r0, 0xc(r1)
/* 803AD358 003AA158  80 61 00 08 */	lwz r3, 8(r1)
/* 803AD35C 003AA15C  7C 00 21 D6 */	mullw r0, r0, r4
/* 803AD360 003AA160  7F E3 02 14 */	add r31, r3, r0
/* 803AD364 003AA164  48 00 00 2C */	b lbl_803AD390
lbl_803AD368:
/* 803AD368 003AA168  80 01 00 0C */	lwz r0, 0xc(r1)
/* 803AD36C 003AA16C  38 80 FF FF */	li r4, -1
/* 803AD370 003AA170  81 81 00 14 */	lwz r12, 0x14(r1)
/* 803AD374 003AA174  7F E0 F8 50 */	subf r31, r0, r31
/* 803AD378 003AA178  7F E3 FB 78 */	mr r3, r31
/* 803AD37C 003AA17C  7D 89 03 A6 */	mtctr r12
/* 803AD380 003AA180  4E 80 04 21 */	bctrl 
/* 803AD384 003AA184  80 61 00 18 */	lwz r3, 0x18(r1)
/* 803AD388 003AA188  38 03 FF FF */	addi r0, r3, -1
/* 803AD38C 003AA18C  90 01 00 18 */	stw r0, 0x18(r1)
lbl_803AD390:
/* 803AD390 003AA190  80 01 00 18 */	lwz r0, 0x18(r1)
/* 803AD394 003AA194  28 00 00 00 */	cmplwi r0, 0
/* 803AD398 003AA198  40 82 FF D0 */	bne lbl_803AD368
lbl_803AD39C:
/* 803AD39C 003AA19C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 803AD3A0 003AA1A0  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 803AD3A4 003AA1A4  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 803AD3A8 003AA1A8  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 803AD3AC 003AA1AC  83 81 00 20 */	lwz r28, 0x20(r1)
/* 803AD3B0 003AA1B0  7C 08 03 A6 */	mtlr r0
/* 803AD3B4 003AA1B4  38 21 00 30 */	addi r1, r1, 0x30
/* 803AD3B8 003AA1B8  4E 80 00 20 */	blr 

.global __partial_array_destructor
__partial_array_destructor:
/* 803AD3BC 003AA1BC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 803AD3C0 003AA1C0  7C 08 02 A6 */	mflr r0
/* 803AD3C4 003AA1C4  90 01 00 24 */	stw r0, 0x24(r1)
/* 803AD3C8 003AA1C8  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 803AD3CC 003AA1CC  93 C1 00 18 */	stw r30, 0x18(r1)
/* 803AD3D0 003AA1D0  7C 9E 23 78 */	mr r30, r4
/* 803AD3D4 003AA1D4  93 A1 00 14 */	stw r29, 0x14(r1)
/* 803AD3D8 003AA1D8  7C 7D 1B 79 */	or. r29, r3, r3
/* 803AD3DC 003AA1DC  41 82 00 78 */	beq lbl_803AD454
/* 803AD3E0 003AA1E0  80 9D 00 10 */	lwz r4, 0x10(r29)
/* 803AD3E4 003AA1E4  80 1D 00 08 */	lwz r0, 8(r29)
/* 803AD3E8 003AA1E8  7C 04 00 40 */	cmplw r4, r0
/* 803AD3EC 003AA1EC  40 80 00 58 */	bge lbl_803AD444
/* 803AD3F0 003AA1F0  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 803AD3F4 003AA1F4  28 00 00 00 */	cmplwi r0, 0
/* 803AD3F8 003AA1F8  41 82 00 4C */	beq lbl_803AD444
/* 803AD3FC 003AA1FC  80 1D 00 04 */	lwz r0, 4(r29)
/* 803AD400 003AA200  80 7D 00 00 */	lwz r3, 0(r29)
/* 803AD404 003AA204  7C 00 21 D6 */	mullw r0, r0, r4
/* 803AD408 003AA208  7F E3 02 14 */	add r31, r3, r0
/* 803AD40C 003AA20C  48 00 00 2C */	b lbl_803AD438
lbl_803AD410:
/* 803AD410 003AA210  80 1D 00 04 */	lwz r0, 4(r29)
/* 803AD414 003AA214  38 80 FF FF */	li r4, -1
/* 803AD418 003AA218  81 9D 00 0C */	lwz r12, 0xc(r29)
/* 803AD41C 003AA21C  7F E0 F8 50 */	subf r31, r0, r31
/* 803AD420 003AA220  7F E3 FB 78 */	mr r3, r31
/* 803AD424 003AA224  7D 89 03 A6 */	mtctr r12
/* 803AD428 003AA228  4E 80 04 21 */	bctrl 
/* 803AD42C 003AA22C  80 7D 00 10 */	lwz r3, 0x10(r29)
/* 803AD430 003AA230  38 03 FF FF */	addi r0, r3, -1
/* 803AD434 003AA234  90 1D 00 10 */	stw r0, 0x10(r29)
lbl_803AD438:
/* 803AD438 003AA238  80 1D 00 10 */	lwz r0, 0x10(r29)
/* 803AD43C 003AA23C  28 00 00 00 */	cmplwi r0, 0
/* 803AD440 003AA240  40 82 FF D0 */	bne lbl_803AD410
lbl_803AD444:
/* 803AD444 003AA244  7F C0 07 35 */	extsh. r0, r30
/* 803AD448 003AA248  40 81 00 0C */	ble lbl_803AD454
/* 803AD44C 003AA24C  7F A3 EB 78 */	mr r3, r29
/* 803AD450 003AA250  4B FD F7 29 */	bl func_8038CB78
lbl_803AD454:
/* 803AD454 003AA254  80 01 00 24 */	lwz r0, 0x24(r1)
/* 803AD458 003AA258  7F A3 EB 78 */	mr r3, r29
/* 803AD45C 003AA25C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 803AD460 003AA260  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 803AD464 003AA264  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 803AD468 003AA268  7C 08 03 A6 */	mtlr r0
/* 803AD46C 003AA26C  38 21 00 20 */	addi r1, r1, 0x20
/* 803AD470 003AA270  4E 80 00 20 */	blr 

.global __throw_catch_compare
__throw_catch_compare:
/* 803AD474 003AA274  38 00 00 00 */	li r0, 0
/* 803AD478 003AA278  7C 86 23 79 */	or. r6, r4, r4
/* 803AD47C 003AA27C  90 05 00 00 */	stw r0, 0(r5)
/* 803AD480 003AA280  40 82 00 0C */	bne lbl_803AD48C
/* 803AD484 003AA284  38 60 00 01 */	li r3, 1
/* 803AD488 003AA288  4E 80 00 20 */	blr 
lbl_803AD48C:
/* 803AD48C 003AA28C  88 04 00 00 */	lbz r0, 0(r4)
/* 803AD490 003AA290  2C 00 00 50 */	cmpwi r0, 0x50
/* 803AD494 003AA294  40 82 00 54 */	bne lbl_803AD4E8
/* 803AD498 003AA298  8C 06 00 01 */	lbzu r0, 1(r6)
/* 803AD49C 003AA29C  2C 00 00 43 */	cmpwi r0, 0x43
/* 803AD4A0 003AA2A0  40 82 00 08 */	bne lbl_803AD4A8
/* 803AD4A4 003AA2A4  38 C6 00 01 */	addi r6, r6, 1
lbl_803AD4A8:
/* 803AD4A8 003AA2A8  88 06 00 00 */	lbz r0, 0(r6)
/* 803AD4AC 003AA2AC  2C 00 00 56 */	cmpwi r0, 0x56
/* 803AD4B0 003AA2B0  40 82 00 08 */	bne lbl_803AD4B8
/* 803AD4B4 003AA2B4  38 C6 00 01 */	addi r6, r6, 1
lbl_803AD4B8:
/* 803AD4B8 003AA2B8  88 06 00 00 */	lbz r0, 0(r6)
/* 803AD4BC 003AA2BC  2C 00 00 76 */	cmpwi r0, 0x76
/* 803AD4C0 003AA2C0  40 82 00 24 */	bne lbl_803AD4E4
/* 803AD4C4 003AA2C4  88 03 00 00 */	lbz r0, 0(r3)
/* 803AD4C8 003AA2C8  7C 00 07 74 */	extsb r0, r0
/* 803AD4CC 003AA2CC  2C 00 00 50 */	cmpwi r0, 0x50
/* 803AD4D0 003AA2D0  41 82 00 0C */	beq lbl_803AD4DC
/* 803AD4D4 003AA2D4  2C 00 00 2A */	cmpwi r0, 0x2a
/* 803AD4D8 003AA2D8  40 82 00 0C */	bne lbl_803AD4E4
lbl_803AD4DC:
/* 803AD4DC 003AA2DC  38 60 00 01 */	li r3, 1
/* 803AD4E0 003AA2E0  4E 80 00 20 */	blr 
lbl_803AD4E4:
/* 803AD4E4 003AA2E4  7C 86 23 78 */	mr r6, r4
lbl_803AD4E8:
/* 803AD4E8 003AA2E8  88 03 00 00 */	lbz r0, 0(r3)
/* 803AD4EC 003AA2EC  7C 00 07 74 */	extsb r0, r0
/* 803AD4F0 003AA2F0  2C 00 00 2A */	cmpwi r0, 0x2a
/* 803AD4F4 003AA2F4  41 82 00 14 */	beq lbl_803AD508
/* 803AD4F8 003AA2F8  40 80 01 40 */	bge lbl_803AD638
/* 803AD4FC 003AA2FC  2C 00 00 21 */	cmpwi r0, 0x21
/* 803AD500 003AA300  41 82 00 08 */	beq lbl_803AD508
/* 803AD504 003AA304  48 00 01 34 */	b lbl_803AD638
lbl_803AD508:
/* 803AD508 003AA308  88 E3 00 00 */	lbz r7, 0(r3)
/* 803AD50C 003AA30C  38 63 00 01 */	addi r3, r3, 1
/* 803AD510 003AA310  88 06 00 00 */	lbz r0, 0(r6)
/* 803AD514 003AA314  38 C6 00 01 */	addi r6, r6, 1
/* 803AD518 003AA318  7C E7 07 74 */	extsb r7, r7
/* 803AD51C 003AA31C  7C 00 07 74 */	extsb r0, r0
/* 803AD520 003AA320  7C 07 00 00 */	cmpw r7, r0
/* 803AD524 003AA324  41 82 00 0C */	beq lbl_803AD530
/* 803AD528 003AA328  38 60 00 00 */	li r3, 0
/* 803AD52C 003AA32C  4E 80 00 20 */	blr 
lbl_803AD530:
/* 803AD530 003AA330  88 06 00 00 */	lbz r0, 0(r6)
/* 803AD534 003AA334  38 C6 00 01 */	addi r6, r6, 1
/* 803AD538 003AA338  88 E3 00 00 */	lbz r7, 0(r3)
/* 803AD53C 003AA33C  7C 00 07 74 */	extsb r0, r0
/* 803AD540 003AA340  7C E7 07 74 */	extsb r7, r7
/* 803AD544 003AA344  7C 07 00 00 */	cmpw r7, r0
/* 803AD548 003AA348  40 82 00 48 */	bne lbl_803AD590
/* 803AD54C 003AA34C  2C 07 00 21 */	cmpwi r7, 0x21
/* 803AD550 003AA350  38 63 00 01 */	addi r3, r3, 1
/* 803AD554 003AA354  40 82 FF DC */	bne lbl_803AD530
/* 803AD558 003AA358  38 80 00 00 */	li r4, 0
/* 803AD55C 003AA35C  48 00 00 1C */	b lbl_803AD578
lbl_803AD560:
/* 803AD560 003AA360  1C 84 00 0A */	mulli r4, r4, 0xa
/* 803AD564 003AA364  88 03 00 00 */	lbz r0, 0(r3)
/* 803AD568 003AA368  38 63 00 01 */	addi r3, r3, 1
/* 803AD56C 003AA36C  7C 00 07 74 */	extsb r0, r0
/* 803AD570 003AA370  38 84 FF D0 */	addi r4, r4, -48
/* 803AD574 003AA374  7C 80 22 14 */	add r4, r0, r4
lbl_803AD578:
/* 803AD578 003AA378  88 03 00 00 */	lbz r0, 0(r3)
/* 803AD57C 003AA37C  2C 00 00 21 */	cmpwi r0, 0x21
/* 803AD580 003AA380  40 82 FF E0 */	bne lbl_803AD560
/* 803AD584 003AA384  90 85 00 00 */	stw r4, 0(r5)
/* 803AD588 003AA388  38 60 00 01 */	li r3, 1
/* 803AD58C 003AA38C  4E 80 00 20 */	blr 
lbl_803AD590:
/* 803AD590 003AA390  88 03 00 00 */	lbz r0, 0(r3)
/* 803AD594 003AA394  38 63 00 01 */	addi r3, r3, 1
/* 803AD598 003AA398  2C 00 00 21 */	cmpwi r0, 0x21
/* 803AD59C 003AA39C  40 82 FF F4 */	bne lbl_803AD590
lbl_803AD5A0:
/* 803AD5A0 003AA3A0  88 03 00 00 */	lbz r0, 0(r3)
/* 803AD5A4 003AA3A4  38 63 00 01 */	addi r3, r3, 1
/* 803AD5A8 003AA3A8  2C 00 00 21 */	cmpwi r0, 0x21
/* 803AD5AC 003AA3AC  40 82 FF F4 */	bne lbl_803AD5A0
/* 803AD5B0 003AA3B0  88 03 00 00 */	lbz r0, 0(r3)
/* 803AD5B4 003AA3B4  7C 00 07 75 */	extsb. r0, r0
/* 803AD5B8 003AA3B8  40 82 00 0C */	bne lbl_803AD5C4
/* 803AD5BC 003AA3BC  38 60 00 00 */	li r3, 0
/* 803AD5C0 003AA3C0  4E 80 00 20 */	blr 
lbl_803AD5C4:
/* 803AD5C4 003AA3C4  38 C4 00 01 */	addi r6, r4, 1
/* 803AD5C8 003AA3C8  4B FF FF 68 */	b lbl_803AD530
lbl_803AD5CC:
/* 803AD5CC 003AA3CC  8C 06 00 01 */	lbzu r0, 1(r6)
/* 803AD5D0 003AA3D0  38 63 00 01 */	addi r3, r3, 1
/* 803AD5D4 003AA3D4  2C 00 00 43 */	cmpwi r0, 0x43
/* 803AD5D8 003AA3D8  40 82 00 18 */	bne lbl_803AD5F0
/* 803AD5DC 003AA3DC  88 03 00 00 */	lbz r0, 0(r3)
/* 803AD5E0 003AA3E0  2C 00 00 43 */	cmpwi r0, 0x43
/* 803AD5E4 003AA3E4  40 82 00 08 */	bne lbl_803AD5EC
/* 803AD5E8 003AA3E8  38 63 00 01 */	addi r3, r3, 1
lbl_803AD5EC:
/* 803AD5EC 003AA3EC  38 C6 00 01 */	addi r6, r6, 1
lbl_803AD5F0:
/* 803AD5F0 003AA3F0  88 03 00 00 */	lbz r0, 0(r3)
/* 803AD5F4 003AA3F4  7C 04 07 74 */	extsb r4, r0
/* 803AD5F8 003AA3F8  2C 04 00 43 */	cmpwi r4, 0x43
/* 803AD5FC 003AA3FC  40 82 00 0C */	bne lbl_803AD608
/* 803AD600 003AA400  38 60 00 00 */	li r3, 0
/* 803AD604 003AA404  4E 80 00 20 */	blr 
lbl_803AD608:
/* 803AD608 003AA408  88 06 00 00 */	lbz r0, 0(r6)
/* 803AD60C 003AA40C  2C 00 00 56 */	cmpwi r0, 0x56
/* 803AD610 003AA410  40 82 00 14 */	bne lbl_803AD624
/* 803AD614 003AA414  2C 04 00 56 */	cmpwi r4, 0x56
/* 803AD618 003AA418  40 82 00 08 */	bne lbl_803AD620
/* 803AD61C 003AA41C  38 63 00 01 */	addi r3, r3, 1
lbl_803AD620:
/* 803AD620 003AA420  38 C6 00 01 */	addi r6, r6, 1
lbl_803AD624:
/* 803AD624 003AA424  88 03 00 00 */	lbz r0, 0(r3)
/* 803AD628 003AA428  2C 00 00 56 */	cmpwi r0, 0x56
/* 803AD62C 003AA42C  40 82 00 0C */	bne lbl_803AD638
/* 803AD630 003AA430  38 60 00 00 */	li r3, 0
/* 803AD634 003AA434  4E 80 00 20 */	blr 
lbl_803AD638:
/* 803AD638 003AA438  88 83 00 00 */	lbz r4, 0(r3)
/* 803AD63C 003AA43C  7C 80 07 74 */	extsb r0, r4
/* 803AD640 003AA440  2C 00 00 50 */	cmpwi r0, 0x50
/* 803AD644 003AA444  41 82 00 0C */	beq lbl_803AD650
/* 803AD648 003AA448  2C 00 00 52 */	cmpwi r0, 0x52
/* 803AD64C 003AA44C  40 82 00 34 */	bne lbl_803AD680
lbl_803AD650:
/* 803AD650 003AA450  88 06 00 00 */	lbz r0, 0(r6)
/* 803AD654 003AA454  7C 84 07 74 */	extsb r4, r4
/* 803AD658 003AA458  7C 00 07 74 */	extsb r0, r0
/* 803AD65C 003AA45C  7C 04 00 00 */	cmpw r4, r0
/* 803AD660 003AA460  41 82 FF 6C */	beq lbl_803AD5CC
/* 803AD664 003AA464  48 00 00 1C */	b lbl_803AD680
lbl_803AD668:
/* 803AD668 003AA468  7C A0 07 75 */	extsb. r0, r5
/* 803AD66C 003AA46C  40 82 00 0C */	bne lbl_803AD678
/* 803AD670 003AA470  38 60 00 01 */	li r3, 1
/* 803AD674 003AA474  4E 80 00 20 */	blr 
lbl_803AD678:
/* 803AD678 003AA478  38 63 00 01 */	addi r3, r3, 1
/* 803AD67C 003AA47C  38 C6 00 01 */	addi r6, r6, 1
lbl_803AD680:
/* 803AD680 003AA480  88 A3 00 00 */	lbz r5, 0(r3)
/* 803AD684 003AA484  88 06 00 00 */	lbz r0, 0(r6)
/* 803AD688 003AA488  7C A4 07 74 */	extsb r4, r5
/* 803AD68C 003AA48C  7C 00 07 74 */	extsb r0, r0
/* 803AD690 003AA490  7C 04 00 00 */	cmpw r4, r0
/* 803AD694 003AA494  41 82 FF D4 */	beq lbl_803AD668
/* 803AD698 003AA498  38 60 00 00 */	li r3, 0
/* 803AD69C 003AA49C  4E 80 00 20 */	blr 

.global unexpected
unexpected:
/* 803AD6A0 003AA4A0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 803AD6A4 003AA4A4  7C 08 02 A6 */	mflr r0
/* 803AD6A8 003AA4A8  90 01 00 14 */	stw r0, 0x14(r1)
/* 803AD6AC 003AA4AC  81 8D F7 7C */	lwz r12, lbl_805DC85C@sda21(r13)
/* 803AD6B0 003AA4B0  7D 89 03 A6 */	mtctr r12
/* 803AD6B4 003AA4B4  4E 80 04 21 */	bctrl 
/* 803AD6B8 003AA4B8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803AD6BC 003AA4BC  7C 08 03 A6 */	mtlr r0
/* 803AD6C0 003AA4C0  38 21 00 10 */	addi r1, r1, 0x10
/* 803AD6C4 003AA4C4  4E 80 00 20 */	blr 

.global terminate
terminate:
/* 803AD6C8 003AA4C8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 803AD6CC 003AA4CC  7C 08 02 A6 */	mflr r0
/* 803AD6D0 003AA4D0  90 01 00 14 */	stw r0, 0x14(r1)
/* 803AD6D4 003AA4D4  81 8D F7 78 */	lwz r12, lbl_805DC858@sda21(r13)
/* 803AD6D8 003AA4D8  7D 89 03 A6 */	mtctr r12
/* 803AD6DC 003AA4DC  4E 80 04 21 */	bctrl 
/* 803AD6E0 003AA4E0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803AD6E4 003AA4E4  7C 08 03 A6 */	mtlr r0
/* 803AD6E8 003AA4E8  38 21 00 10 */	addi r1, r1, 0x10
/* 803AD6EC 003AA4EC  4E 80 00 20 */	blr 

.global set_terminate
set_terminate:
/* 803AD6F0 003AA4F0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 803AD6F4 003AA4F4  7C 08 02 A6 */	mflr r0
/* 803AD6F8 003AA4F8  90 01 00 14 */	stw r0, 0x14(r1)
/* 803AD6FC 003AA4FC  81 8D F7 78 */	lwz r12, lbl_805DC858@sda21(r13)
/* 803AD700 003AA500  7D 89 03 A6 */	mtctr r12
/* 803AD704 003AA504  4E 80 04 21 */	bctrl 
/* 803AD708 003AA508  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803AD70C 003AA50C  7C 08 03 A6 */	mtlr r0
/* 803AD710 003AA510  38 21 00 10 */	addi r1, r1, 0x10
/* 803AD714 003AA514  4E 80 00 20 */	blr 

.global dthandler
dthandler:
/* 803AD718 003AA518  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 803AD71C 003AA51C  7C 08 02 A6 */	mflr r0
/* 803AD720 003AA520  90 01 00 14 */	stw r0, 0x14(r1)
/* 803AD724 003AA524  48 00 23 09 */	bl abort
/* 803AD728 003AA528  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803AD72C 003AA52C  7C 08 03 A6 */	mtlr r0
/* 803AD730 003AA530  38 21 00 10 */	addi r1, r1, 0x10
/* 803AD734 003AA534  4E 80 00 20 */	blr 