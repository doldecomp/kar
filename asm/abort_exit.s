.include "macros.inc"

.section .text  # 0x803AF93C - 0x803AFAC8

.global exit
exit:
/* 803AF93C 003AC73C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 803AF940 003AC740  7C 08 02 A6 */	mflr r0
/* 803AF944 003AC744  90 01 00 14 */	stw r0, 0x14(r1)
/* 803AF948 003AC748  93 E1 00 0C */	stw r31, 0xc(r1)
/* 803AF94C 003AC74C  80 0D 0B E8 */	lwz r0, lbl_805DDCC8@sda21(r13)
/* 803AF950 003AC750  2C 00 00 00 */	cmpwi r0, 0
/* 803AF954 003AC754  40 82 00 5C */	bne lbl_803AF9B0
/* 803AF958 003AC758  38 60 00 00 */	li r3, 0
/* 803AF95C 003AC75C  48 00 3F 0D */	bl __begin_critical_region
/* 803AF960 003AC760  38 60 00 00 */	li r3, 0
/* 803AF964 003AC764  48 00 3F 01 */	bl __end_critical_region
/* 803AF968 003AC768  4B FF D8 01 */	bl __destroy_global_chain
/* 803AF96C 003AC76C  3C 60 80 49 */	lis r3, lbl_80489460@ha
/* 803AF970 003AC770  38 03 94 60 */	addi r0, r3, lbl_80489460@l
/* 803AF974 003AC774  7C 1F 03 78 */	mr r31, r0
/* 803AF978 003AC778  48 00 00 10 */	b lbl_803AF988
lbl_803AF97C:
/* 803AF97C 003AC77C  7D 89 03 A6 */	mtctr r12
/* 803AF980 003AC780  4E 80 04 21 */	bctrl 
/* 803AF984 003AC784  3B FF 00 04 */	addi r31, r31, 4
lbl_803AF988:
/* 803AF988 003AC788  81 9F 00 00 */	lwz r12, 0(r31)
/* 803AF98C 003AC78C  28 0C 00 00 */	cmplwi r12, 0
/* 803AF990 003AC790  40 82 FF EC */	bne lbl_803AF97C
/* 803AF994 003AC794  81 8D 0B F0 */	lwz r12, lbl_805DDCD0@sda21(r13)
/* 803AF998 003AC798  28 0C 00 00 */	cmplwi r12, 0
/* 803AF99C 003AC79C  41 82 00 14 */	beq lbl_803AF9B0
/* 803AF9A0 003AC7A0  7D 89 03 A6 */	mtctr r12
/* 803AF9A4 003AC7A4  4E 80 04 21 */	bctrl 
/* 803AF9A8 003AC7A8  38 00 00 00 */	li r0, 0
/* 803AF9AC 003AC7AC  90 0D 0B F0 */	stw r0, lbl_805DDCD0@sda21(r13)
lbl_803AF9B0:
/* 803AF9B0 003AC7B0  38 60 00 00 */	li r3, 0
/* 803AF9B4 003AC7B4  48 00 3E B5 */	bl __begin_critical_region
/* 803AF9B8 003AC7B8  3C 60 80 57 */	lis r3, lbl_80569A10@ha
/* 803AF9BC 003AC7BC  3B E3 9A 10 */	addi r31, r3, lbl_80569A10@l
/* 803AF9C0 003AC7C0  48 00 00 20 */	b lbl_803AF9E0
lbl_803AF9C4:
/* 803AF9C4 003AC7C4  80 6D 0B EC */	lwz r3, lbl_805DDCCC@sda21(r13)
/* 803AF9C8 003AC7C8  38 63 FF FF */	addi r3, r3, -1
/* 803AF9CC 003AC7CC  54 60 10 3A */	slwi r0, r3, 2
/* 803AF9D0 003AC7D0  90 6D 0B EC */	stw r3, lbl_805DDCCC@sda21(r13)
/* 803AF9D4 003AC7D4  7D 9F 00 2E */	lwzx r12, r31, r0
/* 803AF9D8 003AC7D8  7D 89 03 A6 */	mtctr r12
/* 803AF9DC 003AC7DC  4E 80 04 21 */	bctrl 
lbl_803AF9E0:
/* 803AF9E0 003AC7E0  80 0D 0B EC */	lwz r0, lbl_805DDCCC@sda21(r13)
/* 803AF9E4 003AC7E4  2C 00 00 00 */	cmpwi r0, 0
/* 803AF9E8 003AC7E8  41 81 FF DC */	bgt lbl_803AF9C4
/* 803AF9EC 003AC7EC  38 60 00 00 */	li r3, 0
/* 803AF9F0 003AC7F0  48 00 3E 75 */	bl __end_critical_region
/* 803AF9F4 003AC7F4  48 00 3E 79 */	bl __kill_critical_regions
/* 803AF9F8 003AC7F8  81 8D 0B F4 */	lwz r12, lbl_805DDCD4@sda21(r13)
/* 803AF9FC 003AC7FC  28 0C 00 00 */	cmplwi r12, 0
/* 803AFA00 003AC800  41 82 00 14 */	beq lbl_803AFA14
/* 803AFA04 003AC804  7D 89 03 A6 */	mtctr r12
/* 803AFA08 003AC808  4E 80 04 21 */	bctrl 
/* 803AFA0C 003AC80C  38 00 00 00 */	li r0, 0
/* 803AFA10 003AC810  90 0D 0B F4 */	stw r0, lbl_805DDCD4@sda21(r13)
lbl_803AFA14:
/* 803AFA14 003AC814  48 02 BF F5 */	bl _ExitProcess
/* 803AFA18 003AC818  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803AFA1C 003AC81C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 803AFA20 003AC820  7C 08 03 A6 */	mtlr r0
/* 803AFA24 003AC824  38 21 00 10 */	addi r1, r1, 0x10
/* 803AFA28 003AC828  4E 80 00 20 */	blr 

