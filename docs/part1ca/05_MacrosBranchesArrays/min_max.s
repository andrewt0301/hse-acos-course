#
# Example: find the minimum and maximum values in a memory array.
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

    lw t2, (t0)
    mv s0, t2 # min = data[0]
    mv s1, t2 # max = data[0]

loop:
    addi t0, t0, 4
    beq  t0, t1, done
    lw   t2, (t0)

test_min:
    bge  t2, s0, test_max
    mv   s0, t2
    b    loop

test_max:
    ble  t2, s1, loop
    mv   s1, t2
    b    loop

done:
   print_str("min=")
   print_int(s0)
   print_str(", max=")
   print_int(s1)
