# Example:
#
# x, y, z are stored in memory.
#
# x = read_int()
# y = read_int()
# z = x + y
   .include "macrolib.s"
   .data
data:
   .word 0, 0, 0
   .text
main:
    la  t2, data

    read_int(t0)
    sw  t0, 0(t2)

    read_int(t0)
    sw  t0, 4(t2)

    lw  t0, 0(t2)
    lw  t1, 4(t2)
    add t3, t0, t1
    sw  t3, 8(t2)
