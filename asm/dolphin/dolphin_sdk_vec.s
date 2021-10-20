.include "macros.inc"

.section .text

.global func_803D2098
func_803D2098:
/* 803D2098 003CEE98  E0 43 00 00 */	psq_l f2, 0(r3), 0, qr0
/* 803D209C 003CEE9C  E0 84 00 00 */	psq_l f4, 0(r4), 0, qr0
/* 803D20A0 003CEEA0  10 C2 20 2A */	ps_add f6, f2, f4
/* 803D20A4 003CEEA4  F0 C5 00 00 */	psq_st f6, 0(r5), 0, qr0
/* 803D20A8 003CEEA8  E0 63 80 08 */	psq_l f3, 8(r3), 1, qr0
/* 803D20AC 003CEEAC  E0 A4 80 08 */	psq_l f5, 8(r4), 1, qr0
/* 803D20B0 003CEEB0  10 E3 28 2A */	ps_add f7, f3, f5
/* 803D20B4 003CEEB4  F0 E5 80 08 */	psq_st f7, 8(r5), 1, qr0
/* 803D20B8 003CEEB8  4E 80 00 20 */	blr 

.global PSVECSubtract
PSVECSubtract:
/* 803D20BC 003CEEBC  E0 43 00 00 */	psq_l f2, 0(r3), 0, qr0
/* 803D20C0 003CEEC0  E0 84 00 00 */	psq_l f4, 0(r4), 0, qr0
/* 803D20C4 003CEEC4  10 C2 20 28 */	ps_sub f6, f2, f4
/* 803D20C8 003CEEC8  F0 C5 00 00 */	psq_st f6, 0(r5), 0, qr0
/* 803D20CC 003CEECC  E0 63 80 08 */	psq_l f3, 8(r3), 1, qr0
/* 803D20D0 003CEED0  E0 A4 80 08 */	psq_l f5, 8(r4), 1, qr0
/* 803D20D4 003CEED4  10 E3 28 28 */	ps_sub f7, f3, f5
/* 803D20D8 003CEED8  F0 E5 80 08 */	psq_st f7, 8(r5), 1, qr0
/* 803D20DC 003CEEDC  4E 80 00 20 */	blr 

.global PSVECScale
PSVECScale:
/* 803D20E0 003CEEE0  E0 03 00 00 */	psq_l f0, 0(r3), 0, qr0
/* 803D20E4 003CEEE4  E0 43 80 08 */	psq_l f2, 8(r3), 1, qr0
/* 803D20E8 003CEEE8  10 00 00 58 */	ps_muls0 f0, f0, f1
/* 803D20EC 003CEEEC  F0 04 00 00 */	psq_st f0, 0(r4), 0, qr0
/* 803D20F0 003CEEF0  10 02 00 58 */	ps_muls0 f0, f2, f1
/* 803D20F4 003CEEF4  F0 04 80 08 */	psq_st f0, 8(r4), 1, qr0
/* 803D20F8 003CEEF8  4E 80 00 20 */	blr 

.global PSVECNormalize
PSVECNormalize:
/* 803D20FC 003CEEFC  C0 02 F1 E8 */	lfs f0, lbl_805E58E8@sda21(r2)
/* 803D2100 003CEF00  C0 22 F1 EC */	lfs f1, lbl_805E58EC@sda21(r2)
/* 803D2104 003CEF04  E0 43 00 00 */	psq_l f2, 0(r3), 0, qr0
/* 803D2108 003CEF08  10 A2 00 B2 */	ps_mul f5, f2, f2
/* 803D210C 003CEF0C  E0 63 80 08 */	psq_l f3, 8(r3), 1, qr0
/* 803D2110 003CEF10  10 83 28 FA */	ps_madd f4, f3, f3, f5
/* 803D2114 003CEF14  10 84 28 D4 */	ps_sum0 f4, f4, f3, f5
/* 803D2118 003CEF18  FC A0 20 34 */	frsqrte f5, f4
/* 803D211C 003CEF1C  EC C5 01 72 */	fmuls f6, f5, f5
/* 803D2120 003CEF20  EC 05 00 32 */	fmuls f0, f5, f0
/* 803D2124 003CEF24  EC C6 09 3C */	fnmsubs f6, f6, f4, f1
/* 803D2128 003CEF28  EC A6 00 32 */	fmuls f5, f6, f0
/* 803D212C 003CEF2C  10 42 01 58 */	ps_muls0 f2, f2, f5
/* 803D2130 003CEF30  F0 44 00 00 */	psq_st f2, 0(r4), 0, qr0
/* 803D2134 003CEF34  10 63 01 58 */	ps_muls0 f3, f3, f5
/* 803D2138 003CEF38  F0 64 80 08 */	psq_st f3, 8(r4), 1, qr0
/* 803D213C 003CEF3C  4E 80 00 20 */	blr 

