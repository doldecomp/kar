.include "macros.inc"

.section .init

.global __init_hardware
__init_hardware:
/* 800054EC 000024EC  7C 00 00 A6 */	mfmsr r0
/* 800054F0 000024F0  60 00 20 00 */	ori r0, r0, 0x2000
/* 800054F4 000024F4  7C 00 01 24 */	mtmsr r0
/* 800054F8 000024F8  7F E8 02 A6 */	mflr r31
/* 800054FC 000024FC  48 3C D8 A5 */	bl func_803D2DA0
/* 80005500 00002500  48 3C CE 49 */	bl __OSFPRInit
/* 80005504 00002504  48 3C ED 25 */	bl func_803D4228
/* 80005508 00002508  7F E8 03 A6 */	mtlr r31
/* 8000550C 0000250C  4E 80 00 20 */	blr 

.global __flush_cache
__flush_cache:
/* 80005510 00002510  3C A0 FF FF */	lis r5, 0xFFFFFFF1@h
/* 80005514 00002514  60 A5 FF F1 */	ori r5, r5, 0xFFFFFFF1@l
/* 80005518 00002518  7C A5 18 38 */	and r5, r5, r3
/* 8000551C 0000251C  7C 65 18 50 */	subf r3, r5, r3
/* 80005520 00002520  7C 84 1A 14 */	add r4, r4, r3
lbl_80005524:
/* 80005524 00002524  7C 00 28 6C */	dcbst 0, r5
/* 80005528 00002528  7C 00 04 AC */	sync 0
/* 8000552C 0000252C  7C 00 2F AC */	icbi 0, r5
/* 80005530 00002530  30 A5 00 08 */	addic r5, r5, 8
/* 80005534 00002534  34 84 FF F8 */	addic. r4, r4, -8
/* 80005538 00002538  40 80 FF EC */	bge lbl_80005524
/* 8000553C 0000253C  4C 00 01 2C */	isync 
/* 80005540 00002540  4E 80 00 20 */	blr 
