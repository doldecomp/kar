.include "macros.inc"

.section .text

.global HSD_HashSearch
HSD_HashSearch:
/* 804216C0 0041E4C0  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 804216C4 0041E4C4  7C 08 02 A6 */	mflr r0
/* 804216C8 0041E4C8  90 01 00 24 */	stw r0, 0x24(r1)
/* 804216CC 0041E4CC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 804216D0 0041E4D0  93 C1 00 18 */	stw r30, 0x18(r1)
/* 804216D4 0041E4D4  7C BE 2B 78 */	mr r30, r5
/* 804216D8 0041E4D8  93 A1 00 14 */	stw r29, 0x14(r1)
/* 804216DC 0041E4DC  7C 9D 23 78 */	mr r29, r4
/* 804216E0 0041E4E0  93 81 00 10 */	stw r28, 0x10(r1)
/* 804216E4 0041E4E4  7C 7C 1B 78 */	mr r28, r3
/* 804216E8 0041E4E8  80 C3 00 00 */	lwz r6, 0(r3)
/* 804216EC 0041E4EC  81 86 00 3C */	lwz r12, 0x3c(r6)
/* 804216F0 0041E4F0  7D 89 03 A6 */	mtctr r12
/* 804216F4 0041E4F4  4E 80 04 21 */	bctrl 
/* 804216F8 0041E4F8  80 1C 00 08 */	lwz r0, 8(r28)
/* 804216FC 0041E4FC  7C 7F 1B 78 */	mr r31, r3
/* 80421700 0041E500  7C 1F 00 40 */	cmplw r31, r0
/* 80421704 0041E504  41 80 00 18 */	blt lbl_8042171C
/* 80421708 0041E508  3C 80 80 50 */	lis r4, lbl_80504938@ha
/* 8042170C 0041E50C  38 6D FC 88 */	addi r3, r13, lbl_805DCD68@sda21
/* 80421710 0041E510  38 A4 49 38 */	addi r5, r4, lbl_80504938@l
/* 80421714 0041E514  38 80 00 71 */	li r4, 0x71
/* 80421718 0041E518  48 00 6D A1 */	bl __assert
lbl_8042171C:
/* 8042171C 0041E51C  80 7C 00 04 */	lwz r3, 4(r28)
/* 80421720 0041E520  57 E0 10 3A */	slwi r0, r31, 2
/* 80421724 0041E524  7F E3 00 2E */	lwzx r31, r3, r0
/* 80421728 0041E528  28 1F 00 00 */	cmplwi r31, 0
/* 8042172C 0041E52C  40 82 00 3C */	bne lbl_80421768
/* 80421730 0041E530  3B E0 00 00 */	li r31, 0
/* 80421734 0041E534  48 00 00 40 */	b lbl_80421774
/* 80421738 0041E538  48 00 00 30 */	b lbl_80421768
lbl_8042173C:
/* 8042173C 0041E53C  80 DC 00 00 */	lwz r6, 0(r28)
/* 80421740 0041E540  7F 83 E3 78 */	mr r3, r28
/* 80421744 0041E544  7F A5 EB 78 */	mr r5, r29
/* 80421748 0041E548  80 9F 00 04 */	lwz r4, 4(r31)
/* 8042174C 0041E54C  81 86 00 40 */	lwz r12, 0x40(r6)
/* 80421750 0041E550  7D 89 03 A6 */	mtctr r12
/* 80421754 0041E554  4E 80 04 21 */	bctrl 
/* 80421758 0041E558  2C 03 00 00 */	cmpwi r3, 0
/* 8042175C 0041E55C  40 82 00 08 */	bne lbl_80421764
/* 80421760 0041E560  48 00 00 14 */	b lbl_80421774
lbl_80421764:
/* 80421764 0041E564  83 FF 00 00 */	lwz r31, 0(r31)
lbl_80421768:
/* 80421768 0041E568  28 1F 00 00 */	cmplwi r31, 0
/* 8042176C 0041E56C  40 82 FF D0 */	bne lbl_8042173C
/* 80421770 0041E570  3B E0 00 00 */	li r31, 0
lbl_80421774:
/* 80421774 0041E574  28 1E 00 00 */	cmplwi r30, 0
/* 80421778 0041E578  41 82 00 14 */	beq lbl_8042178C
/* 8042177C 0041E57C  7C 1F 00 D0 */	neg r0, r31
/* 80421780 0041E580  7C 00 FB 78 */	or r0, r0, r31
/* 80421784 0041E584  54 00 0F FE */	srwi r0, r0, 0x1f
/* 80421788 0041E588  90 1E 00 00 */	stw r0, 0(r30)
lbl_8042178C:
/* 8042178C 0041E58C  28 1F 00 00 */	cmplwi r31, 0
/* 80421790 0041E590  41 82 00 0C */	beq lbl_8042179C
/* 80421794 0041E594  80 7F 00 08 */	lwz r3, 8(r31)
/* 80421798 0041E598  48 00 00 08 */	b lbl_804217A0
lbl_8042179C:
/* 8042179C 0041E59C  38 60 00 00 */	li r3, 0
lbl_804217A0:
/* 804217A0 0041E5A0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 804217A4 0041E5A4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 804217A8 0041E5A8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 804217AC 0041E5AC  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 804217B0 0041E5B0  83 81 00 10 */	lwz r28, 0x10(r1)
/* 804217B4 0041E5B4  7C 08 03 A6 */	mtlr r0
/* 804217B8 0041E5B8  38 21 00 20 */	addi r1, r1, 0x20
/* 804217BC 0041E5BC  4E 80 00 20 */	blr 


