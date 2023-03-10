#
# Example: read a character from a keyboard and prints it to the diaplay
#          by handling interrupts that come from a MMIO device.
  .data
buffer:
  .space 32
  .text
  .eqv IN_CTRL  0xffff0000
  .eqv IN       0xffff0004
  .eqv OUT_CTRL 0xffff0008
  .eqv OUT      0xffff000C
  j main

handler:
  lw   t1, 0(s0)
  andi t1, t1, 0x1
  beqz t1, handler_out

  lw   t0, 0(s1)
  sw   t0, 0(s4)
  addi s4, s4, 4

handler_out:
  lw   t2, 0(s2)
  andi t2, t2, 0x1
  beqz t2, handler_ret

  la   t0, buffer
  beq  s4, t0, handler_ret

  addi s4, s4, -4
  lw   t0, 0(s4)
  sw   t0, 0(s3)

handler_ret:
  uret

main:
  la       t0, handler
  csrrw  zero, utvec, t0  # set utvec to the handlers address
  csrrsi zero, ustatus, 1 # set interrupt enable bit in ustatus
  li       t0, 257
  csrrw  zero, uie, t0    # enable handling of the specific interrupt

  li s0, IN_CTRL
  li s1, IN
  li s2, OUT_CTRL
  li s3, OUT
  la s4, buffer

  li t0, 2
  sw t0, 0(s0)  # set interrupt flag in the IN device.
  sw t0, 0(s2)  # set interrupt flag in the OUT device.
loop:
  wfi
  j loop
