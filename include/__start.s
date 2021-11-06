Analyzing: C:\Users\jupit\AppData\Local\Temp\__start.o
Header idenfication: 0x7f, ELF, 32 bit MSB v1
    type:           1, machine:         20
    version: 00000001, entry:     00000000, phoff:  00000000
    shoff:   000008b0, flags:     80000000, ehsize:       52, phentsize:  0
    phnum:          0, shentsize:       40, shnum:        10, shstrndx:  8


==> .shstrtab
    [  1]	.init
    [  7]	.sbss
    [ 13]	.mwcats.init
    [ 26]	.rela.init
    [ 37]	.rela.mwcats.init
    [ 55]	.symtab
    [ 63]	.strtab
    [ 71]	.shstrtab
    [ 81]	.comment

==> .init [1]: Section Header
    type:    00000001, flags:  00000006
    address: 00000000, offset: 00000034, size: 00000300
    link:    00000000, info:   00000000, alignment: 4, entry size: 0


==> .sbss [2]: Section Header
    type:    00000008, flags:  00000003
    address: 00000000, offset: 00000338, size: 00000001
    link:    00000000, info:   00000000, alignment: 8, entry size: 0


==> .mwcats.init [3]: Section Header
    type:    ca2a82c2, flags:  00000000
    address: 00000000, offset: 00000338, size: 00000020
    link:    00000001, info:   00000000, alignment: 4, entry size: 1


==> .rela.init [4]: Section Header
    type:    00000004, flags:  00000000
    address: 00000000, offset: 00000358, size: 00000108
    link:    00000006, info:   00000001, alignment: 4, entry size: 12


==> .rela.mwcats.init [5]: Section Header
    type:    00000004, flags:  00000000
    address: 00000000, offset: 00000460, size: 00000030
    link:    00000006, info:   00000003, alignment: 4, entry size: 12


==> .symtab [6]: Section Header
    type:    00000002, flags:  00000000
    address: 00000000, offset: 00000490, size: 000001b0
    link:    00000007, info:   00000008, alignment: 4, entry size: 16


==> .strtab [7]: Section Header
    type:    00000003, flags:  00000000
    address: 00000000, offset: 00000640, size: 00000111
    link:    00000000, info:   00000000, alignment: 1, entry size: 1


==> .shstrtab [8]: Section Header
    type:    00000003, flags:  00000000
    address: 00000000, offset: 00000751, size: 0000005a
    link:    00000000, info:   00000000, alignment: 1, entry size: 1


==> .comment [9]: Section Header
    type:    00000001, flags:  00000000
    address: 00000000, offset: 000007ab, size: 00000104
    link:    00000000, info:   00000000, alignment: 1, entry size: 1


==> .strtab
    [  1]	__start.c
    [ 11]	Debug_BBA
    [ 21]	__init_registers
    [ 38]	__init_data
    [ 50]	__check_pad3
    [ 63]	__set_debug_bba
    [ 79]	__get_debug_bba
    [ 95]	__start
    [ 103]	__init_registers
    [ 120]	__init_data
    [ 132]	_rom_copy_info
    [ 147]	_bss_init_info
    [ 162]	OSResetSystem
    [ 176]	__init_hardware
    [ 192]	DBInit
    [ 199]	OSInit
    [ 206]	InitMetroTRK_BBA
    [ 223]	__init_user
    [ 235]	main
    [ 240]	exit
    [ 245]	memcpy
    [ 252]	__flush_cache
    [ 266]	memset