.global func_803D2140
func_803D2140:
/* 803D2140 003CEF40  E0 03 00 00 */	psq_l f0, 0(r3), 0, qr0
/* 803D2144 003CEF44  10 00 00 32 */	ps_mul f0, f0, f0
/* 803D2148 003CEF48  C0 23 00 08 */	lfs f1, 8(r3)
/* 803D214C 003CEF4C  10 21 00 7A */	ps_madd f1, f1, f1, f0
/* 803D2150 003CEF50  10 21 00 14 */	ps_sum0 f1, f1, f0, f0
/* 803D2154 003CEF54  4E 80 00 20 */	blr 

.global PSVECMag
PSVECMag:
/* 803D2158 003CEF58  C0 82 F1 E8 */	lfs f4, lbl_805E58E8@sda21(r2)
/* 803D215C 003CEF5C  E0 03 00 00 */	psq_l f0, 0(r3), 0, qr0
/* 803D2160 003CEF60  10 00 00 32 */	ps_mul f0, f0, f0
/* 803D2164 003CEF64  C0 23 00 08 */	lfs f1, 8(r3)
/* 803D2168 003CEF68  EC 44 20 28 */	fsubs f2, f4, f4
/* 803D216C 003CEF6C  10 21 00 7A */	ps_madd f1, f1, f1, f0
/* 803D2170 003CEF70  10 21 00 14 */	ps_sum0 f1, f1, f0, f0
/* 803D2174 003CEF74  FC 01 10 00 */	fcmpu cr0, f1, f2
/* 803D2178 003CEF78  41 82 00 20 */	beq lbl_803D2198
/* 803D217C 003CEF7C  FC 00 08 34 */	frsqrte f0, f1
/* 803D2180 003CEF80  C0 62 F1 EC */	lfs f3, lbl_805E58EC@sda21(r2)
/* 803D2184 003CEF84  EC 40 00 32 */	fmuls f2, f0, f0
/* 803D2188 003CEF88  EC 00 01 32 */	fmuls f0, f0, f4
/* 803D218C 003CEF8C  EC 42 18 7C */	fnmsubs f2, f2, f1, f3
/* 803D2190 003CEF90  EC 02 00 32 */	fmuls f0, f2, f0
/* 803D2194 003CEF94  EC 21 00 32 */	fmuls f1, f1, f0
lbl_803D2198:
/* 803D2198 003CEF98  4E 80 00 20 */	blr 

.global PSVECDotProduct
PSVECDotProduct:
/* 803D219C 003CEF9C  E0 43 00 04 */	psq_l f2, 4(r3), 0, qr0
/* 803D21A0 003CEFA0  E0 64 00 04 */	psq_l f3, 4(r4), 0, qr0
/* 803D21A4 003CEFA4  10 42 00 F2 */	ps_mul f2, f2, f3
/* 803D21A8 003CEFA8  E0 A3 00 00 */	psq_l f5, 0(r3), 0, qr0
/* 803D21AC 003CEFAC  E0 84 00 00 */	psq_l f4, 0(r4), 0, qr0
/* 803D21B0 003CEFB0  10 65 11 3A */	ps_madd f3, f5, f4, f2
/* 803D21B4 003CEFB4  10 23 10 94 */	ps_sum0 f1, f3, f2, f2
/* 803D21B8 003CEFB8  4E 80 00 20 */	blr 

.global PSVECCrossProduct
PSVECCrossProduct:
/* 803D21BC 003CEFBC  E0 24 00 00 */	psq_l f1, 0(r4), 0, qr0
/* 803D21C0 003CEFC0  C0 43 00 08 */	lfs f2, 8(r3)
/* 803D21C4 003CEFC4  E0 03 00 00 */	psq_l f0, 0(r3), 0, qr0
/* 803D21C8 003CEFC8  10 C1 0C A0 */	ps_merge10 f6, f1, f1
/* 803D21CC 003CEFCC  C0 64 00 08 */	lfs f3, 8(r4)
/* 803D21D0 003CEFD0  10 81 00 B2 */	ps_mul f4, f1, f2
/* 803D21D4 003CEFD4  10 E1 00 18 */	ps_muls0 f7, f1, f0
/* 803D21D8 003CEFD8  10 A0 20 F8 */	ps_msub f5, f0, f3, f4
/* 803D21DC 003CEFDC  11 00 39 B8 */	ps_msub f8, f0, f6, f7
/* 803D21E0 003CEFE0  11 25 2C E0 */	ps_merge11 f9, f5, f5
/* 803D21E4 003CEFE4  11 45 44 60 */	ps_merge01 f10, f5, f8
/* 803D21E8 003CEFE8  F1 25 80 00 */	psq_st f9, 0(r5), 1, qr0
/* 803D21EC 003CEFEC  11 40 50 50 */	ps_neg f10, f10
/* 803D21F0 003CEFF0  F1 45 00 04 */	psq_st f10, 4(r5), 0, qr0
/* 803D21F4 003CEFF4  4E 80 00 20 */	blr 

