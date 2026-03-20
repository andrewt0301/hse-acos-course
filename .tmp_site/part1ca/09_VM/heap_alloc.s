  #
  # Example that demonstrates using RISC-V system calls for heap allocation.
  #
  .macro new_line
    li a7, 11
    li a0, '\n'
    ecall
  .end_macro

  .macro sbrk(%bytes)
    li a7, 9
    li a0, %bytes
    ecall
  .end_macro

  .text
  # Allocates 16 bytes in the heap
  sbrk(16)
  li a7, 34
  ecall
  new_line

  # Allocates 32 bytes in the heap
  sbrk(32)
  li a7, 34
  ecall
  new_line

  # Allocates 64 bytes in the heap
  sbrk(64)
  li a7, 34
  ecall
  new_line

  li a7, 10
  ecall
