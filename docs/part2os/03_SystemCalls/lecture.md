Lecture 3
---

# System calls

## Lecture

<!---
Slides ([PDF](CA_Lecture_01.pdf), [PPTX](CA_Lecture_01.pptx)).

Outline:
-->

#### System Call Types

There are several types of system calls. Each type solves a specific kind of task:

* Process control
     * creating and terminating processes
     * loading and executing programs
     * getting and setting process attributes
     * allocating and freeing memory
     * waiting and signaling events

* File management
     * creating and deleting files
     * opening and closing files
     * reading, writing, repositioning
     * getting and setting file attributes

* Device management
     * requesting and releasing devices
     * reading, writing, repositioning
     * getting and setting device attributes
     * attaching and detaching devices

* Information maintenance
    * getting and setting date/time
    * getting and setting system data
    * getting and setting process, file, or device attributes

* Communications
    * create and delete communication connection
    * send and receive messages
    * transfer status information
    * attach and detach remote devices

* Protection
   * getting file permissions
   * setting file permissions

These tasks will be discussed in upcoming lectures and workshops.

## Workshop

#### Outline

* General idea of system calls
* System calls `open`, `close`, `read`, and `write`
* System call `sbrk` 
* System calls in assembly
* System calls in C

#### Theory

_System calls_ are operations (functions) provided by the operating system kernel,
which are available to user applications.
They are designed and documented by operating system kernel developers.
System calls are typically executed with the help of so-called wrapper functions,
which can be conveniently used in user-mode applications
(e.g. the [glibc](https://www.gnu.org/software/libc/) library in Linux).
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

![System call](syscall.png)

##### System calls in RARS (RISC-V Assembly)

1. __open__ (1024): opens a file with the specified path

    _Input_: `a0` = Null terminated string for the path, `a1` = flags

    _Output_: `a0` = the file descriptor or -1 if an error occurred

    _Supported flags_: _read-only_ (0), _write-only_ (1), and _write-append_ (9). 
    The _write-only_ flag creates a file if it does not exist, so it is technically _write-create_.
    The _write-append_ flag will start writing at end of an existing file.

1. __close__ (57): closes a file

    Input: `a0` = the file descriptor to close

    Output: N/A

1. __read__ (63): reads from a file descriptor into a buffer

   _Input_: `a0` = the file descriptor, `a1` = address of the buffer, `a2` = maximum length to read.

   _Output_: `a0` = the length read or -1 if error.

1. __write__ (64): writes to a file from a buffer

   _Input_: `a0` = the file descriptor, `a1` = the buffer address, `a2` = the length to write.

   _Output_: `a0` = the number of characters written.

1. __sbrk__ (9): allocates heap memory

   _Input_: `a0` = amount of memory in bytes

   _Output_: `a0` = address to the allocated block

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

Allocating memory in the heap:

```assembly
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
```

##### System calls in Linux API (C language)

Linux provides the following facilities to execute system calls:

* POSIX functions that are mapped directly to Linux system calls.
  For example, `open()`, `read()`, `write()`, etc.

* [glibc](https://www.gnu.org/software/libc/) functions which are operating-system
  independent wrappers around system calls.
  For example, `fopen()`, `scanf()`, `printf()`, etc.

* `syscall()` - special [glibc](https://www.gnu.org/software/libc/)
  function to perform an indirect system call by number.

__API-functions that perform system calls__

Functions that are called in user program to execute system calls are defined in special header files.
To make them available, a corresponding header must be included
into the program source code and then a function can be called.

* The “open” function from POSIX:

```c
#include <sys/stat.h>
#include <fcntl.h>

int open(const char *path, int oflag, ...);
```

* The `fopen` function from [glibc](https://www.gnu.org/software/libc/):

```c
#include <stdio.h>

FILE *fopen(const char *pathname, const char *mode);
```

* The “syscall” function:

```c
#include <unistd.h>
#include <sys/syscall.h>   /* For SYS_xxx definitions */

long syscall(long number, ...);
```

In Ubuntu 20.04 LTS, more system call declarations can be found in the following file:
`/usr/src/linux-headers-5.4.0-53/include/linux/syscalls.h`.

#### Examples

Example 1: Using the `printf` [glibc](https://www.gnu.org/software/libc/) function:

```c
#include <stdio.h>
int main () {
    printf("Hello World\n");
    return 0;
}
```

Example 2: Using the `write` POSIX function:

```c
#include <fcntl.h>
#include <unistd.h>
int main () {
    write (1, "Hello World\n", 12);
    return 0;
}
```
 
Example 3: Using the `syscall` function:

```c
#include <unistd.h>
#include <sys/syscall.h>
int main () {
    syscall (1, 1, "Hello World\n", 12);
    return 0;
}
```

All the three examples, do the same: they print the “Hello World” message to the console.
To compile and run them, the following commands need to be executed:

```
acos@acos-vm:~$ gcc test.c –o test
acos@acos-vm:~$ ./test
```

#### Tasks

__System calls in RARS (RISC-V Assembly):__

1. Write a program that creates a copy of the specified file. Input arguments:
   * The name of the source and target files are read from the standard input (use system call 8).
   * The buffer to store data being copied is allocated in the heap (use system call 9).
     The buffer size is specified in standard input.
   * Buffers for storing source and target names are also allocated in the heap (their size is 256 bytes).  

__System calls in C:__

1. Read documentation on the [read](https://man7.org/linux/man-pages/man2/read.2.html)
   and [write](https://man7.org/linux/man-pages/man2/write.2.html) system calls.
   Note descriptors standard numbers for `stdin`, `stdout`, and `stderr`.
   Write a program that reads chars (note the `&c` notation) from `stdin`, increments them by 1,
   and writes them to `stdout`.
   Do not forget to include all the headers mentioned in the manual.
   To close `stdin` from the terminal, use the `^D` key combination
   (it is not passed to program, but interpreted by operating system as end of output).

1. Read documentation on the [open](https://man7.org/linux/man-pages/man2/open.2.html) system call.
   Take notice of flags, which are used to indicate how the file is opened.
   Flags are bits and can be combined with bitwise OR (`|`).
   The `O_RDONLY` flag is used to open a file for reading.
   The `O_WRONLY|O_CREAT|O_TRUNC` combination is used for open a file for writing.
   The mode parameter is required when creating the file. It specifies file access rights.
   For example, the `S_IRUSR` flag means that user has read permission,
   the `S_IRGRP` means that group has read permission, the `S_IROTH` flag means others have read permission.
   Write a program that reads 100 words from `stdin` and writes them to a file named outfile.
   Do not forget to close the file.

1. Modify the previous program to accept command-line arguments (argc/argv).
   Pass via command-line arguments the number of words
   (use [sscanf](https://man7.org/linux/man-pages/man3/sscanf.3p.html)
   to get an integer from _argv[1]_ and the name of output file (_argv[2]_).

## Homework

__TODO__

# References

* [System call](https://en.wikipedia.org/wiki/System_call) (Wikipedia)
* System call [open](https://en.wikipedia.org/wiki/Open_%28system_call%29) (Wikipedia)
* System call [close](https://en.wikipedia.org/wiki/Close_%28system_call%29) (Wikipedia)
* System call [read](https://en.wikipedia.org/wiki/Read_%28system_call%29) (Wikipedia)
* System call [write](https://en.wikipedia.org/wiki/Write_%28system_call%29) (Wikipedia)
* System call [sbrk](https://en.wikipedia.org/wiki/Sbrk) (Wikipedia)
* [The GNU C Library (glibc)](https://www.gnu.org/software/libc/)
* [POSIX](https://en.wikipedia.org/wiki/POSIX) (Wikipedia)
* [C POSIX library](https://en.wikipedia.org/wiki/C_POSIX_library) (Wikipedia)