.global abort
abort:
/* 803AFA2C 003AC82C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 803AFA30 003AC830  7C 08 02 A6 */	mflr r0
/* 803AFA34 003AC834  38 60 00 01 */	li r3, 1
/* 803AFA38 003AC838  90 01 00 14 */	stw r0, 0x14(r1)
/* 803AFA3C 003AC83C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 803AFA40 003AC840  48 00 82 91 */	bl func_803B7CD0
/* 803AFA44 003AC844  38 00 00 01 */	li r0, 1
/* 803AFA48 003AC848  38 60 00 00 */	li r3, 0
/* 803AFA4C 003AC84C  90 0D 0B E8 */	stw r0, lbl_805DDCC8@sda21(r13)
/* 803AFA50 003AC850  48 00 3E 19 */	bl __begin_critical_region
/* 803AFA54 003AC854  3C 60 80 57 */	lis r3, lbl_80569A10@ha
/* 803AFA58 003AC858  3B E3 9A 10 */	addi r31, r3, lbl_80569A10@l
/* 803AFA5C 003AC85C  48 00 00 20 */	b lbl_803AFA7C
lbl_803AFA60:
/* 803AFA60 003AC860  80 6D 0B EC */	lwz r3, lbl_805DDCCC@sda21(r13)
/* 803AFA64 003AC864  38 63 FF FF */	addi r3, r3, -1
/* 803AFA68 003AC868  54 60 10 3A */	slwi r0, r3, 2
/* 803AFA6C 003AC86C  90 6D 0B EC */	stw r3, lbl_805DDCCC@sda21(r13)
/* 803AFA70 003AC870  7D 9F 00 2E */	lwzx r12, r31, r0
/* 803AFA74 003AC874  7D 89 03 A6 */	mtctr r12
/* 803AFA78 003AC878  4E 80 04 21 */	bctrl 
lbl_803AFA7C:
/* 803AFA7C 003AC87C  80 0D 0B EC */	lwz r0, lbl_805DDCCC@sda21(r13)
/* 803AFA80 003AC880  2C 00 00 00 */	cmpwi r0, 0
/* 803AFA84 003AC884  41 81 FF DC */	bgt lbl_803AFA60
/* 803AFA88 003AC888  38 60 00 00 */	li r3, 0
/* 803AFA8C 003AC88C  48 00 3D D9 */	bl __end_critical_region
/* 803AFA90 003AC890  48 00 3D DD */	bl __kill_critical_regions
/* 803AFA94 003AC894  81 8D 0B F4 */	lwz r12, lbl_805DDCD4@sda21(r13)
/* 803AFA98 003AC898  28 0C 00 00 */	cmplwi r12, 0
/* 803AFA9C 003AC89C  41 82 00 14 */	beq lbl_803AFAB0
/* 803AFAA0 003AC8A0  7D 89 03 A6 */	mtctr r12
/* 803AFAA4 003AC8A4  4E 80 04 21 */	bctrl 
/* 803AFAA8 003AC8A8  38 00 00 00 */	li r0, 0
/* 803AFAAC 003AC8AC  90 0D 0B F4 */	stw r0, lbl_805DDCD4@sda21(r13)
lbl_803AFAB0:
/* 803AFAB0 003AC8B0  48 02 BF 59 */	bl _ExitProcess
/* 803AFAB4 003AC8B4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803AFAB8 003AC8B8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 803AFABC 003AC8BC  7C 08 03 A6 */	mtlr r0
/* 803AFAC0 003AC8C0  38 21 00 10 */	addi r1, r1, 0x10
/* 803AFAC4 003AC8C4  4E 80 00 20 */	blr 
