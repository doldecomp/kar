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
	$(BUILD_DIR)/asm/dobj.o							\
	$(BUILD_DIR)/asm/tobj.o							\
	$(BUILD_DIR)/asm/text_803F7CA0.o				\
	$(BUILD_DIR)/asm/tev.o							\
	$(BUILD_DIR)/asm/text_803F98BC.o				\
	$(BUILD_DIR)/asm/aobj.o							\
	$(BUILD_DIR)/asm/text_803FDACC.o				\
	$(BUILD_DIR)/asm/cobj.o							\
	$(BUILD_DIR)/asm/fobj.o							\
	$(BUILD_DIR)/src/sysdolphin/pobj.o				\
	$(BUILD_DIR)/asm/pobj.o							\
	$(BUILD_DIR)/asm/jobj.o							\
	$(BUILD_DIR)/asm/text_8040E360.o				\
	$(BUILD_DIR)/asm/initialize.o					\
	$(BUILD_DIR)/asm/video.o						\
	$(BUILD_DIR)/asm/text_80411CAC.o				\
	$(BUILD_DIR)/asm/controller.o					\
	$(BUILD_DIR)/asm/rumble.o						\
	$(BUILD_DIR)/asm/spline.o						\
	$(BUILD_DIR)/asm/text_804159A0.o				\
	$(BUILD_DIR)/asm/mtx.o							\
	$(BUILD_DIR)/asm/util.o							\
	$(BUILD_DIR)/asm/objalloc.o						\
	$(BUILD_DIR)/asm/robj.o							\
	$(BUILD_DIR)/asm/id.o							\
	$(BUILD_DIR)/asm/wobj.o							\
	$(BUILD_DIR)/asm/fog.o							\
	$(BUILD_DIR)/asm/pref.o							\
	$(BUILD_DIR)/asm/list.o							\
	$(BUILD_DIR)/asm/object.o						\
	$(BUILD_DIR)/asm/text_8041BF1C.o				\
	$(BUILD_DIR)/asm/memory.o						\
	$(BUILD_DIR)/asm/text_8041CF1C.o				\
	$(BUILD_DIR)/asm/archive.o						\
	$(BUILD_DIR)/asm/text_8041E434.o				\
	$(BUILD_DIR)/asm/random.o						\
	$(BUILD_DIR)/asm/bytecode.o						\
	$(BUILD_DIR)/asm/text_8041FC98.o				\
	$(BUILD_DIR)/asm/class.o						\
	$(BUILD_DIR)/asm/text_804212F4.o				\
	$(BUILD_DIR)/asm/hash.o							\
	$(BUILD_DIR)/asm/texp.o							\
	$(BUILD_DIR)/asm/texpdag.o						\
	$(BUILD_DIR)/asm/debug.o						\
	$(BUILD_DIR)/asm/text_804285AC.o				\

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
