#
# Ackermann' three-argument function.
#

# int alpha(int a, int n) {
#   if (n == 0)
#       return 0;
#   else if (n == 1)
#       return 1;
#   else
#       return a;
# }
#
# int ack(int a, int b, int n) {
#     if (n == 0)
#         return a + b;
#     else if (b == 0)
#         return alpha(a, n - 1);
#     else
#        return ack(a, ack(a, b-1, n), n-1);
# }

.text

.macro read_int(%x)
    li a7, 5
    ecall
    mv %x, a0
.end_macro

main:
    # Read a
    read_int(t0)
    # Read b
    read_int(a1)
    # Read n
    read_int(a2)
    # ack(a, b, n)
    mv a0, t0
    jal ra, ack
    # Print result
    li a7, 1
    ecall
    # Exit
    li a7, 10
    ecall

# a -> a0
# b -> a1
# n -> a2
# return -> a0
ack:
    bne  a2, zero, ack_alpha
    # return a + b
    add  a0, a0, a1
    jalr zero, 0(ra)
ack_alpha:
    addi sp, sp, -4
    sw   ra, 0(sp)
    bne  a1, zero, ack_ack
    # return alpha(a, n - 1)
    addi a1, a2, -1
    jal  ra, alpha
    lw   ra, 0(sp)
    addi sp, sp, 4
    jalr zero, 0(ra)
ack_ack:
    # save a(a0) and n(a2)
    addi sp, sp, -8
    sw   a0, 0(sp)
    sw   a2, 4(sp)
    # temp = ack(a, b-1, n)
    addi a1, a1, -1
    jal ra, ack

    # res = ack(a, temp, n-1)
    mv   a1, a0
    lw   a0, 0(sp)
    lw   a2, 4(sp)
    addi a2, a2, -1
    jal ra, ack
    addi sp, sp, 8

    lw   ra, 0(sp)
    addi sp, sp, 4
    jalr zero, 0(ra)

# a -> a0
# n -> a1
# return -> a0
alpha:
    # n == 0
    beq a1, zero, alpha_ret_n
    li t0, 1
    # n == 1
    beq a1, t0, alpha_ret_n
    # return a
    jalr zero, 0(ra)
alpha_ret_n:
    # return n
    mv a0, a1
    jalr zero, 0(ra)
