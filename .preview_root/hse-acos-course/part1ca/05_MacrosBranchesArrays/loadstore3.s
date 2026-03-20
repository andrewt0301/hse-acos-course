# Example (uses pseudo instructions):
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
    sw  t0, x, t2

    read_int(t0)
    sw  t0, y, t2

    lw  t0, x
    lw  t1, y
    add t3, t0, t1
    sw  t3, z, t2
