.include "macros.inc"

.section .text

.global func_80428C50
func_80428C50:
/* 80428C50 00425A50  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80428C54 00425A54  7C 08 02 A6 */	mflr r0
/* 80428C58 00425A58  90 01 00 24 */	stw r0, 0x24(r1)
/* 80428C5C 00425A5C  39 61 00 20 */	addi r11, r1, 0x20
/* 80428C60 00425A60  4B F8 4E F5 */	bl _savegpr_27
/* 80428C64 00425A64  3D 00 80 59 */	lis r8, lbl_8058C190@ha
/* 80428C68 00425A68  7C BD 2B 78 */	mr r29, r5
/* 80428C6C 00425A6C  88 08 C1 90 */	lbz r0, lbl_8058C190@l(r8)
/* 80428C70 00425A70  7C 7B 1B 78 */	mr r27, r3
/* 80428C74 00425A74  57 A3 06 3E */	clrlwi r3, r29, 0x18
/* 80428C78 00425A78  7C 9C 23 78 */	mr r28, r4
/* 80428C7C 00425A7C  7C 03 00 40 */	cmplw r3, r0
/* 80428C80 00425A80  7C DE 33 78 */	mr r30, r6
/* 80428C84 00425A84  7C FF 3B 78 */	mr r31, r7
/* 80428C88 00425A88  40 81 00 1C */	ble lbl_80428CA4
/* 80428C8C 00425A8C  3C 60 80 50 */	lis r3, lbl_80504DD8@ha
/* 80428C90 00425A90  3C A0 80 50 */	lis r5, lbl_80504DE4@ha
/* 80428C94 00425A94  38 63 4D D8 */	addi r3, r3, lbl_80504DD8@l
/* 80428C98 00425A98  38 80 00 A8 */	li r4, 0xa8
/* 80428C9C 00425A9C  38 A5 4D E4 */	addi r5, r5, lbl_80504DE4@l
/* 80428CA0 00425AA0  4B FF F8 19 */	bl __assert
lbl_80428CA4:
/* 80428CA4 00425AA4  3C 60 80 59 */	lis r3, lbl_8058C19C@ha
/* 80428CA8 00425AA8  38 63 C1 9C */	addi r3, r3, lbl_8058C19C@l
/* 80428CAC 00425AAC  4B FE F4 39 */	bl HSD_ObjAlloc
/* 80428CB0 00425AB0  28 03 00 00 */	cmplwi r3, 0
/* 80428CB4 00425AB4  40 82 00 0C */	bne lbl_80428CC0
/* 80428CB8 00425AB8  38 60 00 00 */	li r3, 0
/* 80428CBC 00425ABC  48 00 02 54 */	b lbl_80428F10
lbl_80428CC0:
/* 80428CC0 00425AC0  B3 83 00 00 */	sth r28, 0(r3)
/* 80428CC4 00425AC4  38 80 00 FF */	li r4, 0xff
/* 80428CC8 00425AC8  38 00 00 00 */	li r0, 0
/* 80428CCC 00425ACC  2C 1B 00 02 */	cmpwi r27, 2
/* 80428CD0 00425AD0  9B A3 00 02 */	stb r29, 2(r3)
/* 80428CD4 00425AD4  98 83 00 03 */	stb r4, 3(r3)
/* 80428CD8 00425AD8  9B C3 00 04 */	stb r30, 4(r3)
/* 80428CDC 00425ADC  98 03 00 05 */	stb r0, 5(r3)
/* 80428CE0 00425AE0  98 83 00 06 */	stb r4, 6(r3)
/* 80428CE4 00425AE4  98 83 00 07 */	stb r4, 7(r3)
/* 80428CE8 00425AE8  90 03 00 14 */	stw r0, 0x14(r3)
/* 80428CEC 00425AEC  90 03 00 10 */	stw r0, 0x10(r3)
/* 80428CF0 00425AF0  90 03 00 18 */	stw r0, 0x18(r3)
/* 80428CF4 00425AF4  90 03 00 1C */	stw r0, 0x1c(r3)
/* 80428CF8 00425AF8  90 03 00 24 */	stw r0, 0x24(r3)
/* 80428CFC 00425AFC  90 03 00 20 */	stw r0, 0x20(r3)
/* 80428D00 00425B00  90 03 00 28 */	stw r0, 0x28(r3)
/* 80428D04 00425B04  90 03 00 2C */	stw r0, 0x2c(r3)
/* 80428D08 00425B08  90 03 00 30 */	stw r0, 0x30(r3)
/* 80428D0C 00425B0C  41 82 01 4C */	beq lbl_80428E58
/* 80428D10 00425B10  40 80 00 14 */	bge lbl_80428D24
/* 80428D14 00425B14  2C 1B 00 00 */	cmpwi r27, 0
/* 80428D18 00425B18  41 82 00 18 */	beq lbl_80428D30
/* 80428D1C 00425B1C  40 80 00 9C */	bge lbl_80428DB8
/* 80428D20 00425B20  48 00 01 F0 */	b lbl_80428F10
lbl_80428D24:
/* 80428D24 00425B24  2C 1B 00 04 */	cmpwi r27, 4
/* 80428D28 00425B28  40 80 01 E8 */	bge lbl_80428F10
/* 80428D2C 00425B2C  48 00 01 88 */	b lbl_80428EB4
lbl_80428D30:
/* 80428D30 00425B30  88 C3 00 02 */	lbz r6, 2(r3)
/* 80428D34 00425B34  80 8D 12 50 */	lwz r4, lbl_805DE330@sda21(r13)
/* 80428D38 00425B38  54 C0 15 BA */	rlwinm r0, r6, 2, 0x16, 0x1d
/* 80428D3C 00425B3C  7C A4 00 2E */	lwzx r5, r4, r0
/* 80428D40 00425B40  48 00 00 08 */	b lbl_80428D48
lbl_80428D44:
/* 80428D44 00425B44  80 A5 00 0C */	lwz r5, 0xc(r5)
lbl_80428D48:
/* 80428D48 00425B48  28 05 00 00 */	cmplwi r5, 0
/* 80428D4C 00425B4C  41 82 00 14 */	beq lbl_80428D60
/* 80428D50 00425B50  88 85 00 04 */	lbz r4, 4(r5)
/* 80428D54 00425B54  88 03 00 04 */	lbz r0, 4(r3)
/* 80428D58 00425B58  7C 04 00 40 */	cmplw r4, r0
/* 80428D5C 00425B5C  41 81 FF E8 */	bgt lbl_80428D44
lbl_80428D60:
/* 80428D60 00425B60  28 05 00 00 */	cmplwi r5, 0
/* 80428D64 00425B64  90 A3 00 0C */	stw r5, 0xc(r3)
/* 80428D68 00425B68  41 82 00 14 */	beq lbl_80428D7C
/* 80428D6C 00425B6C  80 05 00 08 */	lwz r0, 8(r5)
/* 80428D70 00425B70  90 03 00 08 */	stw r0, 8(r3)
/* 80428D74 00425B74  90 65 00 08 */	stw r3, 8(r5)
/* 80428D78 00425B78  48 00 00 1C */	b lbl_80428D94
lbl_80428D7C:
/* 80428D7C 00425B7C  80 8D 12 54 */	lwz r4, lbl_805DE334@sda21(r13)
/* 80428D80 00425B80  54 C5 10 3A */	slwi r5, r6, 2
/* 80428D84 00425B84  7C 04 28 2E */	lwzx r0, r4, r5
/* 80428D88 00425B88  90 03 00 08 */	stw r0, 8(r3)
/* 80428D8C 00425B8C  80 8D 12 54 */	lwz r4, lbl_805DE334@sda21(r13)
/* 80428D90 00425B90  7C 64 29 2E */	stwx r3, r4, r5
lbl_80428D94:
/* 80428D94 00425B94  80 83 00 08 */	lwz r4, 8(r3)
/* 80428D98 00425B98  28 04 00 00 */	cmplwi r4, 0
/* 80428D9C 00425B9C  41 82 00 0C */	beq lbl_80428DA8
/* 80428DA0 00425BA0  90 64 00 0C */	stw r3, 0xc(r4)
/* 80428DA4 00425BA4  48 00 01 6C */	b lbl_80428F10
lbl_80428DA8:
/* 80428DA8 00425BA8  80 8D 12 50 */	lwz r4, lbl_805DE330@sda21(r13)
/* 80428DAC 00425BAC  54 C0 10 3A */	slwi r0, r6, 2
/* 80428DB0 00425BB0  7C 64 01 2E */	stwx r3, r4, r0
/* 80428DB4 00425BB4  48 00 01 5C */	b lbl_80428F10
lbl_80428DB8:
/* 80428DB8 00425BB8  88 E3 00 02 */	lbz r7, 2(r3)
/* 80428DBC 00425BBC  80 8D 12 54 */	lwz r4, lbl_805DE334@sda21(r13)
/* 80428DC0 00425BC0  54 E6 15 BA */	rlwinm r6, r7, 2, 0x16, 0x1d
/* 80428DC4 00425BC4  7C A4 30 2E */	lwzx r5, r4, r6
/* 80428DC8 00425BC8  48 00 00 08 */	b lbl_80428DD0
lbl_80428DCC:
/* 80428DCC 00425BCC  80 A5 00 08 */	lwz r5, 8(r5)
lbl_80428DD0:
/* 80428DD0 00425BD0  28 05 00 00 */	cmplwi r5, 0
/* 80428DD4 00425BD4  41 82 00 14 */	beq lbl_80428DE8
/* 80428DD8 00425BD8  88 85 00 04 */	lbz r4, 4(r5)
/* 80428DDC 00425BDC  88 03 00 04 */	lbz r0, 4(r3)
/* 80428DE0 00425BE0  7C 04 00 40 */	cmplw r4, r0
/* 80428DE4 00425BE4  41 80 FF E8 */	blt lbl_80428DCC
lbl_80428DE8:
/* 80428DE8 00425BE8  28 05 00 00 */	cmplwi r5, 0
/* 80428DEC 00425BEC  41 82 00 0C */	beq lbl_80428DF8
/* 80428DF0 00425BF0  80 85 00 0C */	lwz r4, 0xc(r5)
/* 80428DF4 00425BF4  48 00 00 0C */	b lbl_80428E00
lbl_80428DF8:
/* 80428DF8 00425BF8  80 8D 12 50 */	lwz r4, lbl_805DE330@sda21(r13)
/* 80428DFC 00425BFC  7C 84 30 2E */	lwzx r4, r4, r6
lbl_80428E00:
/* 80428E00 00425C00  28 04 00 00 */	cmplwi r4, 0
/* 80428E04 00425C04  90 83 00 0C */	stw r4, 0xc(r3)
/* 80428E08 00425C08  41 82 00 14 */	beq lbl_80428E1C
/* 80428E0C 00425C0C  80 04 00 08 */	lwz r0, 8(r4)
/* 80428E10 00425C10  90 03 00 08 */	stw r0, 8(r3)
/* 80428E14 00425C14  90 64 00 08 */	stw r3, 8(r4)
/* 80428E18 00425C18  48 00 00 1C */	b lbl_80428E34
lbl_80428E1C:
/* 80428E1C 00425C1C  80 8D 12 54 */	lwz r4, lbl_805DE334@sda21(r13)
/* 80428E20 00425C20  54 E5 10 3A */	slwi r5, r7, 2
/* 80428E24 00425C24  7C 04 28 2E */	lwzx r0, r4, r5
/* 80428E28 00425C28  90 03 00 08 */	stw r0, 8(r3)
/* 80428E2C 00425C2C  80 8D 12 54 */	lwz r4, lbl_805DE334@sda21(r13)
/* 80428E30 00425C30  7C 64 29 2E */	stwx r3, r4, r5
lbl_80428E34:
/* 80428E34 00425C34  80 83 00 08 */	lwz r4, 8(r3)
/* 80428E38 00425C38  28 04 00 00 */	cmplwi r4, 0
/* 80428E3C 00425C3C  41 82 00 0C */	beq lbl_80428E48
/* 80428E40 00425C40  90 64 00 0C */	stw r3, 0xc(r4)
/* 80428E44 00425C44  48 00 00 CC */	b lbl_80428F10
lbl_80428E48:
/* 80428E48 00425C48  80 8D 12 50 */	lwz r4, lbl_805DE330@sda21(r13)
/* 80428E4C 00425C4C  54 E0 10 3A */	slwi r0, r7, 2
/* 80428E50 00425C50  7C 64 01 2E */	stwx r3, r4, r0
/* 80428E54 00425C54  48 00 00 BC */	b lbl_80428F10
lbl_80428E58:
/* 80428E58 00425C58  88 A3 00 02 */	lbz r5, 2(r3)
/* 80428E5C 00425C5C  28 1F 00 00 */	cmplwi r31, 0
/* 80428E60 00425C60  93 E3 00 0C */	stw r31, 0xc(r3)
/* 80428E64 00425C64  41 82 00 14 */	beq lbl_80428E78
/* 80428E68 00425C68  80 1F 00 08 */	lwz r0, 8(r31)
/* 80428E6C 00425C6C  90 03 00 08 */	stw r0, 8(r3)
/* 80428E70 00425C70  90 7F 00 08 */	stw r3, 8(r31)
/* 80428E74 00425C74  48 00 00 1C */	b lbl_80428E90
lbl_80428E78:
/* 80428E78 00425C78  80 8D 12 54 */	lwz r4, lbl_805DE334@sda21(r13)
/* 80428E7C 00425C7C  54 A6 10 3A */	slwi r6, r5, 2
/* 80428E80 00425C80  7C 04 30 2E */	lwzx r0, r4, r6
/* 80428E84 00425C84  90 03 00 08 */	stw r0, 8(r3)
/* 80428E88 00425C88  80 8D 12 54 */	lwz r4, lbl_805DE334@sda21(r13)
/* 80428E8C 00425C8C  7C 64 31 2E */	stwx r3, r4, r6
lbl_80428E90:
/* 80428E90 00425C90  80 83 00 08 */	lwz r4, 8(r3)
/* 80428E94 00425C94  28 04 00 00 */	cmplwi r4, 0
/* 80428E98 00425C98  41 82 00 0C */	beq lbl_80428EA4
/* 80428E9C 00425C9C  90 64 00 0C */	stw r3, 0xc(r4)
/* 80428EA0 00425CA0  48 00 00 70 */	b lbl_80428F10
lbl_80428EA4:
/* 80428EA4 00425CA4  80 8D 12 50 */	lwz r4, lbl_805DE330@sda21(r13)
/* 80428EA8 00425CA8  54 A0 10 3A */	slwi r0, r5, 2
/* 80428EAC 00425CAC  7C 64 01 2E */	stwx r3, r4, r0
/* 80428EB0 00425CB0  48 00 00 60 */	b lbl_80428F10
lbl_80428EB4:
/* 80428EB4 00425CB4  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 80428EB8 00425CB8  88 A3 00 02 */	lbz r5, 2(r3)
/* 80428EBC 00425CBC  28 04 00 00 */	cmplwi r4, 0
/* 80428EC0 00425CC0  90 83 00 0C */	stw r4, 0xc(r3)
/* 80428EC4 00425CC4  41 82 00 14 */	beq lbl_80428ED8
/* 80428EC8 00425CC8  80 04 00 08 */	lwz r0, 8(r4)
/* 80428ECC 00425CCC  90 03 00 08 */	stw r0, 8(r3)
/* 80428ED0 00425CD0  90 64 00 08 */	stw r3, 8(r4)
/* 80428ED4 00425CD4  48 00 00 1C */	b lbl_80428EF0
lbl_80428ED8:
/* 80428ED8 00425CD8  80 8D 12 54 */	lwz r4, lbl_805DE334@sda21(r13)
/* 80428EDC 00425CDC  54 A6 10 3A */	slwi r6, r5, 2
/* 80428EE0 00425CE0  7C 04 30 2E */	lwzx r0, r4, r6
/* 80428EE4 00425CE4  90 03 00 08 */	stw r0, 8(r3)
/* 80428EE8 00425CE8  80 8D 12 54 */	lwz r4, lbl_805DE334@sda21(r13)
/* 80428EEC 00425CEC  7C 64 31 2E */	stwx r3, r4, r6
lbl_80428EF0:
/* 80428EF0 00425CF0  80 83 00 08 */	lwz r4, 8(r3)
/* 80428EF4 00425CF4  28 04 00 00 */	cmplwi r4, 0
/* 80428EF8 00425CF8  41 82 00 0C */	beq lbl_80428F04
/* 80428EFC 00425CFC  90 64 00 0C */	stw r3, 0xc(r4)
/* 80428F00 00425D00  48 00 00 10 */	b lbl_80428F10
lbl_80428F04:
/* 80428F04 00425D04  80 8D 12 50 */	lwz r4, lbl_805DE330@sda21(r13)
/* 80428F08 00425D08  54 A0 10 3A */	slwi r0, r5, 2
/* 80428F0C 00425D0C  7C 64 01 2E */	stwx r3, r4, r0
lbl_80428F10:
/* 80428F10 00425D10  39 61 00 20 */	addi r11, r1, 0x20
/* 80428F14 00425D14  4B F8 4C 8D */	bl _restgpr_27
/* 80428F18 00425D18  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80428F1C 00425D1C  7C 08 03 A6 */	mtlr r0
/* 80428F20 00425D20  38 21 00 20 */	addi r1, r1, 0x20
/* 80428F24 00425D24  4E 80 00 20 */	blr 