==> .symtab
    entry  spndx   value      size   bind   type  other    shndx         name
    [   0]     0   00000000      0   LOC    NULL      0    UND           
    [   1]     1   00000000      0   LOC    FILE      0    ABS           __start.c
    [   2]     0   00000000      0   LOC    SECT      0    .init         .init
    [   3]     0   00000000      0   LOC    SECT      0    .sbss         .sbss
    [   4]     0   00000000      0   LOC    SECT      0    .mwcats.init  .mwcats.init
    [   5]    11   00000000      1   LOC    OBJ       0    .sbss         Debug_BBA
    [   6]    21   000001b0    144   LOC    FUNC      0    .init         __init_registers
    [   7]    38   00000240    192   LOC    FUNC      0    .init         __init_data
    [   8]    50   00000000     64   GLOB   FUNC      0    .init         __check_pad3
    [   9]    63   00000040     12   GLOB   FUNC      0    .init         __set_debug_bba
    [  10]    79   0000004c      8   GLOB   FUNC      0    .init         __get_debug_bba
    [  11]    95   00000054    348   GLOB   FUNC      0    .init         __start
    [  12]   103   00000000      0   GLOB   NULL      0    UND           __init_registers
    [  13]   120   00000000      0   GLOB   NULL      0    UND           __init_data
    [  14]   132   00000000      0   GLOB   NULL      0    UND           _rom_copy_info
    [  15]   147   00000000      0   GLOB   NULL      0    UND           _bss_init_info
    [  16]   162   00000000      0   GLOB   NULL      0    UND           OSResetSystem
    [  17]   176   00000000      0   GLOB   NULL      0    UND           __init_hardware
    [  18]   192   00000000      0   GLOB   NULL      0    UND           DBInit
    [  19]   199   00000000      0   GLOB   NULL      0    UND           OSInit
    [  20]   206   00000000      0   GLOB   NULL      0    UND           InitMetroTRK_BBA
    [  21]   223   00000000      0   GLOB   NULL      0    UND           __init_user
    [  22]   235   00000000      0   GLOB   NULL      0    UND           main
    [  23]   240   00000000      0   GLOB   NULL      0    UND           exit
    [  24]   245   00000000      0   GLOB   NULL      0    UND           memcpy
    [  25]   252   00000000      0   GLOB   NULL      0    UND           __flush_cache
    [  26]   266   00000000      0   GLOB   NULL      0    UND           memset

==> .rela.init
    entry  offset   addend   type name(symbol id)
    [   0] 0000002c 00000000   10 OSResetSystem(16)
    [   1] 00000046 00000000  109 Debug_BBA(5)
    [   2] 0000004e 00000000  109 Debug_BBA(5)
    [   3] 00000054 00000000   10 __init_registers(12)
    [   4] 00000058 00000000   10 __init_hardware(17)
    [   5] 0000006c 00000000   10 __init_data(13)
    [   6] 000000e0 00000000   10 __set_debug_bba(9)
    [   7] 00000160 00000000   10 DBInit(18)
    [   8] 00000164 00000000   10 OSInit(19)
    [   9] 00000188 00000000   10 __check_pad3(8)
    [  10] 0000018c 00000000   10 __get_debug_bba(10)
    [  11] 00000198 00000000   10 InitMetroTRK_BBA(20)
    [  12] 0000019c 00000000   10 __init_user(21)
    [  13] 000001a8 00000000   10 main(22)
    [  14] 000001ac 00000000   10 exit(23)
    [  15] 0000025a 00000000    6 _rom_copy_info(14)
    [  16] 0000025e 00000000    4 _rom_copy_info(14)
    [  17] 00000294 00000000   10 memcpy(24)
    [  18] 000002a0 00000000   10 __flush_cache(25)
    [  19] 000002ae 00000000    6 _bss_init_info(15)
    [  20] 000002b2 00000000    4 _bss_init_info(15)
    [  21] 000002d8 00000000   10 memset(26)

==> .init

