# Example:
#
# int leaf_example (int g, int h,int i, int j) {
#  int f = (g + h) - (i + j);
#  return f;
# }
# Requirements:
#﻿ - arguments g, ..., j in a0(x10)...a3(x13)
# - f in s4 (x20)
# - temporaries t0(x5), t1(x6)
# - need to save t0, t1, s4 on stack
    .text
    .include "macrolib.s"
main:
    read_int(t0) # read g
    read_int(t1) # read h
    read_int(t2) # read i
    read_int(t3) # read j

    mv a0, t0
    mv a1, t1
    mv a2, t2
    mv a3, t3

    jal ra, leaf_example
    mv  t4, a0

    print_int(t0)
    print_char(' ')
    print_int(t1)
    print_char(' ')
    print_int(t2)
    print_char(' ')
    print_int(t3)
    print_char(' ')
    print_int(t4)

    # system call to terminate execution here
    li a7, 10
    ecall

leaf_example:
    addi sp, sp, -12
    sw   t0, 8(sp)
    sw   t1, 4(sp)
    sw   s4, 0(sp)
    add  t0, a0, a1
    add  t1, a2, a3
    sub  s4, t0, t1
    mv   a0, s4
    lw   s4, 0(sp)
    lw   t1, 4(sp)
    lw   t0, 8(sp)
    addi sp, sp, 12
    jalr x0, 0(x1)
