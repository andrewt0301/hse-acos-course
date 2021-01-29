#
# Example: function that finds the minimum and maximum values in an array.
#
    .include "macrolib.s"
    .text
main:
    li   t1, 0 # item count
read_next:
    read_int(t0)
    beqz t0, call_min_max
    addi sp, sp, -4
    sw   t0, 0(sp)
    addi t1, t1, 1
    b    read_next

call_min_max:
    mv   a0, sp
    mv   a1, t1
    addi sp, sp, -4
    sw   t1, 0(sp)
    jal  min_max
    mv   t2, a0
    mv   t3, a1

    print_str("min=")
    print_int(t2)
    print_str(", max=")
    print_int(t3)

    lw   t1, 0(sp)
    addi sp, sp, 4
    slli t1, t1, 2
    add  sp, sp, t1
exit:
    li   a7, 10
    ecall

min_max:
    mv   t0, zero # min
    mv   t1, zero # max
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