Hunk:	Kind=HUNK_GLOBAL_CODE     Name="__check_pad3"  Size=64
00000000: 7C0802A6  mflr     r0
00000004: 3C608000  lis      r3,-32768
00000008: 90010004  stw      r0,4(rsp)
0000000C: 9421FFF8  stwu     rsp,-8(rsp)
00000010: A00330E4  lhz      r0,12516(r3)
00000014: 70000EEF  andi.    r0,r0,0x0eef
00000018: 2C000EEF  cmpwi    r0,0x0eef
0000001C: 40820014  bne      *+20                    ; 0x00000030
00000020: 38600000  li       r3,0
00000024: 38800000  li       r4,0
00000028: 38A00000  li       r5,0
0000002C: 48000001  bl       OSResetSystem
00000030: 8001000C  lwz      r0,12(rsp)
00000034: 38210008  addi     rsp,rsp,8
00000038: 7C0803A6  mtlr     r0
0000003C: 4E800020  blr

Hunk:	Kind=HUNK_GLOBAL_CODE     Name="__set_debug_bba"  Size=12
00000040: 38000001  li       r0,1
00000044: 98000000  stb      r0,Debug_BBA
00000048: 4E800020  blr

Hunk:	Kind=HUNK_GLOBAL_CODE     Name="__get_debug_bba"  Size=8
0000004C: 88600000  lbz      r3,Debug_BBA
00000050: 4E800020  blr

Hunk:	Kind=HUNK_GLOBAL_CODE     Name="__start"  Size=348
00000054: 48000001  bl       __init_registers
00000058: 48000001  bl       __init_hardware
0000005C: 3800FFFF  li       r0,-1
00000060: 9421FFF8  stwu     rsp,-8(rsp)
00000064: 90010004  stw      r0,4(rsp)
00000068: 90010000  stw      r0,0(rsp)
0000006C: 48000001  bl       __init_data
00000070: 38000000  li       r0,0
00000074: 3CC08000  lis      r6,-32768
00000078: 38C60044  addi     r6,r6,68
0000007C: 90060000  stw      r0,0(r6)
00000080: 3CC08000  lis      r6,-32768
00000084: 38C600F4  addi     r6,r6,244
00000088: 80C60000  lwz      r6,0(r6)
0000008C: 28060000  cmplwi   r6,0x0000
00000090: 4182000C  beq      *+12                    ; 0x0000009C
00000094: 80E6000C  lwz      r7,12(r6)
00000098: 48000024  b        *+36                    ; 0x000000BC
0000009C: 3CA08000  lis      r5,-32768
000000A0: 38A50034  addi     r5,r5,52
000000A4: 80A50000  lwz      r5,0(r5)
000000A8: 28050000  cmplwi   r5,0x0000
000000AC: 4182004C  beq      *+76                    ; 0x000000F8
000000B0: 3CE08000  lis      r7,-32768
000000B4: 38E730E8  addi     r7,r7,12520
000000B8: 80E70000  lwz      r7,0(r7)
000000BC: 38A00000  li       r5,0
000000C0: 28070002  cmplwi   r7,0x0002
000000C4: 41820024  beq      *+36                    ; 0x000000E8
000000C8: 28070003  cmplwi   r7,0x0003
000000CC: 38A00001  li       r5,1
000000D0: 41820018  beq      *+24                    ; 0x000000E8
000000D4: 28070004  cmplwi   r7,0x0004
000000D8: 40820020  bne      *+32                    ; 0x000000F8
000000DC: 38A00002  li       r5,2
000000E0: 48000001  bl       __set_debug_bba
000000E4: 48000014  b        *+20                    ; 0x000000F8
000000E8: 3CC00000  lis      r6,0
000000EC: 38C61EA0  addi     r6,r6,7840
000000F0: 7CC803A6  mtlr     r6
000000F4: 4E800021  blrl
000000F8: 3CC08000  lis      r6,-32768
000000FC: 38C600F4  addi     r6,r6,244
00000100: 80A60000  lwz      r5,0(r6)
00000104: 28050000  cmplwi   r5,0x0000
00000108: 41A20050  beq+     *+80                    ; 0x00000158
0000010C: 80C50008  lwz      r6,8(r5)
00000110: 28060000  cmplwi   r6,0x0000
00000114: 41A20044  beq+     *+68                    ; 0x00000158
00000118: 7CC53214  add      r6,r5,r6
0000011C: 81C60000  lwz      r14,0(r6)
00000120: 280E0000  cmplwi   r14,0x0000
00000124: 41820034  beq      *+52                    ; 0x00000158
00000128: 39E60004  addi     r15,r6,4
0000012C: 7DC903A6  mtctr    r14
00000130: 38C60004  addi     r6,r6,4
00000134: 80E60000  lwz      r7,0(r6)
00000138: 7CE72A14  add      r7,r7,r5
0000013C: 90E60000  stw      r7,0(r6)
00000140: 4200FFF0  bdnz     *-16                    ; 0x00000130
00000144: 3CA08000  lis      r5,-32768
00000148: 38A50034  addi     r5,r5,52
0000014C: 55E70034  clrrwi   r7,r15,5
00000150: 90E50000  stw      r7,0(r5)
00000154: 4800000C  b        *+12                    ; 0x00000160
00000158: 39C00000  li       r14,0
0000015C: 39E00000  li       r15,0
00000160: 48000001  bl       DBInit
00000164: 48000001  bl       OSInit
00000168: 3C808000  lis      r4,-32768
0000016C: 388430E6  addi     r4,r4,12518
00000170: A0640000  lhz      r3,0(r4)
00000174: 70658000  andi.    r5,r3,0x8000
00000178: 41820010  beq      *+16                    ; 0x00000188
0000017C: 70637FFF  andi.    r3,r3,0x7fff
00000180: 28030001  cmplwi   r3,0x0001
00000184: 40820008  bne      *+8                     ; 0x0000018C
00000188: 48000001  bl       __check_pad3
0000018C: 48000001  bl       __get_debug_bba
00000190: 28030001  cmplwi   r3,0x0001
00000194: 40820008  bne      *+8                     ; 0x0000019C
00000198: 48000001  bl       InitMetroTRK_BBA
0000019C: 48000001  bl       __init_user
000001A0: 7DC37378  mr       r3,r14
000001A4: 7DE47B78  mr       r4,r15
000001A8: 48000001  bl       main
000001AC: 48000000  b        exit