.global func_803D21F8
func_803D21F8:
/* 803D21F8 003CEFF8  7C 08 02 A6 */	mflr r0
/* 803D21FC 003CEFFC  90 01 00 04 */	stw r0, 4(r1)
/* 803D2200 003CF000  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 803D2204 003CF004  93 E1 00 34 */	stw r31, 0x34(r1)
/* 803D2208 003CF008  93 C1 00 30 */	stw r30, 0x30(r1)
/* 803D220C 003CF00C  7C 9E 23 78 */	mr r30, r4
/* 803D2210 003CF010  7C BF 2B 78 */	mr r31, r5
/* 803D2214 003CF014  C0 03 00 00 */	lfs f0, 0(r3)
/* 803D2218 003CF018  FC 00 00 50 */	fneg f0, f0
/* 803D221C 003CF01C  D0 01 00 20 */	stfs f0, 0x20(r1)
/* 803D2220 003CF020  C0 03 00 04 */	lfs f0, 4(r3)
/* 803D2224 003CF024  FC 00 00 50 */	fneg f0, f0
/* 803D2228 003CF028  D0 01 00 24 */	stfs f0, 0x24(r1)
/* 803D222C 003CF02C  C0 03 00 08 */	lfs f0, 8(r3)
/* 803D2230 003CF030  38 61 00 20 */	addi r3, r1, 0x20
/* 803D2234 003CF034  7C 64 1B 78 */	mr r4, r3
/* 803D2238 003CF038  FC 00 00 50 */	fneg f0, f0
/* 803D223C 003CF03C  D0 01 00 28 */	stfs f0, 0x28(r1)
/* 803D2240 003CF040  4B FF FE BD */	bl PSVECNormalize
/* 803D2244 003CF044  7F C3 F3 78 */	mr r3, r30
/* 803D2248 003CF048  38 81 00 14 */	addi r4, r1, 0x14
/* 803D224C 003CF04C  4B FF FE B1 */	bl PSVECNormalize
/* 803D2250 003CF050  38 61 00 20 */	addi r3, r1, 0x20
/* 803D2254 003CF054  38 81 00 14 */	addi r4, r1, 0x14
/* 803D2258 003CF058  4B FF FF 45 */	bl PSVECDotProduct
/* 803D225C 003CF05C  C0 62 F1 F0 */	lfs f3, lbl_805E58F0@sda21(r2)
/* 803D2260 003CF060  7F E3 FB 78 */	mr r3, r31
/* 803D2264 003CF064  C0 41 00 14 */	lfs f2, 0x14(r1)
/* 803D2268 003CF068  7F E4 FB 78 */	mr r4, r31
/* 803D226C 003CF06C  C0 01 00 20 */	lfs f0, 0x20(r1)
/* 803D2270 003CF070  EC 43 00 B2 */	fmuls f2, f3, f2
/* 803D2274 003CF074  EC 42 00 72 */	fmuls f2, f2, f1
/* 803D2278 003CF078  EC 02 00 28 */	fsubs f0, f2, f0
/* 803D227C 003CF07C  D0 1F 00 00 */	stfs f0, 0(r31)
/* 803D2280 003CF080  C0 41 00 18 */	lfs f2, 0x18(r1)
/* 803D2284 003CF084  C0 01 00 24 */	lfs f0, 0x24(r1)
/* 803D2288 003CF088  EC 43 00 B2 */	fmuls f2, f3, f2
/* 803D228C 003CF08C  EC 42 00 72 */	fmuls f2, f2, f1
/* 803D2290 003CF090  EC 02 00 28 */	fsubs f0, f2, f0
/* 803D2294 003CF094  D0 1F 00 04 */	stfs f0, 4(r31)
/* 803D2298 003CF098  C0 41 00 1C */	lfs f2, 0x1c(r1)
/* 803D229C 003CF09C  C0 01 00 28 */	lfs f0, 0x28(r1)
/* 803D22A0 003CF0A0  EC 43 00 B2 */	fmuls f2, f3, f2
/* 803D22A4 003CF0A4  EC 22 00 72 */	fmuls f1, f2, f1
/* 803D22A8 003CF0A8  EC 01 00 28 */	fsubs f0, f1, f0
/* 803D22AC 003CF0AC  D0 1F 00 08 */	stfs f0, 8(r31)
/* 803D22B0 003CF0B0  4B FF FE 4D */	bl PSVECNormalize
/* 803D22B4 003CF0B4  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 803D22B8 003CF0B8  83 E1 00 34 */	lwz r31, 0x34(r1)
/* 803D22BC 003CF0BC  83 C1 00 30 */	lwz r30, 0x30(r1)
/* 803D22C0 003CF0C0  38 21 00 38 */	addi r1, r1, 0x38
/* 803D22C4 003CF0C4  7C 08 03 A6 */	mtlr r0
/* 803D22C8 003CF0C8  4E 80 00 20 */	blr 

