.section .dtors  # 0x80489460 - 0x80489480
.global lbl_80489460
lbl_80489460:
    .4byte __destroy_global_chain
    .4byte __fini_cpp_exceptions
    .4byte __destroy_global_chain
    .4byte 0
