ifneq ($(findstring MINGW,$(shell uname)),)
  WINDOWS := 1
endif
ifneq ($(findstring MSYS,$(shell uname)),)
  WINDOWS := 1
endif

VERBOSE ?= 0

ifeq ($(VERBOSE),0)
  QUIET := @
endif

#-------------------------------------------------------------------------------
# Files
#-------------------------------------------------------------------------------

NAME := kar
#VERSION := us
VERSION := kor
#VERSION := us.demo
#VERSION := jp.demo
#VERSION := eu.demo
#VERSION := kor.demo

BUILD_DIR := build/$(NAME).$(VERSION)

SRC_DIRS := src src/sysdolphin src/os src/dolphin/os src/dolphin/dsp
ASM_DIRS := asm asm/runtime asm/runtime/ asm/Runtime.PPCEABI.H asm/sysdolphin		\
			asm/dolphin asm/MetroTRK asm/init asm/a2d asm/os asm/TRK_MINNOW_DOLPHIN	\
			asm/pad

# Inputs
S_FILES := $(wildcard asm/*.s)
C_FILES := $(wildcard src/*.c)
CPP_FILES := $(wildcard src/*.cpp)
LDSCRIPT := ldscript.lcf

# Outputs
DOL     := $(BUILD_DIR)/main.dol
ELF     := $(DOL:.dol=.elf)
MAP     := $(BUILD_DIR)/kar.map

include obj_files.mk

O_FILES := $(SBSS_O_FILES) $(INIT_O_FILES) $(EXTAB_O_FILES) $(EXTABINDEX_O_FILES) $(TEXT_O_FILES) \
           $(CTORS_O_FILES) $(DTORS_O_FILES) \
           $(BSS_O_FILES) $(SDATA_O_FILES)

#-------------------------------------------------------------------------------
# Tools
#-------------------------------------------------------------------------------

MWCC_VERSION := 1.3.2
MWLD_VERSION := 1.1

# Programs
ifeq ($(WINDOWS),1)
  WINE :=
  PYTHON  := python
else
  WINE ?= wine
  PYTHON  := python3
endif
AS      := $(DEVKITPPC)/bin/powerpc-eabi-as
CPP     := cpp -P
CC      := $(WINE) tools/mwcc_compiler/$(MWCC_VERSION)/mwcceppc.exe
CC10    := $(WINE) tools/mwcc_compiler/1.0/mwcceppc.exe
LD      := $(WINE) tools/mwcc_compiler/$(MWLD_VERSION)/mwldeppc.exe
ELF2DOL := tools/elf2dol
SHA1SUM := sha1sum

POSTPROC := tools/postprocess.py

# Options
INCLUDES := -I- -i include/ -i src/

ASFLAGS := -mgekko -I include/ 
LDFLAGS := -fp hard -nodefaults
ifeq ($(GENERATE_MAP),1)
  LDFLAGS += -map $(MAP)
endif
CFLAGS  := -cwd source -Cpp_exceptions off -proc gekko -fp hard -O4,p -nodefaults $(INCLUDES) -inline all

ifeq ($(VERBOSE),0)
# this set of ASFLAGS generates no warnings.
ASFLAGS += -W
endif

#-------------------------------------------------------------------------------
# Recipes
#-------------------------------------------------------------------------------

### Default target ###

default: all

all: $(DOL)
	$(QUIET) $(SHA1SUM) -c sha1/$(NAME).$(VERSION).sha1
ifeq ($(GENERATE_MAP),1)
	$(QUIET) $(PYTHON) calcprogress.py $(DOL)
endif

ALL_DIRS := build $(BUILD_DIR) $(addprefix $(BUILD_DIR)/,$(SRC_DIRS) $(ASM_DIRS))

# Make sure build directory exists before compiling anything
DUMMY != mkdir -p $(ALL_DIRS)

.PHONY: tools

$(DOL): $(ELF) tools
	@echo Converting $< to $@
	$(QUIET) $(ELF2DOL) $< $@

clean:
	rm -f -d -r build
	$(MAKE) -C tools clean

tools:
	$(MAKE) -C tools

$(ELF): $(O_FILES) $(LDSCRIPT)
	@echo Linking ELF $@
	@echo $(O_FILES) > build/o_files
	$(QUIET) $(LD) $(LDFLAGS) -o $@ -lcf $(LDSCRIPT) @build/o_files

$(BUILD_DIR)/%.o: %.s
	@echo Assembling $<
	$(QUIET) $(AS) $(ASFLAGS) -o $@ $<

$(BUILD_DIR)/src/os/__start.o: CC := $(CC10)

$(BUILD_DIR)/%.o: %.c
	@echo Compiling $<
	$(QUIET) $(CC) $(CFLAGS) -c -o $@ $<
	$(QUIET) $(PYTHON) $(POSTPROC) $(PROCFLAGS) $@

### Debug Print ###

print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
