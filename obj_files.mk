# Linker order for every file, passed to the Metrowerks linker.

INIT_O_FILES := 						            \
    $(BUILD_DIR)/asm/init.o							\

EXTAB_O_FILES :=                                    \
    $(BUILD_DIR)/asm/_extab.o						\

EXTABINDEX_O_FILES :=                               \
    $(BUILD_DIR)/asm/_exidx.o						\

TEXT_O_FILES := 						            \
	$(BUILD_DIR)/asm/gmmain.o						\
	$(BUILD_DIR)/asm/gmglobal.o						\
	$(BUILD_DIR)/asm/text1.o						\
	$(BUILD_DIR)/asm/text2.o						\
	$(BUILD_DIR)/asm/text3.o						\
	$(BUILD_DIR)/asm/text4.o						\
	$(BUILD_DIR)/asm/text5.o						\
	$(BUILD_DIR)/asm/text6.o						\
	$(BUILD_DIR)/asm/text7.o						\
	$(BUILD_DIR)/asm/__va_arg.o						\
	$(BUILD_DIR)/asm/text7-1.o						\
	$(BUILD_DIR)/asm/abort_exit.o					\
	$(BUILD_DIR)/asm/text7-1.1.o					\
	$(BUILD_DIR)/asm/cstring.o						\
	$(BUILD_DIR)/asm/text7-2.o						\
	$(BUILD_DIR)/asm/dolphin_sdk_1.o				\
	$(BUILD_DIR)/asm/__ppc_eabi_init.o				\
	$(BUILD_DIR)/asm/dolphin_sdk_2.o				\
	$(BUILD_DIR)/asm/text7-2.1.o					\
	$(BUILD_DIR)/asm/text8.o						\
													\

CTORS_O_FILES :=                                    \
	$(BUILD_DIR)/asm/ctors.o						\

DTORS_O_FILES :=                                    \
	$(BUILD_DIR)/asm/dtors.o						\

RODATA_O_FILES :=                                   \
	$(BUILD_DIR)/asm/rodata.o						\

DATA_O_FILES :=                                     \
	$(BUILD_DIR)/asm/data.o							\

BSS_O_FILES :=                                      \
	$(BUILD_DIR)/asm/bss.o							\

SDATA_O_FILES :=                                    \
	$(BUILD_DIR)/asm/sdata.o						\

SBSS_O_FILES :=										\
	$(BUILD_DIR)/asm/sbss.o							\

SDATA2_O_FILES :=                                   \
	$(BUILD_DIR)/asm/sdata2.o						\
	
SBSS2_O_FILES :=									\
	$(BUILD_DIR)/asm/sbss2.o						\
