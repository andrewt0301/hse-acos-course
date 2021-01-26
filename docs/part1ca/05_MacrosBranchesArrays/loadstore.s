# Example:
#
# x, y, z are stored in memory.
#
# x = read_int()
# y = read_int()
# z = x + y
   .include "macrolib.s"
   .data
x:
   .word 0
y:
   .word 0
z:
   .word 0
   .text
main:
    read_int(t0)
    la  t2, x
    sw  t0, 0(t2)

    read_int(t0)
    la  t2, y
    sw  t0, 0(t2)

    la  t2, x
    lw  t0, 0(t2)
    la  t2, y
    lw  t1, 0(t2)
    add t3, t0, t1
    la  t2, z
    sw  t3, 0(t2)
