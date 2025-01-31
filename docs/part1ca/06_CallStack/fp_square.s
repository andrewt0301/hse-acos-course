# This program illustrates implementing this function
#
# int square(int num) {
#    return num * num;
# }
#
# in two styles:
# 1. Using frame pointer (-fno-omit-frame-pointer)
# 2. Without using frame pointer (-fomit-frame-pointer)
#
# Note: this code is not optimized and contains redundant reads and writes
#       of local variables.
#
    .text
    .include "macrolib.s"
main:
    mv s0, sp # Setting original FP
    read_int(s1)

    mv a0, s1
    jal ra, square_fp
    li a7, 1
    ecall
    newline

    mv a0, s1
    jal ra, square_no_fp
    li a7, 1
    ecall
    newline

    li a7, 10
    ecall

square_fp:
    addi    sp, sp, -16
    sw      s0, 8(sp)   # Saving old FP
    addi    s0, sp, 16  # Setting new FP
    sw      a0, -12(s0) # Offset will not change if we move sp
    lw      a0, -12(s0) # Offset will not change if we move sp
    mul     a0, a0, a0
    lw      s0, 8(sp)  # Restoring old FP
    addi    sp, sp, 16
    ret

square_no_fp:
    addi    sp, sp, -16
    sw      a0, 12(sp) # Offset will change if we move sp
    lw      a0, 12(sp) # Offset will change if we move sp
    mul     a0, a0, a0
    addi    sp, sp, 16
    ret
