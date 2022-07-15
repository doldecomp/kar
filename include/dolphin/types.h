#ifndef __TYPES_H__
#define __TYPES_H__

#ifdef x86

typedef __int8 s8;
typedef __int16 s16;
typedef __int32 s32;
typedef __int64 s64;
typedef unsigned __int8 u8;
typedef unsigned __int16 u16;
typedef unsigned __int32 u32;
typedef unsigned __int64 u64;

typedef volatile u8 vu8;
typedef volatile u16 vu16;
typedef volatile u32 vu32;
typedef volatile u64 vu64;
typedef volatile s8 vs8;
typedef volatile s16 vs16;
typedef volatile s32 vs32;
typedef volatile s64 vs64;

typedef float f32;
typedef double f64;
typedef volatile f32 vf32;
typedef volatile f64 vf64;

typedef int                 BOOL;

typedef unsigned int	size_t;
	
#else // dolphin

typedef signed char         s8;
typedef signed short        s16;
typedef signed long         s32;
typedef signed long long    s64;
typedef unsigned char       u8;
typedef unsigned short      u16;
typedef unsigned long       u32;
typedef unsigned long long  u64;

typedef volatile u8         vu8;
typedef volatile u16        vu16;
typedef volatile u32        vu32;
typedef volatile u64        vu64;
typedef volatile s8         vs8;
typedef volatile s16        vs16;
typedef volatile s32        vs32;
typedef volatile s64        vs64;

typedef float               f32;
typedef double              f64;
typedef volatile f32        vf32;
typedef volatile f64        vf64;

typedef int                 BOOL;

typedef unsigned long	size_t;

#endif // dolphin

#define TRUE 1
#define FALSE 0

#ifndef NULL
#ifdef __cplusplus
#define NULL 0
#else // __cplusplus
#define NULL ((void*)0)
#endif // __cplusplus
#endif // NULL

#define assert_line(line, cond)                                                \
    ((cond) ? ((void) 0) : __assert(__FILE__, line, #cond))

#endif // __TYPES_H__
