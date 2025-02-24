#
# Example that demonstrates using RISC-V system calls for writing to a file.
#
  .data
fout:
  .asciz "testout.txt" # filename for output

buffer:
  .asciz "The quick brown fox jumps over the lazy dog."
  .text

  # Open (for writing) a file that does not exist
  li   a7, 1024     # system call for open file
  la   a0, fout     # output file name
  li   a1, 1        # Open for writing (flags are 0: read, 1: write)
  ecall             # open a file (file descriptor returned in a0)
  mv   s6, a0       # save the file descriptor

  # Write to file just opened
  li   a7, 64       # system call for write to file
  mv   a0, s6       # file descriptor
  la   a1, buffer   # address of buffer from which to write
  li   a2, 44       # hardcoded buffer length
  ecall             # write to file

  # Close the file
  li   a7, 57       # system call for close file
  mv   a0, s6       # file descriptor to close
  ecall             # close file

  li a7, 10         # system call to exit program
  ecall
