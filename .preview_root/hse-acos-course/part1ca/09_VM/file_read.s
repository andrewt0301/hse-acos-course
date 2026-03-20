#
# Example that demonstrates using RISC-V system calls for reading from a file.
#
  .data
fin:
  .asciz "testout.txt" # filename for input
error:
  .asciz "Error: failed to open a file."

buffer:
  .space 33

  .text
main:
  la   s0, buffer   # address of buffer to which to write
  li   s1, 32       # buffer size

  # Open (for reading) an existing file
  li   a7, 1024     # system call for open file
  la   a0, fin      # input file name
  li   a1, 0        # open for reading (flags are 0: read, 1: write)
  ecall             # open a file (file descriptor returned in a0)

  bltz a0, main.error # exit on errord exit
  mv   s6, a0        # save the file descriptor

main.loop:
  # Write to file just opened
  li   a7, 63       # system call for read from file
  mv   a0, s6       # file descriptor
  mv   a1, s0       # address of buffer to which to write
  mv   a2, s1       # buffer length
  ecall             # read from a file

  bltz a0, main.close # close the file on error and exit
  mv   t0, a0       # save size read
  add  t1, s0, a0   # write zero terminator to end of buffer
  sb   zero, 0(t1)  #

  # Print the buffer read from a file
  li   a7, 4
  mv   a0, s0
  ecall

  # If bytes read = 32, loop.
  beq  t0, s1, main.loop

main.close:
  # Close the file
  li   a7, 57       # system call for close file
  mv   a0, s6       # file descriptor to close
  ecall             # close file

main.exit:
  li   a7, 10
  ecall

main.error:
  li   a7, 4
  la   a0, error
  ecall