.section .data
    .balign 8
.global lbl_80504938
lbl_80504938:
	.4byte 0x69647820
	.4byte 0x3C206861
	.4byte 0x73682D3E
	.4byte 0x7461626C
	.4byte 0x655F7369
	.4byte 0x7A650000


.section .sdata
    .balign 8
.global lbl_805DCD68
lbl_805DCD68:
	.4byte 0x68617368
	.4byte 0x2E630000
.global lbl_805DCD70
lbl_805DCD70:
	.4byte 0x74657870
	.4byte 0x2E630000
.global lbl_805DCD78
lbl_805DCD78:
	.4byte 0x74657870
	.4byte 0x00000000
.global lbl_805DCD80
lbl_805DCD80:
	.4byte 0x30000000
.global lbl_805DCD84
lbl_805DCD84:
	.4byte 0x64657363
	.4byte 0x00000000
.global lbl_805DCD8C
lbl_805DCD8C:
	.4byte 0x74657664
	.4byte 0x65736300
	.4byte 0x00000000
.global lbl_805DCD98
lbl_805DCD98:
	.4byte 0x6C203C20
	.4byte 0x6E756D00
.global lbl_805DCDA0
lbl_805DCDA0:
	.4byte 0x0007FF00
.global lbl_805DCDA4
lbl_805DCDA4:
	.4byte 0x00000000
.global lbl_805DCDA8
lbl_805DCDA8:
	.4byte 0x00000000
	.4byte 0x00000000
.global lbl_805DCDB0
lbl_805DCDB0:
	.4byte 0x6770726F
	.4byte 0x63000000
.global lbl_805DCDB8
lbl_805DCDB8:
	.4byte 0x6A6F626A
	.4byte 0x2E680000
.global lbl_805DCDC0
lbl_805DCDC0:
	.4byte 0x6A6F626A
	.4byte 0x00000000
.global lbl_805DCDC8
lbl_805DCDC8:
	.4byte 0x6C617374
	.4byte 0x50500000
.global lbl_805DCDD0
lbl_805DCDD0:
	.4byte 0x01000000
.global lbl_805DCDD4
lbl_805DCDD4:
	.4byte 0x6A6F626A
	.4byte 0x2E680000
.global lbl_805DCDDC
lbl_805DCDDC:
	.4byte 0x6A6F626A
	.4byte 0x00000000
	.4byte 0x00000000
.global lbl_805DCDE8
lbl_805DCDE8:
	.4byte 0x7B000000
.global lbl_805DCDEC
lbl_805DCDEC:
	.4byte 0x30000000
.global lbl_805DCDF0
lbl_805DCDF0:
	.4byte 0x41400000
.global lbl_805DCDF4
lbl_805DCDF4:
	.4byte 0x41400000
.global lbl_805DCDF8
lbl_805DCDF8:
	.4byte 0x0C000000
	.4byte 0x00000000
.global lbl_805DCE00
lbl_805DCE00:
	.4byte 0x40404000
	.4byte 0x00000000
.global lbl_805DCE08
lbl_805DCE08:
	.4byte 0x00000004
.global lbl_805DCE0C
lbl_805DCE0C:
	.4byte 0x00000001
.global lbl_805DCE10
lbl_805DCE10:
	.4byte 0xFFFFFFFF
.global lbl_805DCE14
lbl_805DCE14:
	.4byte 0xFF0000FF
.global lbl_805DCE18
lbl_805DCE18:
	.4byte 0x00FF00FF
.global lbl_805DCE1C
lbl_805DCE1C:
	.4byte 0x00FFFFFF
.global lbl_805DCE20
lbl_805DCE20:
	.4byte 0x008080FF
.global lbl_805DCE24
lbl_805DCE24:
	.4byte 0xC0C000FF
.global lbl_805DCE28
lbl_805DCE28:
	.4byte 0x43545200
.global lbl_805DCE2C
lbl_805DCE2C:
	.4byte 0x44414252
	.4byte 0x00000000
.global lbl_805DCE34
lbl_805DCE34:
	.4byte 0x44415200
.global lbl_805DCE38
lbl_805DCE38:
	.4byte 0x44424154
	.4byte 0x304C0000
.global lbl_805DCE40
lbl_805DCE40:
	.4byte 0x44424154
	.4byte 0x30550000
.global lbl_805DCE48
lbl_805DCE48:
	.4byte 0x44424154
	.4byte 0x314C0000
.global lbl_805DCE50
lbl_805DCE50:
	.4byte 0x44424154
	.4byte 0x31550000
.global lbl_805DCE58
lbl_805DCE58:
	.4byte 0x44424154
	.4byte 0x324C0000
