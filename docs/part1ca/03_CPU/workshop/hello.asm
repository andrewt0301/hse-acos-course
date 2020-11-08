#
# This is a "Hello, world!" program in RISC-V assembly.
#
    .data
hello:
    .string "Hello, world!"

    .text
main:
    li a7, 4
    la a0, hello
    ecall
