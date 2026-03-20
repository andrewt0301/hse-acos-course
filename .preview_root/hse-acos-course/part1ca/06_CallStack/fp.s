    .text
    .include "macrolib.s"
main:
    mv  fp, sp
    jal ra, func

    li a7, 10
    ecall

func:
    addi sp, sp, -4
    li   t0, 1
    sw   t0, 0(sp)

    addi sp, sp, -4
    li   t0, 2
    sw   t0, 0(sp)

    addi sp, sp, -4
    li   t0, 3
    sw   t0, 0(sp)

    lw   t0, 0(fp)
    print_int(t0)
    lw   t0, -4(fp)
    print_int(t0)
    lw   t0, -8(fp)
    print_int(t0)

    addi sp, sp, 12
    jalr zero, 0(ra)