.global func_80428F28
func_80428F28:
/* 80428F28 00425D28  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80428F2C 00425D2C  7C 08 02 A6 */	mflr r0
/* 80428F30 00425D30  7C 67 1B 78 */	mr r7, r3
/* 80428F34 00425D34  7C A6 2B 78 */	mr r6, r5
/* 80428F38 00425D38  90 01 00 14 */	stw r0, 0x14(r1)
/* 80428F3C 00425D3C  7C 80 23 78 */	mr r0, r4
/* 80428F40 00425D40  7C E4 3B 78 */	mr r4, r7
/* 80428F44 00425D44  38 60 00 00 */	li r3, 0
/* 80428F48 00425D48  7C 05 03 78 */	mr r5, r0
/* 80428F4C 00425D4C  38 E0 00 00 */	li r7, 0
/* 80428F50 00425D50  4B FF FD 01 */	bl func_80428C50
/* 80428F54 00425D54  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80428F58 00425D58  7C 08 03 A6 */	mtlr r0
/* 80428F5C 00425D5C  38 21 00 10 */	addi r1, r1, 0x10
/* 80428F60 00425D60  4E 80 00 20 */	blr 

.global func_80428F64
func_80428F64:
/* 80428F64 00425D64  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80428F68 00425D68  7C 08 02 A6 */	mflr r0
/* 80428F6C 00425D6C  3C 80 80 59 */	lis r4, lbl_8058C1F4@ha
/* 80428F70 00425D70  90 01 00 14 */	stw r0, 0x14(r1)
/* 80428F74 00425D74  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80428F78 00425D78  7C 7F 1B 78 */	mr r31, r3
/* 80428F7C 00425D7C  8C 64 C1 F4 */	lbzu r3, lbl_8058C1F4@l(r4)
/* 80428F80 00425D80  54 60 CF FF */	rlwinm. r0, r3, 0x19, 0x1f, 0x1f
/* 80428F84 00425D84  40 82 00 20 */	bne lbl_80428FA4
/* 80428F88 00425D88  80 0D 12 44 */	lwz r0, lbl_805DE324@sda21(r13)
/* 80428F8C 00425D8C  7C 1F 00 40 */	cmplw r31, r0
/* 80428F90 00425D90  40 82 00 14 */	bne lbl_80428FA4
/* 80428F94 00425D94  38 00 00 01 */	li r0, 1
/* 80428F98 00425D98  50 03 36 72 */	rlwimi r3, r0, 6, 0x19, 0x19
/* 80428F9C 00425D9C  98 64 00 00 */	stb r3, 0(r4)
/* 80428FA0 00425DA0  48 00 00 98 */	b lbl_80429038
lbl_80428FA4:
/* 80428FA4 00425DA4  7F E3 FB 78 */	mr r3, r31
/* 80428FA8 00425DA8  48 00 0E 15 */	bl func_80429DBC
/* 80428FAC 00425DAC  7F E3 FB 78 */	mr r3, r31
/* 80428FB0 00425DB0  48 00 0D 01 */	bl func_80429CB0
/* 80428FB4 00425DB4  7F E3 FB 78 */	mr r3, r31
/* 80428FB8 00425DB8  4B FF FB 21 */	bl func_80428AD8
/* 80428FBC 00425DBC  88 1F 00 03 */	lbz r0, 3(r31)
/* 80428FC0 00425DC0  28 00 00 FF */	cmplwi r0, 0xff
/* 80428FC4 00425DC4  41 82 00 0C */	beq lbl_80428FD0
/* 80428FC8 00425DC8  7F E3 FB 78 */	mr r3, r31
/* 80428FCC 00425DCC  48 00 07 A9 */	bl func_80429774
lbl_80428FD0:
/* 80428FD0 00425DD0  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 80428FD4 00425DD4  28 03 00 00 */	cmplwi r3, 0
/* 80428FD8 00425DD8  41 82 00 10 */	beq lbl_80428FE8
/* 80428FDC 00425DDC  80 1F 00 08 */	lwz r0, 8(r31)
/* 80428FE0 00425DE0  90 03 00 08 */	stw r0, 8(r3)
/* 80428FE4 00425DE4  48 00 00 18 */	b lbl_80428FFC
lbl_80428FE8:
/* 80428FE8 00425DE8  88 1F 00 02 */	lbz r0, 2(r31)
/* 80428FEC 00425DEC  80 9F 00 08 */	lwz r4, 8(r31)
/* 80428FF0 00425DF0  80 6D 12 54 */	lwz r3, lbl_805DE334@sda21(r13)
/* 80428FF4 00425DF4  54 00 10 3A */	slwi r0, r0, 2
/* 80428FF8 00425DF8  7C 83 01 2E */	stwx r4, r3, r0
lbl_80428FFC:
/* 80428FFC 00425DFC  80 7F 00 08 */	lwz r3, 8(r31)
/* 80429000 00425E00  28 03 00 00 */	cmplwi r3, 0
/* 80429004 00425E04  41 82 00 10 */	beq lbl_80429014
/* 80429008 00425E08  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 8042900C 00425E0C  90 03 00 0C */	stw r0, 0xc(r3)
/* 80429010 00425E10  48 00 00 18 */	b lbl_80429028
lbl_80429014:
/* 80429014 00425E14  88 1F 00 02 */	lbz r0, 2(r31)
/* 80429018 00425E18  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 8042901C 00425E1C  80 6D 12 50 */	lwz r3, lbl_805DE330@sda21(r13)
/* 80429020 00425E20  54 00 10 3A */	slwi r0, r0, 2
/* 80429024 00425E24  7C 83 01 2E */	stwx r4, r3, r0
lbl_80429028:
/* 80429028 00425E28  3C 60 80 59 */	lis r3, lbl_8058C19C@ha
/* 8042902C 00425E2C  7F E4 FB 78 */	mr r4, r31
/* 80429030 00425E30  38 63 C1 9C */	addi r3, r3, lbl_8058C19C@l
/* 80429034 00425E34  4B FE F2 01 */	bl HSD_ObjFree
lbl_80429038:
/* 80429038 00425E38  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8042903C 00425E3C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80429040 00425E40  7C 08 03 A6 */	mtlr r0
/* 80429044 00425E44  38 21 00 10 */	addi r1, r1, 0x10
/* 80429048 00425E48  4E 80 00 20 */	blr 

