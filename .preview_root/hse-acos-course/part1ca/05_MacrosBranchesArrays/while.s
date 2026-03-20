# Example:
#
# ﻿while((t0 = read_int()) != 0) {
#    print_int(t0)
#    print_char('\n')
# }
while:
   li   a7, 5
   ecall
   mv   t0, a0
   beqz a0, end_while
   li   a7, 1
   ecall
   li   a7, 11
   li   a0, '\n'
   ecall
   j    while
end_while:
