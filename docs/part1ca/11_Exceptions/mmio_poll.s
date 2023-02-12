#
# Example: read a character from a keyboard and prints it to the display
#          by polling a MMIO device
  .text
  .eqv IN_CTRL  0xffff0000
  .eqv IN       0xffff0004
  .eqv OUT_CTRL 0xffff0008
  .eqv OUT      0xffff000C
main:
  li   s0, IN_CTRL
  li   s1, IN
  li   s2, OUT_CTRL
  li   s3, OUT

poll_in:
  lw   t0, 0(s0)
  beqz t0, poll_in
  lw   t0, 0(s1)

poll_out:
  lw   t1, 0(s2)
  beqz t1, poll_out
  sw   t0, 0(s3)

  j poll_in
