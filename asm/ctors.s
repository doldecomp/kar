.section .ctors, "wa"  # 0x80489440 - 0x80489460
.global lbl_80489440
lbl_80489440:
    .4byte __init_cpp_exceptions
    .4byte func_80383978
    .4byte func_8038814C
    .4byte 0