.global lbl_805DCE60
lbl_805DCE60:
	.4byte 0x44424154
	.4byte 0x32550000
.global lbl_805DCE68
lbl_805DCE68:
	.4byte 0x44424154
	.4byte 0x334C0000
.global lbl_805DCE70
lbl_805DCE70:
	.4byte 0x44424154
	.4byte 0x33550000
.global lbl_805DCE78
lbl_805DCE78:
	.4byte 0x44454300
.global lbl_805DCE7C
lbl_805DCE7C:
	.4byte 0x44534953
	.4byte 0x52000000
.global lbl_805DCE84
lbl_805DCE84:
	.4byte 0x45415200
.global lbl_805DCE88
lbl_805DCE88:
	.4byte 0x49424154
	.4byte 0x304C0000
.global lbl_805DCE90
lbl_805DCE90:
	.4byte 0x49424154
	.4byte 0x30550000
.global lbl_805DCE98
lbl_805DCE98:
	.4byte 0x49424154
	.4byte 0x314C0000
.global lbl_805DCEA0
lbl_805DCEA0:
	.4byte 0x49424154
	.4byte 0x31550000
.global lbl_805DCEA8
lbl_805DCEA8:
	.4byte 0x49424154
	.4byte 0x324C0000
.global lbl_805DCEB0
lbl_805DCEB0:
	.4byte 0x49424154
	.4byte 0x32550000
.global lbl_805DCEB8
lbl_805DCEB8:
	.4byte 0x49424154
	.4byte 0x334C0000
.global lbl_805DCEC0
lbl_805DCEC0:
	.4byte 0x49424154
	.4byte 0x33550000
.global lbl_805DCEC8
lbl_805DCEC8:
	.4byte 0x4C520000
.global lbl_805DCECC
lbl_805DCECC:
	.4byte 0x50565200
.global lbl_805DCED0
lbl_805DCED0:
	.4byte 0x53444100
.global lbl_805DCED4
lbl_805DCED4:
	.4byte 0x53445231
	.4byte 0x00000000
.global lbl_805DCEDC
lbl_805DCEDC:
	.4byte 0x53505247
	.4byte 0x30000000
.global lbl_805DCEE4
lbl_805DCEE4:
	.4byte 0x53505247
	.4byte 0x31000000
.global lbl_805DCEEC
lbl_805DCEEC:
	.4byte 0x53505247
	.4byte 0x32000000
.global lbl_805DCEF4
lbl_805DCEF4:
	.4byte 0x53505247
	.4byte 0x33000000
.global lbl_805DCEFC
lbl_805DCEFC:
	.4byte 0x53525230
	.4byte 0x00000000
.global lbl_805DCF04
lbl_805DCF04:
	.4byte 0x53525231
	.4byte 0x00000000
.global lbl_805DCF0C
lbl_805DCF0C:
	.4byte 0x55534441
	.4byte 0x00000000
.global lbl_805DCF14
lbl_805DCF14:
	.4byte 0x58455200
.global lbl_805DCF18
lbl_805DCF18:
	.4byte 0x3F000000
.global lbl_805DCF1C
lbl_805DCF1C:
	.4byte 0x444D415F
	.4byte 0x4C000000
.global lbl_805DCF24
lbl_805DCF24:
	.4byte 0x444D415F
	.4byte 0x55000000
.global lbl_805DCF2C
lbl_805DCF2C:
	.4byte 0x47515230
	.4byte 0x00000000
.global lbl_805DCF34
lbl_805DCF34:
	.4byte 0x47515231
	.4byte 0x00000000
.global lbl_805DCF3C
lbl_805DCF3C:
	.4byte 0x47515232
	.4byte 0x00000000
.global lbl_805DCF44
lbl_805DCF44:
	.4byte 0x47515233
	.4byte 0x00000000
.global lbl_805DCF4C
lbl_805DCF4C:
	.4byte 0x47515234
	.4byte 0x00000000
.global lbl_805DCF54
lbl_805DCF54:
	.4byte 0x47515235
	.4byte 0x00000000
.global lbl_805DCF5C
lbl_805DCF5C:
	.4byte 0x47515236
	.4byte 0x00000000
.global lbl_805DCF64
lbl_805DCF64:
	.4byte 0x47515237
	.4byte 0x00000000
.global lbl_805DCF6C
lbl_805DCF6C:
	.4byte 0x48494430
	.4byte 0x00000000
.global lbl_805DCF74
lbl_805DCF74:
	.4byte 0x48494431
	.4byte 0x00000000
.global lbl_805DCF7C
lbl_805DCF7C:
	.4byte 0x48494432
	.4byte 0x00000000
.global lbl_805DCF84
lbl_805DCF84:
	.4byte 0x49414252
	.4byte 0x00000000
.global lbl_805DCF8C
lbl_805DCF8C:
	.4byte 0x49435443
	.4byte 0x00000000
.global lbl_805DCF94
lbl_805DCF94:
	.4byte 0x4C324352
	.4byte 0x00000000
.global lbl_805DCF9C
lbl_805DCF9C:
	.4byte 0x4D4D4352
	.4byte 0x30000000
.global lbl_805DCFA4
lbl_805DCFA4:
	.4byte 0x4D4D4352
	.4byte 0x31000000
