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
	$(BUILD_DIR)/asm/text_80007808.o				\
	$(BUILD_DIR)/asm/text_80010BBC.o				\
	$(BUILD_DIR)/asm/text_80060ED0.o				\
	$(BUILD_DIR)/asm/text_801166B4.o				\
	$(BUILD_DIR)/asm/text_801D443C.o				\
	$(BUILD_DIR)/asm/text_8028B974.o				\
	$(BUILD_DIR)/asm/text_8034D384.o				\
	$(BUILD_DIR)/asm/__va_arg.o						\
	$(BUILD_DIR)/asm/text_803AD168.o				\
	$(BUILD_DIR)/asm/abort_exit.o					\
	$(BUILD_DIR)/asm/text_803AFAC8.o				\
	$(BUILD_DIR)/asm/cstring.o						\
	$(BUILD_DIR)/asm/text_803B4AC0.o				\
	$(BUILD_DIR)/asm/dolphin_sdk_1.o				\
	$(BUILD_DIR)/asm/__ppc_eabi_init.o				\
	$(BUILD_DIR)/asm/dolphin_sdk_2.o				\
	$(BUILD_DIR)/asm/text_803EC02C.o				\
	$(BUILD_DIR)/asm/cobj.o							\
	$(BUILD_DIR)/asm/fobj.o							\
	$(BUILD_DIR)/asm/text_8040531C.o				\
	$(BUILD_DIR)/asm/text_8041B450.o				\

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