Hunk:	Kind=HUNK_LOCAL_CODE     Name="__init_registers"  Size=144
000001B0: 38000000  li       r0,0
000001B4: 38600000  li       r3,0
000001B8: 38800000  li       r4,0
000001BC: 38A00000  li       r5,0
000001C0: 38C00000  li       r6,0
000001C4: 38E00000  li       r7,0
000001C8: 39000000  li       r8,0
000001CC: 39200000  li       r9,0
000001D0: 39400000  li       r10,0
000001D4: 39600000  li       r11,0
000001D8: 39800000  li       r12,0
000001DC: 39C00000  li       r14,0
000001E0: 39E00000  li       r15,0
000001E4: 3A000000  li       r16,0
000001E8: 3A200000  li       r17,0
000001EC: 3A400000  li       r18,0
000001F0: 3A600000  li       r19,0
000001F4: 3A800000  li       r20,0
000001F8: 3AA00000  li       r21,0
000001FC: 3AC00000  li       r22,0
00000200: 3AE00000  li       r23,0
00000204: 3B000000  li       r24,0
00000208: 3B200000  li       r25,0
0000020C: 3B400000  li       r26,0
00000210: 3B600000  li       r27,0
00000214: 3B800000  li       r28,0
00000218: 3BA00000  li       r29,0
0000021C: 3BC00000  li       r30,0
00000220: 3BE00000  li       r31,0
00000224: 3C20805F  lis      rsp,-32673
00000228: 60216390  ori      rsp,rsp,0x6390
0000022C: 3C40805E  lis      r2,-32674
00000230: 60426700  ori      r2,r2,0x6700
00000234: 3DA0805D  lis      r13,-32675
00000238: 61ADD0E0  ori      r13,r13,0xd0e0
0000023C: 4E800020  blr