.global lbl_805DCFAC
lbl_805DCFAC:
	.4byte 0x504D4331
	.4byte 0x00000000
.global lbl_805DCFB4
lbl_805DCFB4:
	.4byte 0x504D4332
	.4byte 0x00000000
.global lbl_805DCFBC
lbl_805DCFBC:
	.4byte 0x504D4333
	.4byte 0x00000000
.global lbl_805DCFC4
lbl_805DCFC4:
	.4byte 0x504D4334
	.4byte 0x00000000
.global lbl_805DCFCC
lbl_805DCFCC:
	.4byte 0x53494100
.global lbl_805DCFD0
lbl_805DCFD0:
	.4byte 0x5448524D
	.4byte 0x31000000
.global lbl_805DCFD8
lbl_805DCFD8:
	.4byte 0x5448524D
	.4byte 0x32000000
.global lbl_805DCFE0
lbl_805DCFE0:
	.4byte 0x5448524D
	.4byte 0x33000000
.global lbl_805DCFE8
lbl_805DCFE8:
	.4byte 0x554D4D43
	.4byte 0x52300000
.global lbl_805DCFF0
lbl_805DCFF0:
	.4byte 0x554D4D43
	.4byte 0x52310000
.global lbl_805DCFF8
lbl_805DCFF8:
	.4byte 0x55504D43
	.4byte 0x31000000
.global lbl_805DD000
lbl_805DD000:
	.4byte 0x55504D43
	.4byte 0x32000000
.global lbl_805DD008
lbl_805DD008:
	.4byte 0x55504D43
	.4byte 0x33000000
.global lbl_805DD010
lbl_805DD010:
	.4byte 0x55504D43
	.4byte 0x34000000
.global lbl_805DD018
lbl_805DD018:
	.4byte 0x55534941
	.4byte 0x00000000
.global lbl_805DD020
lbl_805DD020:
	.4byte 0x57504152
	.4byte 0x00000000
.global lbl_805DD028
lbl_805DD028:
	.4byte 0x20534E41
	.4byte 0x4E000000
.global lbl_805DD030
lbl_805DD030:
	.4byte 0x20495349
	.4byte 0x00000000
.global lbl_805DD038
lbl_805DD038:
	.4byte 0x20494449
	.4byte 0x00000000
.global lbl_805DD040
lbl_805DD040:
	.4byte 0x205A445A
	.4byte 0x00000000
.global lbl_805DD048
lbl_805DD048:
	.4byte 0x20494D5A
	.4byte 0x00000000
.global lbl_805DD050
lbl_805DD050:
	.4byte 0x20564300
.global lbl_805DD054
lbl_805DD054:
	.4byte 0x20534F46
	.4byte 0x54000000
.global lbl_805DD05C
lbl_805DD05C:
	.4byte 0x20535152
	.4byte 0x54000000
.global lbl_805DD064
lbl_805DD064:
	.4byte 0x20435649
	.4byte 0x00000000
.global lbl_805DD06C
lbl_805DD06C:
	.4byte 0x20290000
.global lbl_805DD070
lbl_805DD070:
	.4byte 0x0A000000
.global lbl_805DD074
lbl_805DD074:
	.4byte 0x28445349
	.4byte 0x290A0000
.global lbl_805DD07C
lbl_805DD07C:
	.4byte 0x28495349
	.4byte 0x290A0000
.global lbl_805DD084
lbl_805DD084:
	.4byte 0x61726F75
	.4byte 0x6E640000
.global lbl_805DD08C
lbl_805DD08C:
	.4byte 0x61740000
.global lbl_805DD090
lbl_805DD090:
	.4byte 0x28465045
	.4byte 0x290A0000
.global lbl_805DD098
lbl_805DD098:
	.4byte lbl_80508434
.global lbl_805DD09C
lbl_805DD09C:
	.4byte lbl_80508464
.global lbl_805DD0A0
lbl_805DD0A0:
	.4byte lbl_80508480
.global lbl_805DD0A4
lbl_805DD0A4:
	.4byte 0x5B253038
	.4byte 0x58000000
.global lbl_805DD0AC
lbl_805DD0AC:
	.4byte 0x3A000000
.global lbl_805DD0B0
lbl_805DD0B0:
	.4byte 0x25303258
	.4byte 0x00000000
.global lbl_805DD0B8
lbl_805DD0B8:
	.4byte 0x5D0A0000
.global lbl_805DD0BC
lbl_805DD0BC:
	.4byte lbl_805085C0
.global lbl_805DD0C0
lbl_805DD0C0:
	.4byte lbl_805085E0
.global lbl_805DD0C4
lbl_805DD0C4:
	.4byte lbl_8050874C
.global lbl_805DD0C8
lbl_805DD0C8:
	.4byte lbl_80508770
.global lbl_805DD0CC
lbl_805DD0CC:
	.4byte lbl_80508794
.global lbl_805DD0D0
lbl_805DD0D0:
	.4byte lbl_805087BC
.global lbl_805DD0D4
lbl_805DD0D4:
	.4byte lbl_805087D8
.global lbl_805DD0D8
lbl_805DD0D8:
	.4byte 0x4E2F4100
