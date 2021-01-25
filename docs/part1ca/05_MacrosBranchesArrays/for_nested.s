# Example:
#
# ﻿for (t0 = 0; t0 < s0; ++t0) {
#   for (t1 = 0; t0 < s1; ++t1) {
#     print_int(t0)
#     print_char(':')
#     print_int(t1)
#     print_int(' ')
#   }
#   print_char('\n')
# }
   .include "macrolib.s"
main:
    read_int(s0)
    read_int(s1)
    mv t0, zero
next_t0:
    beq t0, s0, end_for_t0
    mv  t1, zero
next_t1:
   beq t1, s1, end_for_t1
   print_int(t0)
   print_char(':')
   print_int(t1)
   print_char(' ')
   addi t1, t1, 1
   b    next_t1
end_for_t1:
   print_char('\n')
   addi t0, t0, 1
   b    next_t0
end_for_t0:
