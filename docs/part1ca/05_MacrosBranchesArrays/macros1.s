   .macro print_hex (%x)
   li a7, 34
   mv a0, %x
   ecall
   .end_macro

   .macro print_imm_hex (%x)
   li a7, 34
   li a0, %x
   ecall
   .end_macro

   .macro newline
   li a7, 11
   li a0, '\n'
   ecall
   .end_macro

main:
    li t0, 0x123
    print_hex (t0)
    newline
    print_imm_hex (0xDEADBEEF)
