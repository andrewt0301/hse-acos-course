Lecture 3
---

# System Calls

## Lecture

Slides ([PDF](OS_Lecture_03.pdf), [PPTX](OS_Lecture_03.pptx)).

#### Outline

* General idea of system calls
* System calls types
* System calls in different OS

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
* System calls in C
* Using utility `strace` to trace system calls

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

* The `open` function from POSIX:

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

* The `syscall` function:

```c
#include <unistd.h>
#include <sys/syscall.h>   /* For SYS_xxx definitions */

long syscall(long number, ...);
```

In Ubuntu 20.04 LTS, more system call declarations can be found in the following file:
`/usr/src/linux-headers-5.4.0-53/include/linux/syscalls.h`.

#### Examples

1. [hello1.c](examples/hello1.c) - uses the `printf` [glibc](https://www.gnu.org/software/libc/) function
1. [hello1.cpp](examples/hello1.cpp) - uses the `cout` object of [C++ Standard Library](https://en.cppreference.com/w/cpp/standard_library.html)
1. [hello2.c](examples/hello2.c) - uses the `write` POSIX function
1. [hello3.c](examples/hello3.c) - uses the `syscall` function

All examples do the same: they print the “Hello World” message to the console.
To compile and run them, the following commands need to be executed:

C language:
```bash
gcc hello1.c -o hello
./hello
```

C++ language:
```bash
g++ hello1.cpp -o hello
./hello
```

The [strace](https://man7.org/linux/man-pages/man1/strace.1.html) utility shows
that all the examples use the `write` system call:
```bash
strace -e trace=write ./hello
write(1, "Hello World\n", 12Hello World
)           = 12
+++ exited with 0 +++
```

#### Tasks

_Note: Run all programs using the `strace` utility (`strace ./prog`) to see what system calls they perform._

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
   to get an integer from `argv[1]` and the name of output file (`argv[2]`).

## Homework

_Write and submit to GitHub the programs described below._
_An instruction on how to work with GitHub is [here](../../software/git.md)_.

1. Write a program that prints `N` lines of a text file starting from `I`-th line.
   The command-line interface should be as follows: `argv[1]` is file name;
   `argv[2]` is starting line `I`; `argv[3]` is number of lines to print `N`.

   The program must be based on system calls `open`/`close`/`read`/`write`.
   Keep the number of system calls to a minimum: use buffers of proper size.
   Take into account page size (typically equals to `4096` bytes) and
   file size (can be obtained using the [fstat](
   https://man7.org/linux/man-pages/man3/fstat.3p.html) system call).

1. Write a program that prints the middle line of a text file.
   The middle line starts at position `<file size> / 2`.

   The program must be based on system calls `open`/`close`/`read`/`write`.
   Keep the number of system calls to a minimum: use buffers of proper size.
   Use the [lseek](https://man7.org/linux/man-pages/man2/lseek.2.html) system call
   to skip reading the first half of the file.

## References

* [System call](https://en.wikipedia.org/wiki/System_call) (Wikipedia)
* [File descriptor](https://en.wikipedia.org/wiki/File_descriptor) (Wikipedia)
* System call [open](https://en.wikipedia.org/wiki/Open_%28system_call%29) (Wikipedia)
* System call [close](https://en.wikipedia.org/wiki/Close_%28system_call%29) (Wikipedia)
* System call [read](https://en.wikipedia.org/wiki/Read_%28system_call%29) (Wikipedia)
* System call [write](https://en.wikipedia.org/wiki/Write_%28system_call%29) (Wikipedia)
* [The GNU C Library (glibc)](https://www.gnu.org/software/libc/)
* [POSIX](https://en.wikipedia.org/wiki/POSIX) (Wikipedia)
* [C POSIX library](https://en.wikipedia.org/wiki/C_POSIX_library) (Wikipedia)
* [strace](https://man7.org/linux/man-pages/man1/strace.1.html) - utility to trace system calls