.global lbl_805DD0DC
lbl_805DD0DC:
	.4byte 0x522F5700
.global lbl_805DD0E0
lbl_805DD0E0:
	.4byte 0x522F4F00
.global lbl_805DD0E4
lbl_805DD0E4:
	.4byte lbl_805087FC
.global lbl_805DD0E8
lbl_805DD0E8:
	.4byte lbl_80508814
.global lbl_805DD0EC
lbl_805DD0EC:
	.4byte lbl_8050882C
.global lbl_805DD0F0
lbl_805DD0F0:
	.4byte lbl_8050883C
.global lbl_805DD0F4
lbl_805DD0F4:
	.4byte lbl_80508854
.global lbl_805DD0F8
lbl_805DD0F8:
	.4byte lbl_8050886C
.global lbl_805DD0FC
lbl_805DD0FC:
	.4byte 0x20202020
	.4byte 0x20000000
.global lbl_805DD104
lbl_805DD104:
	.4byte 0x20202020
	.4byte 0x00000000
.global lbl_805DD10C
lbl_805DD10C:
	.4byte 0x20202000
.global lbl_805DD110
lbl_805DD110:
	.4byte 0x20200000
.global lbl_805DD114
lbl_805DD114:
	.4byte 0x20000000
.global lbl_805DD118
lbl_805DD118:
	.4byte 0x00000000
	.4byte 0x00000000
.global lbl_805DD120
lbl_805DD120:
	.4byte 0x00000002
.global lbl_805DD124
lbl_805DD124:
	.4byte 0x0000001E
.global lbl_805DD128
lbl_805DD128:
	.4byte 0x00000078
.global lbl_805DD12C
lbl_805DD12C:
	.4byte 0x000000F0
.global lbl_805DD130
lbl_805DD130:
	.4byte 0x0000014A
.global lbl_805DD134
lbl_805DD134:
	.4byte 0x30000000
.global lbl_805DD138
lbl_805DD138:
	.4byte 0x70696420
	.4byte 0x3E203000
.global lbl_805DD140
lbl_805DD140:
	.4byte 0x00000001
	.4byte 0x00000000
.global lbl_805DD148
lbl_805DD148:
	.4byte 0x00000004
.global lbl_805DD14C
lbl_805DD14C:
	.4byte 0x30000000
.global lbl_805DD150
lbl_805DD150:
	.4byte 0x64630000
	.4byte 0x00000000
.global lbl_805DD158
lbl_805DD158:
	.4byte 0x00000000
	.4byte 0x00000000
.global lbl_805DD160
lbl_805DD160:
	.4byte 0x73796E74
	.4byte 0x682E6300
.global lbl_805DD168
lbl_805DD168:
	.4byte 0x70000000
.global lbl_805DD16C
lbl_805DD16C:
	.4byte 0x00000000
	.4byte 0x00000000
.global lbl_805DD174
lbl_805DD174:
	.4byte 0x30000000
.global lbl_805DD178
lbl_805DD178:
	.4byte 0xFC780000
.global lbl_805DD17C
lbl_805DD17C:
	.4byte 0xFFFFFFFF
.global lbl_805DD180
lbl_805DD180:
	.4byte 0x626D6200
.global lbl_805DD184
lbl_805DD184:
	.4byte 0x626D626E
	.4byte 0x65787400
.global lbl_805DD18C
lbl_805DD18C:
	.4byte 0x00000000
	.4byte 0x00000000
.global lbl_805DD194
lbl_805DD194:
	.4byte 0x3F800000
.global lbl_805DD198
lbl_805DD198:
	.4byte 0x656E7472
	.4byte 0x79000000
.global lbl_805DD1A0
lbl_805DD1A0:
	.4byte func_8044ECFC
	.4byte 0x00000000
.global lbl_805DD1A8
lbl_805DD1A8:
	.4byte 0x00000000
	.4byte 0x00000000
.global lbl_805DD1B0
lbl_805DD1B0:
	.4byte 0x00000000
	.4byte 0x00000000
.global lbl_805DD1B8
lbl_805DD1B8:
	.4byte 0x00000000
	.4byte 0x00000000
.global lbl_805DD1C0
lbl_805DD1C0:
	.4byte 0x25730000
	.4byte 0x00000000
.global lbl_805DD1C8
lbl_805DD1C8:
	.4byte func_8045D664
.global lbl_805DD1CC
lbl_805DD1CC:
	.4byte cPlayer_PostPhysicsUpdate
.global lbl_805DD1D0
lbl_805DD1D0:
	.4byte 0x6E657700
.global lbl_805DD1D4
lbl_805DD1D4:
	.4byte 0x72657300
.global lbl_805DD1D8
lbl_805DD1D8:
	.4byte lbl_80533FD0
.global lbl_805DD1DC
lbl_805DD1DC:
	.4byte 0xFFFFFFFF
	.2byte 0xFFFF
.global lbl_805DD1E2
lbl_805DD1E2:
	.2byte 0xD107
.global lbl_805DD1E4
lbl_805DD1E4:
	.4byte 0x4E000000