.global func_8042904C
func_8042904C:
/* 8042904C 00425E4C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80429050 00425E50  7C 08 02 A6 */	mflr r0
/* 80429054 00425E54  90 01 00 34 */	stw r0, 0x34(r1)
/* 80429058 00425E58  39 61 00 30 */	addi r11, r1, 0x30
/* 8042905C 00425E5C  4B F8 4A F1 */	bl _savegpr_25
/* 80429060 00425E60  3D 00 80 59 */	lis r8, lbl_8058C190@ha
/* 80429064 00425E64  7C BC 2B 78 */	mr r28, r5
/* 80429068 00425E68  88 08 C1 90 */	lbz r0, lbl_8058C190@l(r8)
/* 8042906C 00425E6C  7C 7A 1B 78 */	mr r26, r3
/* 80429070 00425E70  57 83 06 3E */	clrlwi r3, r28, 0x18
/* 80429074 00425E74  7C 9B 23 78 */	mr r27, r4
/* 80429078 00425E78  7C 03 00 40 */	cmplw r3, r0
/* 8042907C 00425E7C  7C DD 33 78 */	mr r29, r6
/* 80429080 00425E80  7C FE 3B 78 */	mr r30, r7
/* 80429084 00425E84  40 81 00 1C */	ble lbl_804290A0
/* 80429088 00425E88  3C 60 80 50 */	lis r3, lbl_80504DD8@ha
/* 8042908C 00425E8C  3C A0 80 50 */	lis r5, lbl_80504DE4@ha
/* 80429090 00425E90  38 63 4D D8 */	addi r3, r3, lbl_80504DD8@l
/* 80429094 00425E94  38 80 01 9F */	li r4, 0x19f
/* 80429098 00425E98  38 A5 4D E4 */	addi r5, r5, lbl_80504DE4@l
/* 8042909C 00425E9C  4B FF F4 1D */	bl __assert
lbl_804290A0:
/* 804290A0 00425EA0  3C 60 80 59 */	lis r3, lbl_8058C1F4@ha
/* 804290A4 00425EA4  38 83 C1 F4 */	addi r4, r3, lbl_8058C1F4@l
/* 804290A8 00425EA8  88 64 00 00 */	lbz r3, 0(r4)
/* 804290AC 00425EAC  54 60 CF FF */	rlwinm. r0, r3, 0x19, 0x1f, 0x1f
/* 804290B0 00425EB0  40 82 00 30 */	bne lbl_804290E0
/* 804290B4 00425EB4  80 0D 12 44 */	lwz r0, lbl_805DE324@sda21(r13)
/* 804290B8 00425EB8  7C 1B 00 40 */	cmplw r27, r0
/* 804290BC 00425EBC  40 82 00 24 */	bne lbl_804290E0
/* 804290C0 00425EC0  38 00 00 01 */	li r0, 1
/* 804290C4 00425EC4  93 44 00 04 */	stw r26, 4(r4)
/* 804290C8 00425EC8  50 03 26 F6 */	rlwimi r3, r0, 4, 0x1b, 0x1b
/* 804290CC 00425ECC  98 64 00 00 */	stb r3, 0(r4)
/* 804290D0 00425ED0  9B 84 00 08 */	stb r28, 8(r4)
/* 804290D4 00425ED4  9B A4 00 09 */	stb r29, 9(r4)
/* 804290D8 00425ED8  93 C4 00 0C */	stw r30, 0xc(r4)
/* 804290DC 00425EDC  48 00 03 00 */	b lbl_804293DC
lbl_804290E0:
/* 804290E0 00425EE0  83 3B 00 18 */	lwz r25, 0x18(r27)
/* 804290E4 00425EE4  3B E0 00 00 */	li r31, 0
/* 804290E8 00425EE8  48 00 00 1C */	b lbl_80429104
lbl_804290EC:
/* 804290EC 00425EEC  7F 23 CB 78 */	mr r3, r25
/* 804290F0 00425EF0  4B FF F6 ED */	bl func_804287DC
/* 804290F4 00425EF4  80 19 00 00 */	lwz r0, 0(r25)
/* 804290F8 00425EF8  93 F9 00 00 */	stw r31, 0(r25)
/* 804290FC 00425EFC  7F 3F CB 78 */	mr r31, r25
/* 80429100 00425F00  7C 19 03 78 */	mr r25, r0
lbl_80429104:
/* 80429104 00425F04  28 19 00 00 */	cmplwi r25, 0
/* 80429108 00425F08  40 82 FF E4 */	bne lbl_804290EC
/* 8042910C 00425F0C  38 00 00 00 */	li r0, 0
/* 80429110 00425F10  90 1B 00 18 */	stw r0, 0x18(r27)
/* 80429114 00425F14  80 7B 00 0C */	lwz r3, 0xc(r27)
/* 80429118 00425F18  28 03 00 00 */	cmplwi r3, 0
/* 8042911C 00425F1C  41 82 00 10 */	beq lbl_8042912C
/* 80429120 00425F20  80 1B 00 08 */	lwz r0, 8(r27)
/* 80429124 00425F24  90 03 00 08 */	stw r0, 8(r3)
/* 80429128 00425F28  48 00 00 18 */	b lbl_80429140
lbl_8042912C:
/* 8042912C 00425F2C  88 1B 00 02 */	lbz r0, 2(r27)
/* 80429130 00425F30  80 9B 00 08 */	lwz r4, 8(r27)
/* 80429134 00425F34  80 6D 12 54 */	lwz r3, lbl_805DE334@sda21(r13)
/* 80429138 00425F38  54 00 10 3A */	slwi r0, r0, 2
/* 8042913C 00425F3C  7C 83 01 2E */	stwx r4, r3, r0
lbl_80429140:
/* 80429140 00425F40  80 7B 00 08 */	lwz r3, 8(r27)
/* 80429144 00425F44  28 03 00 00 */	cmplwi r3, 0
/* 80429148 00425F48  41 82 00 10 */	beq lbl_80429158
/* 8042914C 00425F4C  80 1B 00 0C */	lwz r0, 0xc(r27)
/* 80429150 00425F50  90 03 00 0C */	stw r0, 0xc(r3)
/* 80429154 00425F54  48 00 00 18 */	b lbl_8042916C
lbl_80429158:
/* 80429158 00425F58  88 1B 00 02 */	lbz r0, 2(r27)
/* 8042915C 00425F5C  80 9B 00 0C */	lwz r4, 0xc(r27)
/* 80429160 00425F60  80 6D 12 50 */	lwz r3, lbl_805DE330@sda21(r13)
/* 80429164 00425F64  54 00 10 3A */	slwi r0, r0, 2
/* 80429168 00425F68  7C 83 01 2E */	stwx r4, r3, r0
lbl_8042916C:
/* 8042916C 00425F6C  9B 9B 00 02 */	stb r28, 2(r27)
/* 80429170 00425F70  2C 1A 00 02 */	cmpwi r26, 2
/* 80429174 00425F74  9B BB 00 04 */	stb r29, 4(r27)
/* 80429178 00425F78  41 82 01 4C */	beq lbl_804292C4
/* 8042917C 00425F7C  40 80 00 14 */	bge lbl_80429190
/* 80429180 00425F80  2C 1A 00 00 */	cmpwi r26, 0
/* 80429184 00425F84  41 82 00 18 */	beq lbl_8042919C
/* 80429188 00425F88  40 80 00 9C */	bge lbl_80429224
/* 8042918C 00425F8C  48 00 01 F0 */	b lbl_8042937C
lbl_80429190:
/* 80429190 00425F90  2C 1A 00 04 */	cmpwi r26, 4
/* 80429194 00425F94  40 80 01 E8 */	bge lbl_8042937C
/* 80429198 00425F98  48 00 01 88 */	b lbl_80429320
lbl_8042919C:
/* 8042919C 00425F9C  88 BB 00 02 */	lbz r5, 2(r27)
/* 804291A0 00425FA0  80 6D 12 50 */	lwz r3, lbl_805DE330@sda21(r13)
/* 804291A4 00425FA4  54 A0 15 BA */	rlwinm r0, r5, 2, 0x16, 0x1d
/* 804291A8 00425FA8  7C 83 00 2E */	lwzx r4, r3, r0
/* 804291AC 00425FAC  48 00 00 08 */	b lbl_804291B4
lbl_804291B0:
/* 804291B0 00425FB0  80 84 00 0C */	lwz r4, 0xc(r4)
lbl_804291B4:
/* 804291B4 00425FB4  28 04 00 00 */	cmplwi r4, 0
/* 804291B8 00425FB8  41 82 00 14 */	beq lbl_804291CC
/* 804291BC 00425FBC  88 64 00 04 */	lbz r3, 4(r4)
/* 804291C0 00425FC0  88 1B 00 04 */	lbz r0, 4(r27)
/* 804291C4 00425FC4  7C 03 00 40 */	cmplw r3, r0
/* 804291C8 00425FC8  41 81 FF E8 */	bgt lbl_804291B0
lbl_804291CC:
/* 804291CC 00425FCC  28 04 00 00 */	cmplwi r4, 0
/* 804291D0 00425FD0  90 9B 00 0C */	stw r4, 0xc(r27)
/* 804291D4 00425FD4  41 82 00 14 */	beq lbl_804291E8
/* 804291D8 00425FD8  80 04 00 08 */	lwz r0, 8(r4)
/* 804291DC 00425FDC  90 1B 00 08 */	stw r0, 8(r27)
/* 804291E0 00425FE0  93 64 00 08 */	stw r27, 8(r4)
/* 804291E4 00425FE4  48 00 00 1C */	b lbl_80429200
lbl_804291E8:
/* 804291E8 00425FE8  80 6D 12 54 */	lwz r3, lbl_805DE334@sda21(r13)
/* 804291EC 00425FEC  54 A4 10 3A */	slwi r4, r5, 2
/* 804291F0 00425FF0  7C 03 20 2E */	lwzx r0, r3, r4
/* 804291F4 00425FF4  90 1B 00 08 */	stw r0, 8(r27)
/* 804291F8 00425FF8  80 6D 12 54 */	lwz r3, lbl_805DE334@sda21(r13)
/* 804291FC 00425FFC  7F 63 21 2E */	stwx r27, r3, r4
lbl_80429200:
/* 80429200 00426000  80 7B 00 08 */	lwz r3, 8(r27)
/* 80429204 00426004  28 03 00 00 */	cmplwi r3, 0
/* 80429208 00426008  41 82 00 0C */	beq lbl_80429214
/* 8042920C 0042600C  93 63 00 0C */	stw r27, 0xc(r3)
/* 80429210 00426010  48 00 01 6C */	b lbl_8042937C
lbl_80429214:
/* 80429214 00426014  80 6D 12 50 */	lwz r3, lbl_805DE330@sda21(r13)
/* 80429218 00426018  54 A0 10 3A */	slwi r0, r5, 2
/* 8042921C 0042601C  7F 63 01 2E */	stwx r27, r3, r0
/* 80429220 00426020  48 00 01 5C */	b lbl_8042937C
lbl_80429224:
/* 80429224 00426024  88 DB 00 02 */	lbz r6, 2(r27)
/* 80429228 00426028  80 6D 12 54 */	lwz r3, lbl_805DE334@sda21(r13)
/* 8042922C 0042602C  54 C5 15 BA */	rlwinm r5, r6, 2, 0x16, 0x1d
/* 80429230 00426030  7C 83 28 2E */	lwzx r4, r3, r5
/* 80429234 00426034  48 00 00 08 */	b lbl_8042923C
lbl_80429238:
/* 80429238 00426038  80 84 00 08 */	lwz r4, 8(r4)
lbl_8042923C:
/* 8042923C 0042603C  28 04 00 00 */	cmplwi r4, 0
/* 80429240 00426040  41 82 00 14 */	beq lbl_80429254
/* 80429244 00426044  88 64 00 04 */	lbz r3, 4(r4)
/* 80429248 00426048  88 1B 00 04 */	lbz r0, 4(r27)
/* 8042924C 0042604C  7C 03 00 40 */	cmplw r3, r0
/* 80429250 00426050  41 80 FF E8 */	blt lbl_80429238
lbl_80429254:
/* 80429254 00426054  28 04 00 00 */	cmplwi r4, 0
/* 80429258 00426058  41 82 00 0C */	beq lbl_80429264
/* 8042925C 0042605C  80 64 00 0C */	lwz r3, 0xc(r4)
/* 80429260 00426060  48 00 00 0C */	b lbl_8042926C
lbl_80429264:
/* 80429264 00426064  80 6D 12 50 */	lwz r3, lbl_805DE330@sda21(r13)
/* 80429268 00426068  7C 63 28 2E */	lwzx r3, r3, r5
lbl_8042926C:
/* 8042926C 0042606C  28 03 00 00 */	cmplwi r3, 0
/* 80429270 00426070  90 7B 00 0C */	stw r3, 0xc(r27)
/* 80429274 00426074  41 82 00 14 */	beq lbl_80429288
/* 80429278 00426078  80 03 00 08 */	lwz r0, 8(r3)
/* 8042927C 0042607C  90 1B 00 08 */	stw r0, 8(r27)
/* 80429280 00426080  93 63 00 08 */	stw r27, 8(r3)
/* 80429284 00426084  48 00 00 1C */	b lbl_804292A0
lbl_80429288:
/* 80429288 00426088  80 6D 12 54 */	lwz r3, lbl_805DE334@sda21(r13)
/* 8042928C 0042608C  54 C4 10 3A */	slwi r4, r6, 2
/* 80429290 00426090  7C 03 20 2E */	lwzx r0, r3, r4
/* 80429294 00426094  90 1B 00 08 */	stw r0, 8(r27)
/* 80429298 00426098  80 6D 12 54 */	lwz r3, lbl_805DE334@sda21(r13)
/* 8042929C 0042609C  7F 63 21 2E */	stwx r27, r3, r4
lbl_804292A0:
/* 804292A0 004260A0  80 7B 00 08 */	lwz r3, 8(r27)
/* 804292A4 004260A4  28 03 00 00 */	cmplwi r3, 0
/* 804292A8 004260A8  41 82 00 0C */	beq lbl_804292B4
/* 804292AC 004260AC  93 63 00 0C */	stw r27, 0xc(r3)
/* 804292B0 004260B0  48 00 00 CC */	b lbl_8042937C
lbl_804292B4:
/* 804292B4 004260B4  80 6D 12 50 */	lwz r3, lbl_805DE330@sda21(r13)
/* 804292B8 004260B8  54 C0 10 3A */	slwi r0, r6, 2
/* 804292BC 004260BC  7F 63 01 2E */	stwx r27, r3, r0
/* 804292C0 004260C0  48 00 00 BC */	b lbl_8042937C
lbl_804292C4:
/* 804292C4 004260C4  88 9B 00 02 */	lbz r4, 2(r27)
/* 804292C8 004260C8  28 1E 00 00 */	cmplwi r30, 0
/* 804292CC 004260CC  93 DB 00 0C */	stw r30, 0xc(r27)
/* 804292D0 004260D0  41 82 00 14 */	beq lbl_804292E4
/* 804292D4 004260D4  80 1E 00 08 */	lwz r0, 8(r30)
/* 804292D8 004260D8  90 1B 00 08 */	stw r0, 8(r27)
/* 804292DC 004260DC  93 7E 00 08 */	stw r27, 8(r30)
/* 804292E0 004260E0  48 00 00 1C */	b lbl_804292FC
lbl_804292E4:
/* 804292E4 004260E4  80 6D 12 54 */	lwz r3, lbl_805DE334@sda21(r13)
/* 804292E8 004260E8  54 85 10 3A */	slwi r5, r4, 2
/* 804292EC 004260EC  7C 03 28 2E */	lwzx r0, r3, r5
/* 804292F0 004260F0  90 1B 00 08 */	stw r0, 8(r27)
/* 804292F4 004260F4  80 6D 12 54 */	lwz r3, lbl_805DE334@sda21(r13)
/* 804292F8 004260F8  7F 63 29 2E */	stwx r27, r3, r5
lbl_804292FC:
/* 804292FC 004260FC  80 7B 00 08 */	lwz r3, 8(r27)
/* 80429300 00426100  28 03 00 00 */	cmplwi r3, 0
/* 80429304 00426104  41 82 00 0C */	beq lbl_80429310
/* 80429308 00426108  93 63 00 0C */	stw r27, 0xc(r3)
/* 8042930C 0042610C  48 00 00 70 */	b lbl_8042937C
lbl_80429310:
/* 80429310 00426110  80 6D 12 50 */	lwz r3, lbl_805DE330@sda21(r13)
/* 80429314 00426114  54 80 10 3A */	slwi r0, r4, 2
/* 80429318 00426118  7F 63 01 2E */	stwx r27, r3, r0
/* 8042931C 0042611C  48 00 00 60 */	b lbl_8042937C
lbl_80429320:
/* 80429320 00426120  80 7E 00 0C */	lwz r3, 0xc(r30)
/* 80429324 00426124  88 9B 00 02 */	lbz r4, 2(r27)
/* 80429328 00426128  28 03 00 00 */	cmplwi r3, 0
/* 8042932C 0042612C  90 7B 00 0C */	stw r3, 0xc(r27)
/* 80429330 00426130  41 82 00 14 */	beq lbl_80429344
/* 80429334 00426134  80 03 00 08 */	lwz r0, 8(r3)
/* 80429338 00426138  90 1B 00 08 */	stw r0, 8(r27)
/* 8042933C 0042613C  93 63 00 08 */	stw r27, 8(r3)
/* 80429340 00426140  48 00 00 1C */	b lbl_8042935C
lbl_80429344:
/* 80429344 00426144  80 6D 12 54 */	lwz r3, lbl_805DE334@sda21(r13)
/* 80429348 00426148  54 85 10 3A */	slwi r5, r4, 2
/* 8042934C 0042614C  7C 03 28 2E */	lwzx r0, r3, r5
/* 80429350 00426150  90 1B 00 08 */	stw r0, 8(r27)
/* 80429354 00426154  80 6D 12 54 */	lwz r3, lbl_805DE334@sda21(r13)
/* 80429358 00426158  7F 63 29 2E */	stwx r27, r3, r5
lbl_8042935C:
/* 8042935C 0042615C  80 7B 00 08 */	lwz r3, 8(r27)
/* 80429360 00426160  28 03 00 00 */	cmplwi r3, 0
/* 80429364 00426164  41 82 00 0C */	beq lbl_80429370
/* 80429368 00426168  93 63 00 0C */	stw r27, 0xc(r3)
/* 8042936C 0042616C  48 00 00 10 */	b lbl_8042937C
lbl_80429370:
/* 80429370 00426170  80 6D 12 50 */	lwz r3, lbl_805DE330@sda21(r13)
/* 80429374 00426174  54 80 10 3A */	slwi r0, r4, 2
/* 80429378 00426178  7F 63 01 2E */	stwx r27, r3, r0
lbl_8042937C:
/* 8042937C 0042617C  80 8D 12 64 */	lwz r4, lbl_805DE344@sda21(r13)
/* 80429380 00426180  38 60 00 02 */	li r3, 2
/* 80429384 00426184  2C 04 00 00 */	cmpwi r4, 0
/* 80429388 00426188  41 82 00 08 */	beq lbl_80429390
/* 8042938C 0042618C  38 64 FF FF */	addi r3, r4, -1
lbl_80429390:
/* 80429390 00426190  2C 03 00 00 */	cmpwi r3, 0
/* 80429394 00426194  3B 60 00 02 */	li r27, 2
/* 80429398 00426198  41 82 00 08 */	beq lbl_804293A0
/* 8042939C 0042619C  3B 63 FF FF */	addi r27, r3, -1
lbl_804293A0:
/* 804293A0 004261A0  7F FC FB 78 */	mr r28, r31
/* 804293A4 004261A4  54 7A 06 3E */	clrlwi r26, r3, 0x18
/* 804293A8 004261A8  48 00 00 2C */	b lbl_804293D4
lbl_804293AC:
/* 804293AC 004261AC  83 BC 00 00 */	lwz r29, 0(r28)
/* 804293B0 004261B0  7F 83 E3 78 */	mr r3, r28
/* 804293B4 004261B4  4B FF F2 D1 */	bl func_80428684
/* 804293B8 004261B8  88 7C 00 0D */	lbz r3, 0xd(r28)
/* 804293BC 004261BC  54 60 E7 BE */	rlwinm r0, r3, 0x1c, 0x1e, 0x1f
/* 804293C0 004261C0  7C 00 D8 00 */	cmpw r0, r27
/* 804293C4 004261C4  40 82 00 0C */	bne lbl_804293D0
/* 804293C8 004261C8  53 43 26 B6 */	rlwimi r3, r26, 4, 0x1a, 0x1b
/* 804293CC 004261CC  98 7C 00 0D */	stb r3, 0xd(r28)
lbl_804293D0:
/* 804293D0 004261D0  7F BC EB 78 */	mr r28, r29
lbl_804293D4:
/* 804293D4 004261D4  28 1C 00 00 */	cmplwi r28, 0
/* 804293D8 004261D8  40 82 FF D4 */	bne lbl_804293AC
lbl_804293DC:
/* 804293DC 004261DC  39 61 00 30 */	addi r11, r1, 0x30
/* 804293E0 004261E0  4B F8 47 B9 */	bl _restgpr_25
/* 804293E4 004261E4  80 01 00 34 */	lwz r0, 0x34(r1)
/* 804293E8 004261E8  7C 08 03 A6 */	mtlr r0
/* 804293EC 004261EC  38 21 00 30 */	addi r1, r1, 0x30
/* 804293F0 004261F0  4E 80 00 20 */	blr 


.section .data
    .balign 8
.global lbl_80504DD8
lbl_80504DD8:
    .asciz "gobjplink.c"
    .balign 4
.global lbl_80504DE4
lbl_80504DE4:
    .asciz "p_link <= HSD_GObjLibInitData.p_link_max"