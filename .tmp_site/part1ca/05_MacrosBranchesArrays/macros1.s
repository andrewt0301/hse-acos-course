#
# Example demonstrating using macros.
#
   .macro print_int (%x)
   li a7, 1
   mv a0, %x
   ecall
   .end_macro

   .macro print_imm_int (%x)
   li a7, 1
   li a0, %x
   ecall
   .end_macro

   .macro newline
   li a7, 11
   li a0, '\n'
   ecall
   .end_macro

main:
    li t0, 123
    print_int (t0)
    newline
    print_imm_int (456789)
