#
# Example: function that finds the minimum and maximum values in an array.
#
     .include "macrolib.s"
     .data
data_start:
     .word 11,  2, -1,  5
     .word  3, 10,  7, -3
     .word -5,  4,  0,  9
data_end:

    .text
main:
    la t0, data_start
    la t1, data_end

    mv   a0, t0
    sub  a1, t1, t0
    srli a1, a1, 2
    jal min_max
    mv   t2, a0
    mv   t3, a1

    print_str("min=")
    print_int(t2)
    print_str(", max=")
    print_int(t3)
exit:
    li a7, 10
    ecall

min_max:
    li   t0, 0 # min
    li   t1, 0 # max
min_max_loop:
    blez a1, min_max_return
    lw   t2, (a0)
    addi a0, a0, 4
    addi a1, a1, -1
test_min:
    bge  t2, t0, test_max
    mv   t0, t2
    b    min_max_loop
test_max:
    ble  t2, t1, min_max_loop
    mv   t1, t2
    b    min_max_loop
min_max_return:
    mv   a0, t0
    mv   a1, t1
    jr   ra