Hunk:	Kind=HUNK_LOCAL_CODE     Name="__init_data"  Size=192
00000240: 7C0802A6  mflr     r0
00000244: 90010004  stw      r0,4(rsp)
00000248: 9421FFE8  stwu     rsp,-24(rsp)
0000024C: 93E10014  stw      r31,20(rsp)
00000250: 93C10010  stw      r30,16(rsp)
00000254: 93A1000C  stw      r29,12(rsp)
00000258: 3C600000  lis      r3,_rom_copy_info@ha
0000025C: 38030000  addi     r0,r3,_rom_copy_info@l
00000260: 7C1D0378  mr       r29,r0
00000264: 48000004  b        *+4                     ; 0x00000268
00000268: 48000004  b        *+4                     ; 0x0000026C
0000026C: 83DD0008  lwz      r30,8(r29)
00000270: 281E0000  cmplwi   r30,0x0000
00000274: 41820038  beq      *+56                    ; 0x000002AC
00000278: 809D0000  lwz      r4,0(r29)
0000027C: 83FD0004  lwz      r31,4(r29)
00000280: 41820024  beq      *+36                    ; 0x000002A4
00000284: 7C1F2040  cmplw    r31,r4
00000288: 4182001C  beq      *+28                    ; 0x000002A4
0000028C: 7FE3FB78  mr       r3,r31
00000290: 7FC5F378  mr       r5,r30
00000294: 48000001  bl       memcpy
00000298: 7FE3FB78  mr       r3,r31
0000029C: 7FC4F378  mr       r4,r30
000002A0: 48000001  bl       __flush_cache
000002A4: 3BBD000C  addi     r29,r29,12
000002A8: 4BFFFFC4  b        *-60                    ; 0x0000026C
000002AC: 3C600000  lis      r3,_bss_init_info@ha
000002B0: 38030000  addi     r0,r3,_bss_init_info@l
000002B4: 7C1D0378  mr       r29,r0
000002B8: 48000004  b        *+4                     ; 0x000002BC
000002BC: 48000004  b        *+4                     ; 0x000002C0
000002C0: 80BD0004  lwz      r5,4(r29)
000002C4: 28050000  cmplwi   r5,0x0000
000002C8: 4182001C  beq      *+28                    ; 0x000002E4
000002CC: 807D0000  lwz      r3,0(r29)
000002D0: 4182000C  beq      *+12                    ; 0x000002DC
000002D4: 38800000  li       r4,0
000002D8: 48000001  bl       memset
000002DC: 3BBD0008  addi     r29,r29,8
000002E0: 4BFFFFE0  b        *-32                    ; 0x000002C0
000002E4: 8001001C  lwz      r0,28(rsp)
000002E8: 83E10014  lwz      r31,20(rsp)
000002EC: 83C10010  lwz      r30,16(rsp)
000002F0: 7C0803A6  mtlr     r0
000002F4: 83A1000C  lwz      r29,12(rsp)
000002F8: 38210018  addi     rsp,rsp,24
000002FC: 4E800020  blr

==> .sbss
Debug_BBA:
00000000: 00                                     

==> .rela.mwcats.init
    entry  offset   addend   type name(symbol id)
    [   0] 00000004 00000000    1 __check_pad3(8)
    [   1] 0000000c 00000000    1 __set_debug_bba(9)
    [   2] 00000014 00000000    1 __get_debug_bba(10)
    [   3] 0000001c 00000000    1 __init_data(7)

==> .mwcats.init
    type size     addr     procexits
       2 0040     00000000         0
       2 000c     00000000         0
       2 0008     00000000         0
       2 00c0     00000000         0

==> .comment
MagicWord: CodeWarrior
Comment section version: 8
Compiler version: 2.3.0
CW Compiler generated
Pooled data: true
PPC EABI compliant
FP Support: Hardware
Processor: Unknown CPU
