#
# Example that demonstrates adding a scalar to an array
# for a double-issue RISC-V CPU.
#
.data
array:
  .word 1,  2,  3,  4,  5,  6,  7,  8
  .word 9, 10, 11, 12, 13, 14, 15, 16
array_end:

.text
  la   s0, array_end
  addi s0, s0, -4
  la   s1, array
  li   t1, 5
Loop:
  lw   t0, 0(s0)    # t1=array element
  add  t0, t0, t1   # add scalar in t1
  sw   t0, 0(s0)    # store result
  addi s0, s0, -4   # decrement pointer
  bge  s0, s1, Loop # compare to loop limit

  li a7, 10
  ecall
