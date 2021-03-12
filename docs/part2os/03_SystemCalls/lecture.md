Lecture 3
---

# System calls

## Lecture

<!---
Slides ([PDF](CA_Lecture_01.pdf), [PPTX](CA_Lecture_01.pptx)).

Outline:
-->
## Workshop

#### Outline

* General idea of system calls `open`, `close`, `read`, and `write` 
* System calls in assembly
* System calls in C

#### Theory

_System calls_ are operations (functions) provided by the operating system kernel,
which are available to user applications.
They are designed and documented by operating system kernel developers.
System calls are typically executed with the help of so-called wrapper functions,
which can be conveniently used in user-mode applications (e.g. the glibc library in Linux).
System calls allow executing kernel tasks upon user’s requests.
Modern operating systems isolate kernel memory from user applications.
Therefore, when a user application needs to make a request to the kernel
(open a file, create a process, send data to network, etc.), a switch between kernel and user modes is required.
This makes system calls much slower than regular function calls.
System calls are made in architecture-dependent way, employing specific features of the instruction set architecture.
A basic solution for system calls is employing the processor interrupt feature.
However, a processor can also provide special instructions for this job.
Arguments are passed via registers if they are available, extra arguments are passed via stack.
The operating system kernel saves and restores execution state (e.g. registers)
when switching between the use and the kernel modes.

##### System calls in RARS

1. __open__ (1024): opens a file with the specified path.

    _Input_: `a0` = Null terminated string for the path, `a1` = flags

    _Output_: `a0` = the file descriptor or -1 if an error occurred

    _Supported flags_: _read-only_ (0), _write-only_ (1), and _write-append_ (9). 
    The _write-only_ flag creates a file if it does not exist, so it is technically _write-create_.
    The _write-append_ flag will start writing at end of an existing file.

1. __close__ (57): closes a file

    Input: `a0` = the file descriptor to close

    Output: N/A

1. __read__ (63): reads from a file descriptor into a buffer.

   _Input_: `a0` = the file descriptor, `a1` = address of the buffer, `a2` = maximum length to read.

   _Output_: `a0` = the length read or -1 if error.

1. __write__ (64): writes to a file from a buffer.

   _Input_: `a0` = the file descriptor, `a1` = the buffer address, `a2` = the length to write.

   _Output_: `a0` = the number of characters written.

#### Examples

Writing text to a file:

```assembly
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
```

Reading text from a file:

```assembly
  .data
fin:   
  .asciz "testouts.txt" # filename for input
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
```

#### Tasks

1. Write a program that copies a a file.
   The name of the source and target files are read from the standard input (use system call 8 - ReadString). 

## Homework

__TODO__

# References

* System call [open](https://en.wikipedia.org/wiki/Open_%28system_call%29) (Wikipedia)
* System call [close](https://en.wikipedia.org/wiki/Close_%28system_call%29) (Wikipedia)
* System call [read](https://en.wikipedia.org/wiki/Read_%28system_call%29) (Wikipedia)
* System call [write](https://en.wikipedia.org/wiki/Write_%28system_call%29) (Wikipedia)