.global lbl_805DD1E8
lbl_805DD1E8:
	.4byte 0x00000001
	.4byte 0x00000000
.global lbl_805DD1F0
lbl_805DD1F0:
	.4byte 0x00010000
	.4byte 0x00000000
.global lbl_805DD1F8
lbl_805DD1F8:
	.4byte 0xFFFFFFFF
	.4byte 0xFFFF0000
.global lbl_805DD200
lbl_805DD200:
	.4byte 0x04000000
	.4byte 0x00000000
.global lbl_805DD208
lbl_805DD208:
	.4byte lbl_805340C0
.global lbl_805DD20C
lbl_805DD20C:
	.4byte 0x08000806
	.4byte 0x88638864
.global lbl_805DD214
lbl_805DD214:
	.4byte 0xFFFFFFFF
	.4byte 0xFFFF0000
.global lbl_805DD21C
lbl_805DD21C:
	.4byte 0x00000001
.global lbl_805DD220
lbl_805DD220:
	.4byte 0x00000F00
	.4byte 0x00000000
.global lbl_805DD228
lbl_805DD228:
	.4byte 0x04000000
	.4byte 0x00000000
.global lbl_805DD230
lbl_805DD230:
	.4byte 0x63825363
	.4byte 0x00000000
.global lbl_805DD238
lbl_805DD238:
	.4byte 0x25322E32
	.4byte 0x78000000
.global lbl_805DD240
lbl_805DD240:
	.4byte 0x48545450
	.4byte 0x00000000
.global lbl_805DD248
lbl_805DD248:
	.4byte 0x53495000
.global lbl_805DD24C
lbl_805DD24C:
	.4byte 0x0D0A0D0A
	.4byte 0x00000000
.global lbl_805DD254
lbl_805DD254:
	.4byte 0x20000000
.global lbl_805DD258
lbl_805DD258:
	.4byte 0x203E0000
.global lbl_805DD25C
lbl_805DD25C:
	.4byte 0x203B0000
.global lbl_805DD260
lbl_805DD260:
	.4byte 0x203B090D
	.4byte 0x0A000000
.global lbl_805DD268
lbl_805DD268:
	.4byte 0x0D0A0000
	.4byte 0x00000000
.global lbl_805DD270
lbl_805DD270:
	.4byte 0x4E4F5449
	.4byte 0x46590000
.global lbl_805DD278
lbl_805DD278:
	.4byte 0x2A000000
.global lbl_805DD27C
lbl_805DD27C:
	.4byte 0x484F5354
	.4byte 0x00000000
.global lbl_805DD284
lbl_805DD284:
	.4byte 0x4E540000
.global lbl_805DD288
lbl_805DD288:
	.4byte 0x4E545300
.global lbl_805DD28C
lbl_805DD28C:
	.4byte 0x53455256
	.4byte 0x45520000
.global lbl_805DD294
lbl_805DD294:
	.4byte 0x55534E00
.global lbl_805DD298
lbl_805DD298:
	.4byte 0x4F4B0000
.global lbl_805DD29C
lbl_805DD29C:
	.4byte 0x45585400
.global lbl_805DD2A0
lbl_805DD2A0:
	.4byte 0x00000000
.global lbl_805DD2A4
lbl_805DD2A4:
	.4byte 0x53540000
.global lbl_805DD2A8
lbl_805DD2A8:
	.4byte 0x4D414E00
.global lbl_805DD2AC
lbl_805DD2AC:
	.4byte 0x4D580000
.global lbl_805DD2B0
lbl_805DD2B0:
	.4byte 0x0D0A0D0A
	.4byte 0x00000000
.global lbl_805DD2B8
lbl_805DD2B8:
	.4byte 0x31300000
.global lbl_805DD2BC
lbl_805DD2BC:
	.4byte 0x6D61782D
	.4byte 0x61676500
	.4byte 0x00000000
.global lbl_805DD2C8
lbl_805DD2C8:
	.4byte 0x25327800
	.4byte 0x00000000
.global lbl_805DD2D0
lbl_805DD2D0:
	.4byte 0x2F000000
.global lbl_805DD2D4
lbl_805DD2D4:
	.4byte 0x47455400
.global lbl_805DD2D8
lbl_805DD2D8:
	.4byte 0x50555400
.global lbl_805DD2DC
lbl_805DD2DC:
	.4byte 0x504F5354
	.4byte 0x00000000
.global lbl_805DD2E4
lbl_805DD2E4:
	.4byte 0x48454144
	.4byte 0x00000000
.global lbl_805DD2EC
lbl_805DD2EC:
	.4byte 0x54524143
	.4byte 0x45000000
.global lbl_805DD2F4
lbl_805DD2F4:
	.4byte 0x44454C45
	.4byte 0x54450000
.global lbl_805DD2FC
lbl_805DD2FC:
	.4byte 0x434F4E4E
	.4byte 0x45435400
.global lbl_805DD304
lbl_805DD304:
	.4byte 0x4F505449
	.4byte 0x4F4E5300
.global lbl_805DD30C
lbl_805DD30C:
	.4byte 0x43414200
.global lbl_805DD310
lbl_805DD310:
	.4byte 0x43420000
	.4byte 0x00000000
