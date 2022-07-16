.include "macros.inc"

.section .text

.global DObjInfoInit
DObjInfoInit:
/* 803F4AFC 003F18FC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 803F4B00 003F1900  7C 08 02 A6 */	mflr r0
/* 803F4B04 003F1904  3C 80 80 50 */	lis r4, hsdDObj@ha
/* 803F4B08 003F1908  3C 60 80 50 */	lis r3, hsdClass@ha
/* 803F4B0C 003F190C  90 01 00 14 */	stw r0, 0x14(r1)
/* 803F4B10 003F1910  38 E0 00 48 */	li r7, 0x48
/* 803F4B14 003F1914  39 00 00 18 */	li r8, 0x18
/* 803F4B18 003F1918  93 E1 00 0C */	stw r31, 0xc(r1)
/* 803F4B1C 003F191C  3B E4 1D 10 */	addi r31, r4, hsdDObj@l
/* 803F4B20 003F1920  38 83 47 A8 */	addi r4, r3, hsdClass@l
/* 803F4B24 003F1924  38 7F 00 00 */	addi r3, r31, 0
/* 803F4B28 003F1928  38 BF 00 FC */	addi r5, r31, 0xfc
/* 803F4B2C 003F192C  38 DF 01 14 */	addi r6, r31, 0x114
/* 803F4B30 003F1930  48 02 BA 11 */	bl hsdInitClassInfo
/* 803F4B34 003F1934  3C C0 80 3F */	lis r6, DObjRelease@ha
/* 803F4B38 003F1938  3C A0 80 3F */	lis r5, DObjAmnesia@ha
/* 803F4B3C 003F193C  3C 80 80 3F */	lis r4, HSD_DObjDisp@ha
/* 803F4B40 003F1940  3C 60 80 3F */	lis r3, DObjLoad@ha
/* 803F4B44 003F1944  38 E6 4A 58 */	addi r7, r6, DObjRelease@l
/* 803F4B48 003F1948  38 DF 00 00 */	addi r6, r31, 0
/* 803F4B4C 003F194C  38 A5 4A B4 */	addi r5, r5, DObjAmnesia@l
/* 803F4B50 003F1950  38 84 49 98 */	addi r4, r4, HSD_DObjDisp@l
/* 803F4B54 003F1954  38 03 46 5C */	addi r0, r3, DObjLoad@l
/* 803F4B58 003F1958  90 E6 00 30 */	stw r7, 0x30(r6)
/* 803F4B5C 003F195C  90 A6 00 38 */	stw r5, 0x38(r6)
/* 803F4B60 003F1960  90 86 00 3C */	stw r4, 0x3c(r6)
/* 803F4B64 003F1964  90 06 00 40 */	stw r0, 0x40(r6)
/* 803F4B68 003F1968  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 803F4B6C 003F196C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803F4B70 003F1970  7C 08 03 A6 */	mtlr r0
/* 803F4B74 003F1974  38 21 00 10 */	addi r1, r1, 0x10
/* 803F4B78 003F1978  4E 80 00 20 */	blr 


.section .data
    .balign 4
    .asciz "can not find specified pobj in link.\n"
    .balign 4
    .asciz "can not find specified pobj in link."
    .balign 4
    .asciz "dobj->mobj == mobj"
    .balign 4
    .asciz "sysdolphin_base_library"
    .balign 4
    .asciz "hsd_dobj"
