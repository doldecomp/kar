# Linker order for every file, passed to the Metrowerks linker.

SBSS_O_FILES :=\
	$(BUILD_DIR)/asm/sbss.o\

INIT_O_FILES :=\
	$(BUILD_DIR)/asm/Runtime.PPCEABI.H/__mem.o\
	$(BUILD_DIR)/asm/TRK_MINNOW_DOLPHIN/mem_TRK.o\
	$(BUILD_DIR)/asm/TRK_MINNOW_DOLPHIN/__exception.o\
	$(BUILD_DIR)/src/os/__start.o\
	$(BUILD_DIR)/asm/os/__ppc_eabi_init.o\

EXTAB_O_FILES :=\
	$(BUILD_DIR)/asm/_extab.o\

EXTABINDEX_O_FILES :=\
	$(BUILD_DIR)/asm/_exidx.o\

TEXT_O_FILES :=\
	$(BUILD_DIR)/asm/gmmain.o\
	$(BUILD_DIR)/asm/gmglobal.o\
	$(BUILD_DIR)/asm/gmautodemo.o\
	$(BUILD_DIR)/asm/text_80010BBC.o\
	$(BUILD_DIR)/asm/text_80060ED0.o\
	$(BUILD_DIR)/asm/grcity1.o\
	$(BUILD_DIR)/asm/text_8010F854.o\
	$(BUILD_DIR)/asm/text_801166B4.o\
	$(BUILD_DIR)/asm/text_801D443C.o\
	$(BUILD_DIR)/asm/a2d/a2d_game_lib.o\
	$(BUILD_DIR)/asm/text_8028B974.o\
	$(BUILD_DIR)/asm/a2d/a2d_gamehistory.o\
	$(BUILD_DIR)/asm/a2d/a2d_gamesession.o\
	$(BUILD_DIR)/asm/a2d/a2d_cpu_kirby.o\
	$(BUILD_DIR)/asm/a2d/a2d_kirbyjointanim.o\
	$(BUILD_DIR)/asm/a2d/a2d_lavabomb.o\
	$(BUILD_DIR)/asm/a2d/a2d_grindrail.o\
	$(BUILD_DIR)/asm/a2d/a2d_bg3000.o\
	$(BUILD_DIR)/asm/a2d/a2d_bg4000.o\
	$(BUILD_DIR)/asm/a2d/a2d_bg5000.o\
	$(BUILD_DIR)/asm/a2d/a2d_bg8000.o\
	$(BUILD_DIR)/asm/text_8034D384.o\
	$(BUILD_DIR)/asm/a2d/a2d_kurakko.o\
	$(BUILD_DIR)/asm/a2d/a2d_game_audio.o\
	$(BUILD_DIR)/asm/a2d/a2d_soundhandle.o\
	$(BUILD_DIR)/asm/a2d/a2d_game_effect.o\
	$(BUILD_DIR)/asm/a2d/a2d_effecthandle.o\
	$(BUILD_DIR)/asm/a2d/a2d_wipeeffect.o\
	$(BUILD_DIR)/asm/a2d/a2d_effect_slideblur.o\
	$(BUILD_DIR)/asm/a2d/a2d_kirbydisp.o\
	$(BUILD_DIR)/asm/a2d/a2d_refract.o\
	$(BUILD_DIR)/asm/a2d/fl_indirectload.o\
	$(BUILD_DIR)/asm/runtime/__va_arg.o\
	$(BUILD_DIR)/asm/runtime/global_destructor_chain.o\
	$(BUILD_DIR)/asm/runtime/NMWException.o\
	$(BUILD_DIR)/asm/runtime/MWRTTI.o\
	$(BUILD_DIR)/asm/runtime/runtime.o\
	$(BUILD_DIR)/asm/runtime/__init_cpp_exceptions.o\
	$(BUILD_DIR)/asm/runtime/Gecko_ExceptionPPC.o\
	$(BUILD_DIR)/asm/runtime/GCN_mem_alloc.o\
	$(BUILD_DIR)/asm/abort_exit.o\
	$(BUILD_DIR)/asm/text_803AFAC8.o\
	$(BUILD_DIR)/asm/cstring.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_other.o\
	$(BUILD_DIR)/asm/MetroTRK/TRK_MINNOW_DOLPHIN.o\
	$(BUILD_DIR)/asm/PPCArch.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_db.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_dsp.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_dvd.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_gx.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_mtx.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_mtxvec.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_mtx44.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_vec.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_os.o\
	$(BUILD_DIR)/asm/init/__ppc_eabi_init.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_pad.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_vi.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_ai.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_ar.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_arq.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_card.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_si.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_exi.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_ax.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_mix.o\
	$(BUILD_DIR)/asm/dolphin/dolphin_sdk_synth.o\
	$(BUILD_DIR)/asm/sysdolphin/dobj.o\
	$(BUILD_DIR)/asm/sysdolphin/tobj.o\
	$(BUILD_DIR)/asm/sysdolphin/tev.o\
	$(BUILD_DIR)/asm/sysdolphin/mobj.o\
	$(BUILD_DIR)/asm/sysdolphin/aobj.o\
	$(BUILD_DIR)/asm/sysdolphin/lobj.o\
	$(BUILD_DIR)/asm/sysdolphin/cobj.o\
	$(BUILD_DIR)/asm/sysdolphin/fobj.o\
	$(BUILD_DIR)/src/sysdolphin/pobj.o\
	$(BUILD_DIR)/asm/sysdolphin/pobj.o\
	$(BUILD_DIR)/asm/sysdolphin/jobj.o\
	$(BUILD_DIR)/asm/sysdolphin/displayfunc.o\
	$(BUILD_DIR)/asm/sysdolphin/initialize.o\
	$(BUILD_DIR)/asm/sysdolphin/video.o\
	$(BUILD_DIR)/asm/sysdolphin/controller.o\
	$(BUILD_DIR)/asm/sysdolphin/rumble.o\
	$(BUILD_DIR)/asm/sysdolphin/spline.o\
	$(BUILD_DIR)/asm/sysdolphin/mtx.o\
	$(BUILD_DIR)/asm/sysdolphin/util.o\
	$(BUILD_DIR)/asm/sysdolphin/objalloc.o\
	$(BUILD_DIR)/asm/sysdolphin/robj.o\
	$(BUILD_DIR)/asm/sysdolphin/id.o\
	$(BUILD_DIR)/src/sysdolphin/wobj.o\
	$(BUILD_DIR)/asm/sysdolphin/wobj.o\
	$(BUILD_DIR)/asm/sysdolphin/fog.o\
	$(BUILD_DIR)/asm/sysdolphin/pref.o\
	$(BUILD_DIR)/src/sysdolphin/list.o\
	$(BUILD_DIR)/asm/sysdolphin/list.o\
	$(BUILD_DIR)/asm/sysdolphin/object.o\
	$(BUILD_DIR)/asm/sysdolphin/memory.o\
	$(BUILD_DIR)/asm/sysdolphin/shadow.o\
	$(BUILD_DIR)/src/sysdolphin/archive.o\
	$(BUILD_DIR)/asm/sysdolphin/archive.o\
	$(BUILD_DIR)/asm/sysdolphin/random.o\
	$(BUILD_DIR)/asm/sysdolphin/bytecode.o\
	$(BUILD_DIR)/asm/sysdolphin/class.o\
	$(BUILD_DIR)/asm/sysdolphin/hash.o\
	$(BUILD_DIR)/asm/sysdolphin/texp.o\
	$(BUILD_DIR)/asm/sysdolphin/texpdag.o\
	$(BUILD_DIR)/asm/sysdolphin/debug.o\
	$(BUILD_DIR)/asm/text_804285AC.o\
	$(BUILD_DIR)/asm/IPSocket.o\
	$(BUILD_DIR)/asm/text_8047DB6C.o\
	$(BUILD_DIR)/asm/IPIgmp.o\
	$(BUILD_DIR)/asm/text_80482598.o\

CTORS_O_FILES :=\
	$(BUILD_DIR)/asm/ctors.o\

DTORS_O_FILES :=\
	$(BUILD_DIR)/asm/dtors.o\

RODATA_O_FILES :=\
	$(BUILD_DIR)/asm/rodata.o\

DATA_O_FILES :=\
	$(BUILD_DIR)/asm/data.o\

BSS_O_FILES :=\
	$(BUILD_DIR)/asm/bss.o\

SDATA_O_FILES :=\
	$(BUILD_DIR)/asm/sdata.o\

SBSS_O_FILES_1 :=\
	$(BUILD_DIR)/asm/sbss_1.o\

SDATA2_O_FILES :=\
	$(BUILD_DIR)/asm/sdata2.o\

SBSS2_O_FILES :=\
	$(BUILD_DIR)/asm/sbss2.o\