.global lbl_805DD318       
lbl_805DD318:              
	.4byte lbl_80534D40
	.4byte lbl_80534D4C
.global lbl_805DD320       
lbl_805DD320:              
	.4byte 0x4F4B0000
.global lbl_805DD324       
lbl_805DD324:              
	.4byte 0x43726561
	.4byte 0x74656400
.global lbl_805DD32C       
lbl_805DD32C:              
	.4byte 0x466F756E
	.4byte 0x64000000
.global lbl_805DD334       
lbl_805DD334:              
	.4byte 0x00000000
.global lbl_805DD338       
lbl_805DD338:              
	.4byte 0x476F6E65
	.4byte 0x00000000
.global lbl_805DD340       
lbl_805DD340:              
	.4byte 0x61696600
.global lbl_805DD344       
lbl_805DD344:              
	.4byte 0x61756469
	.4byte 0x6F000000
.global lbl_805DD34C       
lbl_805DD34C:              
	.4byte 0x61696666
	.4byte 0x00000000
.global lbl_805DD354       
lbl_805DD354:              
	.4byte 0x61696663
	.4byte 0x00000000
.global lbl_805DD35C       
lbl_805DD35C:              
	.4byte 0x61736600
.global lbl_805DD360       
lbl_805DD360:              
	.4byte 0x76696465
	.4byte 0x6F000000
.global lbl_805DD368       
lbl_805DD368:              
	.4byte 0x61737800
.global lbl_805DD36C       
lbl_805DD36C:              
	.4byte 0x61750000
.global lbl_805DD370       
lbl_805DD370:              
	.4byte 0x62617369
	.4byte 0x63000000
.global lbl_805DD378       
lbl_805DD378:              
	.4byte 0x61766900
.global lbl_805DD37C       
lbl_805DD37C:              
	.4byte 0x6D737669
	.4byte 0x64656F00
.global lbl_805DD384       
lbl_805DD384:              
	.4byte 0x626D7000
.global lbl_805DD388       
lbl_805DD388:              
	.4byte 0x696D6167
	.4byte 0x65000000
.global lbl_805DD390       
lbl_805DD390:              
	.4byte 0x64637200
.global lbl_805DD394       
lbl_805DD394:              
	.4byte 0x64696200
.global lbl_805DD398       
lbl_805DD398:              
	.4byte 0x64697200
.global lbl_805DD39C       
lbl_805DD39C:              
	.4byte 0x64787200
.global lbl_805DD3A0               
lbl_805DD3A0:                      
	.4byte 0x67696600
.global lbl_805DD3A4       
lbl_805DD3A4:              
	.4byte 0x68746100
.global lbl_805DD3A8       
lbl_805DD3A8:              
	.4byte 0x74657874
	.4byte 0x00000000
.global lbl_805DD3B0               
lbl_805DD3B0:                      
	.4byte 0x68746D00
.global lbl_805DD3B4               
lbl_805DD3B4:                      
	.4byte 0x68746D6C
	.4byte 0x00000000
.global lbl_805DD3BC               
lbl_805DD3BC:                      
	.4byte 0x6A617200
.global lbl_805DD3C0               
lbl_805DD3C0:                      
	.4byte 0x6A666966
	.4byte 0x00000000
.global lbl_805DD3C8               
lbl_805DD3C8:                      
	.4byte 0x706A7065
	.4byte 0x67000000
.global lbl_805DD3D0               
lbl_805DD3D0:                      
	.4byte 0x6A706500
.global lbl_805DD3D4               
lbl_805DD3D4:                      
	.4byte 0x6A706567
	.4byte 0x00000000
.global lbl_805DD3DC               
lbl_805DD3DC:                      
	.4byte 0x6A706700
.global lbl_805DD3E0               
lbl_805DD3E0:                      
	.4byte 0x6A730000
.global lbl_805DD3E4       
lbl_805DD3E4:              
	.4byte 0x6B617200
.global lbl_805DD3E8               
lbl_805DD3E8:                      
	.4byte 0x6D696469
	.4byte 0x00000000
.global lbl_805DD3F0               
lbl_805DD3F0:                      
	.4byte 0x6D337500
.global lbl_805DD3F4               
lbl_805DD3F4:                      
	.4byte 0x6D706567
	.4byte 0x75726C00
.global lbl_805DD3FC       
lbl_805DD3FC:              
	.4byte 0x6D696400
.global lbl_805DD400               
lbl_805DD400:                      
	.4byte 0x6D6F7600
.global lbl_805DD404               
lbl_805DD404:                      
	.4byte 0x6D703276
	.4byte 0x00000000
.global lbl_805DD40C               
lbl_805DD40C:                      
	.4byte 0x782D6D70
	.4byte 0x65673200
.global lbl_805DD414              
lbl_805DD414:                      
	.4byte 0x6D703300
.global lbl_805DD418               
lbl_805DD418:                      
	.4byte 0x6D706567
	.4byte 0x00000000
.global lbl_805DD420               
lbl_805DD420:                      
	.4byte 0x6D706500
.global lbl_805DD424               
lbl_805DD424:                      
	.4byte 0x6D706700
