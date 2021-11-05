#ifndef __OS_H__
#define __OS_H__

#include "include/dolphin/types.h"

//void*   OSGetArenaHi( void );
//void*   OSGetArenaLo( void );
//void    OSSetArenaHi( void* newHi );
//void    OSSetArenaLo( void* newLo );
//
//void*   OSAllocFromArenaLo( u32 size, u32 align );
//void*   OSAllocFromArenaHi( u32 size, u32 align );
//
//#define OSRoundUp32B(x)       (((u32)(x) + 32 - 1) & ~(32 - 1))
//#define OSRoundDown32B(x)     (((u32)(x)) & ~(32 - 1))
//
//void    OSInit          ( void );
//
//#define OS_CONSOLE_RETAIL4          0x00000004
//#define OS_CONSOLE_RETAIL3          0x00000003
//#define OS_CONSOLE_RETAIL2          0x00000002
//#define OS_CONSOLE_RETAIL1          0x00000001
//#define OS_CONSOLE_DEVHW4           0x10000007
//#define OS_CONSOLE_DEVHW3           0x10000006
//#define OS_CONSOLE_DEVHW2           0x10000005
//#define OS_CONSOLE_DEVHW1           0x10000004
//#define OS_CONSOLE_MINNOW           0x10000003
//#define OS_CONSOLE_ARTHUR           0x10000002
//#define OS_CONSOLE_PC_EMULATOR      0x10000001
//#define OS_CONSOLE_EMULATOR         0x10000000
//#define OS_CONSOLE_DEVELOPMENT      0x10000000  // bit mask
//
//u32     OSGetConsoleType( void );
//
//#define OS_SOUND_MODE_MONO          0u
//#define OS_SOUND_MODE_STEREO        1u
//
//u32     OSGetSoundMode( void );
//void    OSSetSoundMode( u32 mode );
//
//#define OS_PROGRESSIVE_MODE_OFF     0u
//#define OS_PROGRESSIVE_MODE_ON      1u
//
//u32     OSGetProgressiveMode( void );
//void    OSSetProgressiveMode( u32 on );
//
//#define OS_LANG_ENGLISH         0u
//#define OS_LANG_GERMAN          1u
//#define OS_LANG_FRENCH          2u
//#define OS_LANG_SPANISH         3u
//#define OS_LANG_ITALIAN         4u
//#define OS_LANG_DUTCH           5u
//
//u8      OSGetLanguage( void );
//void    OSSetLanguage( u8 language );
//
//#define OS_EURGB60_OFF          0u
//#define OS_EURGB60_ON           1u
//
//u32     OSGetEuRgb60Mode( void );
//void    OSSetEuRgb60Mode( u32 on );
//
//BOOL    OSDisableInterrupts ( void );
//BOOL    OSEnableInterrupts  ( void );
//BOOL    OSRestoreInterrupts ( BOOL level );
//
//void* OSPhysicalToCached    ( u32   paddr  );
//void* OSPhysicalToUncached  ( u32   paddr  );
//u32   OSCachedToPhysical    ( void* caddr  );
//u32   OSUncachedToPhysical  ( void* ucaddr );
//void* OSCachedToUncached    ( void* caddr  );
//void* OSUncachedToCached    ( void* ucaddr );
//
//#define OS_CACHED_REGION_PREFIX         0x8000
//#define OS_UNCACHED_REGION_PREFIX       0xC000
//#define OS_PHYSICAL_MASK                0x3FFF
//
//#define OS_BASE_CACHED                  (OS_CACHED_REGION_PREFIX << 16)
//#define OS_BASE_UNCACHED                (OS_UNCACHED_REGION_PREFIX << 16)
//
//#ifndef _DEBUG
//#define OSPhysicalToCached(paddr)       ((void*) ((u32)(paddr) + OS_BASE_CACHED))
//#define OSPhysicalToUncached(paddr)     ((void*) ((u32)(paddr) + OS_BASE_UNCACHED))
//#define OSCachedToPhysical(caddr)       ((u32)   ((u8*)(caddr) - OS_BASE_CACHED))
//#define OSUncachedToPhysical(ucaddr)    ((u32)   ((u8*)(ucaddr)- OS_BASE_UNCACHED))
//#define OSCachedToUncached(caddr)       ((void*) ((u8*)(caddr) + (OS_BASE_UNCACHED - OS_BASE_CACHED)))
//#define OSUncachedToCached(ucaddr)      ((void*) ((u8*)(ucaddr)- (OS_BASE_UNCACHED - OS_BASE_CACHED)))
//#endif  // _DEBUG
//
//#define OSPhysicalToCached(paddr)       ((void*) (paddr))
//#define OSPhysicalToUncached(paddr)     ((void*) (paddr))
//#define OSCachedToPhysical(caddr)       ((u32)   (caddr))
//#define OSUncachedToPhysical(ucaddr)    ((u32)   (ucaddr))
//#define OSCachedToUncached(caddr)       ((void*) (caddr))
//#define OSUncachedToCached(ucaddr)      ((void*) (ucaddr))
//
//typedef s64         OSTime;
//typedef u32         OSTick;
//
//#define OS_TIMER_CLOCK      1000.0F
//
//#define OSTicksToCycles( ticks )        (((ticks) * ((OS_CORE_CLOCK * 2) / OS_TIMER_CLOCK)) / 2)
//#define OSTicksToSeconds( ticks )       ((ticks) / OS_TIMER_CLOCK)
//#define OSTicksToMilliseconds( ticks )  ((ticks) / (OS_TIMER_CLOCK / 1000))
//#define OSTicksToMicroseconds( ticks )  (((ticks) * 8) / (OS_TIMER_CLOCK / 125000))
//#define OSTicksToNanoseconds( ticks )   (((ticks) * 8000) / (OS_TIMER_CLOCK / 125000))
//#define OSSecondsToTicks( sec )         ((sec)  * OS_TIMER_CLOCK)
//#define OSMillisecondsToTicks( msec )   ((msec) * (OS_TIMER_CLOCK / 1000))
//#define OSMicrosecondsToTicks( usec )   (((usec) * (OS_TIMER_CLOCK / 125000)) / 8)
//#define OSNanosecondsToTicks( nsec )    (((nsec) * (OS_TIMER_CLOCK / 125000)) / 8000)
//
//#define OSDiffTick(tick1, tick0)        ((s32) (tick1) - (s32) (tick0))
//
//OSTick  OSGetTick( void );
//OSTime  OSGetTime( void );
//
//typedef struct OSCalendarTime
//{
//    int sec; 
//    int min; 
//    int hour;
//    int mday;
//    int mon; 
//    int year;
//    int wday;
//    int yday;
//
//    int msec;
//    int usec;
//} OSCalendarTime;
//
//OSTime OSCalendarTimeToTicks(OSCalendarTime* td);
//void   OSTicksToCalendarTime(OSTime ticks, OSCalendarTime* td);
//
//typedef struct OSStopwatch
//{
//    char*       name;   
//    OSTime      total;  
//    u32         hits;   
//    OSTime      min;    
//    OSTime      max;    
//
//    OSTime      last;   
//    BOOL        running;
//} OSStopwatch;
//
//
//void    OSInitStopwatch     ( OSStopwatch* sw, char* name );
//void    OSStartStopwatch    ( OSStopwatch* sw );
//void    OSStopStopwatch     ( OSStopwatch* sw );
//OSTime  OSCheckStopwatch    ( OSStopwatch* sw );
//void    OSResetStopwatch    ( OSStopwatch* sw );
//void    OSDumpStopwatch     ( OSStopwatch* sw );
//
//#define OSHalt(msg)             OSPanic(__FILE__, __LINE__, msg)
//
//void OSPanic ( char* file, int line, char* msg, ... );
//void OSReport( char* msg, ... );
//
//u32 OSGetPhysicalMemSize(void);
//u32 OSGetConsoleSimulatedMemSize(void);

#endif  // __OS_H__
