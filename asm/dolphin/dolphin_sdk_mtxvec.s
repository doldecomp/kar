.include "macros.inc"

.section .text

.global PSMTXMultVec
PSMTXMultVec:
/* 803D1DEC 003CEBEC  E0 04 00 00 */	psq_l f0, 0(r4), 0, qr0
/* 803D1DF0 003CEBF0  E0 43 00 00 */	psq_l f2, 0(r3), 0, qr0
/* 803D1DF4 003CEBF4  E0 24 80 08 */	psq_l f1, 8(r4), 1, qr0
/* 803D1DF8 003CEBF8  10 82 00 32 */	ps_mul f4, f2, f0
/* 803D1DFC 003CEBFC  E0 63 00 08 */	psq_l f3, 8(r3), 0, qr0
/* 803D1E00 003CEC00  10 A3 20 7A */	ps_madd f5, f3, f1, f4
/* 803D1E04 003CEC04  E1 03 00 10 */	psq_l f8, 16(r3), 0, qr0
/* 803D1E08 003CEC08  10 C5 29 94 */	ps_sum0 f6, f5, f6, f5
/* 803D1E0C 003CEC0C  E1 23 00 18 */	psq_l f9, 24(r3), 0, qr0
/* 803D1E10 003CEC10  11 48 00 32 */	ps_mul f10, f8, f0
/* 803D1E14 003CEC14  F0 C5 80 00 */	psq_st f6, 0(r5), 1, qr0
/* 803D1E18 003CEC18  11 69 50 7A */	ps_madd f11, f9, f1, f10
/* 803D1E1C 003CEC1C  E0 43 00 20 */	psq_l f2, 32(r3), 0, qr0
/* 803D1E20 003CEC20  11 8B 5B 14 */	ps_sum0 f12, f11, f12, f11
/* 803D1E24 003CEC24  E0 63 00 28 */	psq_l f3, 40(r3), 0, qr0
/* 803D1E28 003CEC28  10 82 00 32 */	ps_mul f4, f2, f0
/* 803D1E2C 003CEC2C  F1 85 80 04 */	psq_st f12, 4(r5), 1, qr0
/* 803D1E30 003CEC30  10 A3 20 7A */	ps_madd f5, f3, f1, f4
/* 803D1E34 003CEC34  10 C5 29 94 */	ps_sum0 f6, f5, f6, f5
/* 803D1E38 003CEC38  F0 C5 80 08 */	psq_st f6, 8(r5), 1, qr0
/* 803D1E3C 003CEC3C  4E 80 00 20 */	blr 

.global func_803D1E40
func_803D1E40:
/* 803D1E40 003CEC40  E0 03 00 00 */	psq_l f0, 0(r3), 0, qr0
/* 803D1E44 003CEC44  E0 C4 00 00 */	psq_l f6, 0(r4), 0, qr0
/* 803D1E48 003CEC48  E0 43 00 10 */	psq_l f2, 16(r3), 0, qr0
/* 803D1E4C 003CEC4C  11 00 01 B2 */	ps_mul f8, f0, f6
/* 803D1E50 003CEC50  E0 83 00 20 */	psq_l f4, 32(r3), 0, qr0
/* 803D1E54 003CEC54  11 42 01 B2 */	ps_mul f10, f2, f6
/* 803D1E58 003CEC58  E0 E4 80 08 */	psq_l f7, 8(r4), 1, qr0
/* 803D1E5C 003CEC5C  11 84 01 B2 */	ps_mul f12, f4, f6
/* 803D1E60 003CEC60  E0 63 00 18 */	psq_l f3, 24(r3), 0, qr0
/* 803D1E64 003CEC64  11 08 42 14 */	ps_sum0 f8, f8, f8, f8
/* 803D1E68 003CEC68  E0 A3 00 28 */	psq_l f5, 40(r3), 0, qr0
/* 803D1E6C 003CEC6C  11 4A 52 94 */	ps_sum0 f10, f10, f10, f10
/* 803D1E70 003CEC70  E0 23 00 08 */	psq_l f1, 8(r3), 0, qr0
/* 803D1E74 003CEC74  11 8C 63 14 */	ps_sum0 f12, f12, f12, f12
/* 803D1E78 003CEC78  11 21 41 FA */	ps_madd f9, f1, f7, f8
/* 803D1E7C 003CEC7C  F1 25 80 00 */	psq_st f9, 0(r5), 1, qr0
/* 803D1E80 003CEC80  11 63 51 FA */	ps_madd f11, f3, f7, f10
/* 803D1E84 003CEC84  F1 65 80 04 */	psq_st f11, 4(r5), 1, qr0
/* 803D1E88 003CEC88  11 A5 61 FA */	ps_madd f13, f5, f7, f12
/* 803D1E8C 003CEC8C  F1 A5 80 08 */	psq_st f13, 8(r5), 1, qr0
/* 803D1E90 003CEC90  4E 80 00 20 */	blr 
