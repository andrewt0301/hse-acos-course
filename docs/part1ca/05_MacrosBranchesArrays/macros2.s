    .include "macrolib.s"
main:
    print_str("Please enter an integer number:")
    newline
    read_int  (t0)
    print_str("Your number is:")
    newline
    print_int (t0)