.global func_803D22CC
func_803D22CC:
/* 803D22CC 003CF0CC  E0 03 00 04 */	psq_l f0, 4(r3), 0, qr0
/* 803D22D0 003CF0D0  E0 24 00 04 */	psq_l f1, 4(r4), 0, qr0
/* 803D22D4 003CF0D4  10 40 08 28 */	ps_sub f2, f0, f1
/* 803D22D8 003CF0D8  E0 03 00 00 */	psq_l f0, 0(r3), 0, qr0
/* 803D22DC 003CF0DC  E0 24 00 00 */	psq_l f1, 0(r4), 0, qr0
/* 803D22E0 003CF0E0  10 42 00 B2 */	ps_mul f2, f2, f2
/* 803D22E4 003CF0E4  10 00 08 28 */	ps_sub f0, f0, f1
/* 803D22E8 003CF0E8  10 20 10 3A */	ps_madd f1, f0, f0, f2
/* 803D22EC 003CF0EC  10 21 10 94 */	ps_sum0 f1, f1, f2, f2
/* 803D22F0 003CF0F0  4E 80 00 20 */	blr 

.global func_803D22F4
func_803D22F4:
/* 803D22F4 003CF0F4  E0 03 00 04 */	psq_l f0, 4(r3), 0, qr0
/* 803D22F8 003CF0F8  E0 24 00 04 */	psq_l f1, 4(r4), 0, qr0
/* 803D22FC 003CF0FC  10 40 08 28 */	ps_sub f2, f0, f1
/* 803D2300 003CF100  E0 03 00 00 */	psq_l f0, 0(r3), 0, qr0
/* 803D2304 003CF104  E0 24 00 00 */	psq_l f1, 0(r4), 0, qr0
/* 803D2308 003CF108  10 42 00 B2 */	ps_mul f2, f2, f2
/* 803D230C 003CF10C  10 00 08 28 */	ps_sub f0, f0, f1
/* 803D2310 003CF110  C0 62 F1 E8 */	lfs f3, lbl_805E58E8@sda21(r2)
/* 803D2314 003CF114  10 20 10 3A */	ps_madd f1, f0, f0, f2
/* 803D2318 003CF118  EC 03 18 28 */	fsubs f0, f3, f3
/* 803D231C 003CF11C  10 21 10 94 */	ps_sum0 f1, f1, f2, f2
/* 803D2320 003CF120  FC 00 08 00 */	fcmpu cr0, f0, f1
/* 803D2324 003CF124  41 82 00 20 */	beq lbl_803D2344
/* 803D2328 003CF128  C0 82 F1 EC */	lfs f4, lbl_805E58EC@sda21(r2)
/* 803D232C 003CF12C  FC 00 08 34 */	frsqrte f0, f1
/* 803D2330 003CF130  EC 40 00 32 */	fmuls f2, f0, f0
/* 803D2334 003CF134  EC 00 00 F2 */	fmuls f0, f0, f3
/* 803D2338 003CF138  EC 42 20 7C */	fnmsubs f2, f2, f1, f4
/* 803D233C 003CF13C  EC 02 00 32 */	fmuls f0, f2, f0
/* 803D2340 003CF140  EC 21 00 32 */	fmuls f1, f1, f0
lbl_803D2344:
/* 803D2344 003CF144  4E 80 00 20 */	blr 
