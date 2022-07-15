//void __check_pad3(void);
//void OSResetSystem(int, int, int);
//void main(int);
//void exit(int);
//void __init_user(void);
//void InitMetroTRK_BBA(void);
//void OSInit(void);
//void DBInit(void);
//void __init_data(void);
//#pragma once
//
//#pragma section code_type ".init"
//
//typedef unsigned long size_t;
//
//void memset(void * dst, int val, size_t n);
//void __fill_mem(void * dst, int val, unsigned long n);
//void memcpy(void * dst, const void * src, size_t n);
//void TRK_memset(void * dest, int val, size_t count);
//void TRK_memcpy(void* dst, void* src, size_t len);
//void __check_pad3(void);
//void __set_debug_bba(void);
//void __get_debug_bba(void);
//void __start(void);
//void __init_registers(void);
//void __init_data(void);
//void __init_hardware(void);
//void __flush_cache(void *dst, unsigned long size);
//
//#pragma section code_type ".text"
//
//void Pad_InitCallback();

void _OSReport(const char*, ...);