.global lbl_805DD428               
lbl_805DD428:                      
	.4byte 0x6D707600
.global lbl_805DD42C               
lbl_805DD42C:                      
	.4byte 0x6D707632
	.4byte 0x00000000
.global lbl_805DD434               
lbl_805DD434:                      
	.4byte 0x70646600
.global lbl_805DD438               
lbl_805DD4348:                     
	.4byte 0x706A7000
.global lbl_805DD43C               
lbl_805DD43C:                      
	.4byte 0x706C6700
.global lbl_805DD440               
lbl_805DD440:                      
	.4byte 0x706C7300
.global lbl_805DD444               
lbl_805DD444:                      
	.4byte 0x7363706C
	.4byte 0x73000000
.global lbl_805DD44C               
lbl_805DD44C:                      
	.4byte 0x706E6700
.global lbl_805DD450               
lbl_805DD450:                      
	.4byte 0x71740000
.global lbl_805DD454               
lbl_805DD454:                      
	.4byte 0x72616D00
.global lbl_805DD458               
lbl_805DD458:                      
	.4byte 0x726D6900
.global lbl_805DD45C               
lbl_805DD45C:                      
	.4byte 0x726D6D00
.global lbl_805DD460               
lbl_805DD460:                      
	.4byte 0x72746600
.global lbl_805DD464               
lbl_805DD464:                      
	.4byte 0x7368746D
	.4byte 0x6C000000
.global lbl_805DD46C               
lbl_805DD46C:                      
	.4byte 0x736D6600
.global lbl_805DD470               
lbl_805DD470:                      
	.4byte 0x736E6400
.global lbl_805DD474               
lbl_805DD474:                      
	.4byte 0x73706C00
.global lbl_805DD478               
lbl_805DD478:                      
	.4byte 0x73736D00
.global lbl_805DD47C               
lbl_805DD47C:                      
	.4byte 0x73776600
.global lbl_805DD480               
lbl_805DD480:                      
	.4byte 0x74617200
.global lbl_805DD484               
lbl_805DD484:                      
	.4byte 0x74636C00
.global lbl_805DD488               
lbl_805DD488:                      
	.4byte 0x782D7463
	.4byte 0x6C000000
.global lbl_805DD490               
lbl_805DD490:                      
	.4byte 0x706C6169
	.4byte 0x6E000000
.global lbl_805DD498               
lbl_805DD498:                      
	.4byte 0x74696600
.global lbl_805DD49C               
lbl_805DD49C:                      
	.4byte 0x74696666
	.4byte 0x00000000
.global lbl_805DD4A4               
lbl_805DD4A4:                      
	.4byte 0x74787400
.global lbl_805DD4A8               
lbl_805DD4A8:                      
	.4byte 0x756C7700
.global lbl_805DD4AC               
lbl_805DD4AC:                      
	.4byte 0x77617600
.global lbl_805DD4B0               
lbl_805DD4B0:                      
	.4byte 0x77617800
.global lbl_805DD4B4               
lbl_805DD4B4:                      
	.4byte 0x776D0000
.global lbl_805DD4B8               
lbl_805DD4B8:                      
	.4byte 0x782D6D73
	.4byte 0x2D776D00
.global lbl_805DD4C0               
lbl_805DD4C0:                      
	.4byte 0x776D6100
.global lbl_805DD4C4               
lbl_805DD4C4:                      
	.4byte 0x776D7600
.global lbl_805DD4C8               
lbl_805DD4C8:                      
	.4byte 0x77767800
.global lbl_805DD4CC               
lbl_805DD4CC:                      
	.4byte 0x78626D00
.global lbl_805DD4D0               
lbl_805DD4D0:                      
	.4byte 0x786D6C00
.global lbl_805DD4D4               
lbl_805DD4D4:                      
	.4byte 0x78736C00
.global lbl_805DD4D8               
lbl_805DD4D8:                      
	.4byte 0x7A000000
.global lbl_805DD4DC               
lbl_805DD4DC:                      
	.4byte 0x7A697000
.global lbl_805DD4E0               
lbl_805DD4E0:                      
	.4byte 0x25732F25
	.4byte 0x73000000
.global lbl_805DD4E8               
lbl_805DD4E8:                      
	.4byte 0x636C6F73
	.4byte 0x65000000
.global lbl_805DD4F0               
lbl_805DD4F0:                      
	.4byte 0x6A610000
.global lbl_805DD4F4               
lbl_805DD4F4:                      
	.4byte 0x25640000
.global lbl_805DD4F8               
lbl_805DD4F8:                      
	.4byte 0x416C6C6F
	.4byte 0x77000000
.global lbl_805DD500               
lbl_805DD500:                      
	.4byte 0x75756964
	.4byte 0x3A257300
.global lbl_805DD508               
lbl_805DD508:                      
	.4byte 0x55534E00
.global lbl_805DD50C               
lbl_805DD50C:                      
	.4byte 0x75756964
	.4byte 0x3A000000
.global lbl_805DD514               
lbl_805DD514:                      
	.4byte 0x4E545300
.global lbl_805DD518               
lbl_805DD518:                      
	.4byte 0x53455256
	.byte 0x45, 0x52, 0x00
