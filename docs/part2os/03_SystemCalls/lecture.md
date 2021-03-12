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

#### Examples

Writing text to a file:

```assembly
  .data
fout:   
  .asciz "testout.txt"      # filename for output

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

Read text from a file:



## Homework

__TODO__

# References

__TODO__
