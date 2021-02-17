#
# Example: read a character from a keyboard and prints it to the diaplay
#          by handling interrupts that come from a MMIO device.
  .text
  .eqv CONTROL   0xffff0000
  .eqv KEYBOARD  0xffff0004
  .eqv DISPLAY   0xffff000C
  j main
handler:
  lw t0, 0(s1)
  sw t0, 0(s2)
  uret
main:
  la       t0, handler
  csrrw  zero, utvec, t0  # set utvec to the handlers address
  csrrsi zero, ustatus, 1 # set interrupt enable bit in ustatus
  li       t0, 257
  csrrw  zero, uie, t0    # enable handling of the specific interrupt

  li s0, CONTROL
  li s1, KEYBOARD
  li s2, DISPLAY
  li t0, 2
  sw t0, 0(s0)  # set interrupt flag in the device
loop:
  wfi
  j loop
