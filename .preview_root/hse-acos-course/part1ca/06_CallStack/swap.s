#
# Example: function what swaps two values passed to in the stack.
#
    .include "macrolib.s"
main:
    read_int (t0)
    read_int (t1)

    addi sp, sp, -8
    sw   t0, 4(sp)
    sw   t1, 0(sp)
    mv   fp, sp

    jal swap

    lw   t1, 0(sp)
    lw   t0, 4(sp)
    addi sp, sp, 8

    print_int (t0)
    print_char('\n')
    print_int (t1)

    li a7, 10
    ecall

swap:
    lw   t1, 0(fp)
    lw   t0, 4(fp)
    sw   t1, 4(fp)
    sw   t0, 0(fp)
    jr   ra
