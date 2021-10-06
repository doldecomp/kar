.include "macros.inc"

.section .init  # 0x80003100 - 0x800054EC

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

.global func_80005544
func_80005544:
/* 80005544 00002544  80 00 31 00 */	lwz r0, 0x3100(0)
/* 80005548 00002548  80 00 31 00 */	lwz r0, 0x3100(0)
/* 8000554C 0000254C  00 00 24 E8 */	.4byte 0x000024E8  /* unknown instruction */
/* 80005550 00002550  80 00 56 00 */	lwz r0, 0x5600(0)
/* 80005554 00002554  80 00 56 00 */	lwz r0, 0x5600(0)
/* 80005558 00002558  00 00 00 F4 */	.4byte 0x000000F4  /* unknown instruction */
/* 8000555C 0000255C  80 00 57 00 */	lwz r0, 0x5700(0)
/* 80005560 00002560  80 00 57 00 */	lwz r0, 0x5700(0)
/* 80005564 00002564  00 00 00 EC */	.4byte 0x000000EC  /* unknown instruction */
/* 80005568 00002568  80 00 58 00 */	lwz r0, 0x5800(0)
/* 8000556C 0000256C  80 00 58 00 */	lwz r0, 0x5800(0)
/* 80005570 00002570  00 48 3C 24 */	.4byte 0x00483C24  /* unknown instruction */
/* 80005574 00002574  80 48 94 40 */	lwz r2, -0x6bc0(r8)
/* 80005578 00002578  80 48 94 40 */	lwz r2, -0x6bc0(r8)
/* 8000557C 0000257C  00 00 00 10 */	.4byte 0x00000010  /* unknown instruction */
/* 80005580 00002580  80 48 94 60 */	lwz r2, -0x6ba0(r8)
/* 80005584 00002584  80 48 94 60 */	lwz r2, -0x6ba0(r8)
/* 80005588 00002588  00 00 00 10 */	.4byte 0x00000010  /* unknown instruction */
/* 8000558C 0000258C  80 48 94 80 */	lwz r2, -0x6b80(r8)
/* 80005590 00002590  80 48 94 80 */	lwz r2, -0x6b80(r8)
/* 80005594 00002594  00 00 B9 C8 */	.4byte 0x0000B9C8  /* unknown instruction */
/* 80005598 00002598  80 49 4E 60 */	lwz r2, 0x4e60(r9)
/* 8000559C 0000259C  80 49 4E 60 */	lwz r2, 0x4e60(r9)
/* 800055A0 000025A0  00 0A 04 9C */	.4byte 0x000A049C  /* unknown instruction */
/* 800055A4 000025A4  80 5D 50 E0 */	lwz r2, 0x50e0(r29)
/* 800055A8 000025A8  80 5D 50 E0 */	lwz r2, 0x50e0(r29)
/* 800055AC 000025AC  00 00 84 3F */	.4byte 0x0000843F  /* unknown instruction */
/* 800055B0 000025B0  80 5D E7 00 */	lwz r2, -0x1900(r29)
/* 800055B4 000025B4  80 5D E7 00 */	lwz r2, -0x1900(r29)
/* 800055B8 000025B8  00 00 7B D0 */	.4byte 0x00007BD0  /* unknown instruction */
/* 800055BC 000025BC  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 800055C0 000025C0  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 800055C4 000025C4  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
.global lbl_800055C8
lbl_800055C8:
/* 800055C8 000025C8  80 53 53 00 */	lwz r2, 0x5300(r19)
/* 800055CC 000025CC  00 09 FD D0 */	.4byte 0x0009FDD0  /* unknown instruction */
/* 800055D0 000025D0  80 5D D5 20 */	lwz r2, -0x2ae0(r29)
/* 800055D4 000025D4  00 00 11 E0 */	.4byte 0x000011E0  /* unknown instruction */
/* 800055D8 000025D8  80 5E 62 E0 */	lwz r2, 0x62e0(r30)
/* 800055DC 000025DC  00 00 00 B0 */	.4byte 0x000000B0  /* unknown instruction */
/* 800055E0 000025E0  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 800055E4 000025E4  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 800055E8 000025E8  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 800055EC 000025EC  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 800055F0 000025F0  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 800055F4 000025F4  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 800055F8 000025F8  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 800055FC 000025FC  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
