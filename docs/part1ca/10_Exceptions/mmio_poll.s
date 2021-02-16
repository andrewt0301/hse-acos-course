#
# Example: read a character from a keyboard and prints it to the diaplay
#          by polling a MMIO device
  .text
  .eqv CONTROL  0xffff0000
  .eqv KEYBOARD 0xffff0004
  .eqv DISPLAY  0xffff000C
main:
  li s0, CONTROL
  li s1, KEYBOARD
  li s2, DISPLAY
poll_char:
  lw t0, 0(s0)
  beqz t0, poll_char
  lw t0, 0(s1)
  sw t0, 0(s2)
  j main
