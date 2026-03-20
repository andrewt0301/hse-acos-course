#
# Example: reads temperature in Fahrenheit, converts it
#          to Celsius, and prints.
#
    .data
consts:
    .float 5.0f
    .float 9.0f
    .float 32.0f

    .text
main:
    li     a7, 6         # read float (into fa0)
    ecall

    jal    ra, f2c       # fa0 = f2c(fa0) 

    li     a7, 2         # print float (from fa0)
    ecall
    li     a7, 10        # exit
    ecall

    # float f2c(float fahr) {
    # return ((5.0/9.0)*(fahr - 32.0));
    # }
f2c:
    la     t0, consts
    flw    ft0, 0(t0)    # ft0 = 5.0f
    flw    ft1, 4(t0)    # ft1 = 9.0f
    fdiv.s ft0, ft0, ft1 # ft0 = 5.0f / 9.0f
    flw    ft1, 8(t0)    # ft1 = 32.0f
    fsub.s fa0, fa0, ft1 # fa0 = fahr - 32.0
    fmul.s f10, f0, f10  # fa0 = (5.0f / 9.0f) * (fahr - 32.0f)
    jalr   zero,0(ra)    # return
