![SiFive HiFive Unleashed](images/hifive-unleashed-logo.png)

# Welcome to Computer Architecture and Operating Systems

This site contains materials for the "Computer Architecture and Operating Systems" course taught at
[Faculty of Computer Science of Higher School of Economics](https://cs.hse.ru/en/).

For information on course administration, please refer to the
official course [page](http://wiki.cs.hse.ru/ACOS_DSBA_2019/2020) at the university web site.
The official syllabus can be found [here](https://www.hse.ru/edu/courses/375268865).

## Course Motivation

This course is taught to second-year students who major in [data science](https://www.hse.ru/en/ba/data/).
The goal of the course is to give an introduction to how operating systems and hardware work under the hood,
which is essential for general computer science literacy.
This knowledge will help better understand the performance of software systems and create more efficient solutions.
Also, the course will give a starting background to those who are planning to apply machine learning methods
in system software (most of top-ranked IT companies have such projects).
The practical part will give some experience in working with system software such as Unix-based operating systems,
compilers, build tools, emulators, virtual machines, and so on. 

## Course Description

__TODO: CONTENT IS UNDER DEVELOPMENT__ 

The course consists of two logical parts.
The first part is given in __module 3__ and is dedicated to computer architecture and assembly language programming.
This part is based on the [RISC-V](https://en.wikipedia.org/wiki/RISC-V) instruction set architecture
and its assembly language.
The second part is given in __module 4__ and covers foundations of operating system organisation and system programming.
The main tools for this part are the [Linux](https://en.wikipedia.org/wiki/Linux) operating system and
the [C programming language](https://en.wikipedia.org/wiki/C_%28programming_language%29).

#### Computer Architecture and Assembly Language

1. [Introduction. Historical overview. Computer architecture concept.](part1ca/01_Introduction/lecture.md)
   <!--- [CODR] Chapter 1, [MIT 6.172] Lecture 1. [SCO] --> 
2. [Data types. Byte Ordering. Integer and floating-point formats.](part1ca/02_DataTypes/lecture.md)
   <!--- [CSPP] Chapter 2. -->
3. [CPU. RISC and RISC-V. Assembly language.](part1ca/03_CPU/lecture.md)
   <!--- -->

* Assembler, assembly language. RISC and MIPS.
* Registers and memory model.
* Calling conventions, stack and subroutines.
* Arithmetical coprocessor.
* More on assembly language: macros and includes; stack frame.
* Exceptions, traps, and interrupts.
* Pipelines.
* Caches and jump predictions.

#### Operating Systems and System Programming

* Challenges of OS: unification, separation, logging. Kernel and userspace. Interoperability and cross-platformness.
* The C programming language as high-level system programming tool. Libc. Building and running a C program.
* Shell.
* Processes.
* Filesystem.
* Devices and other special files.
* Permissions.
* Inter-process communication.
* Libraries and binary file format.
* Shared objects.
* Programming tools.
* Operating system goals: unification, separation, logging. OS interfaces: program-oriented, command-oriented, UI. OS architecture: monolith/modular/mixed.
* Classical flower-like architecture: kernel, kernel modules; services, utilities, applications. Competency separation.
* Command-oriented interface: utilities and shell. Command input/output/control flows. Assumption of human-readable/writable nature of command data flows. Commandline interface: principle and examples. POSIX shell command-line interface: basic syntax and command-line conventions.
* Utilities as command-line syscall wrappers (files, processes etc.).
* Shell syntax, I/O redirection.
* Text processing utilities, regular expressions.
* Pre-system boot stages.
* POSIX-like system initialization, daemons.
* SystemD model of interactive service control.
* Application libraries, message bus.
* GUI orchestrating, widgetsets.
* Free/Open source. Distribution lifecycle: packages, repository, package manager.

* __TODO__
* [Libraries](part2os/libs.md)
* [System programming in high-level languages (Python)](part2os/python.md)

## Grading System

Information on the grading system for the course is [here](grades.md).

## Software

The list of software required for the course is [here](software.md). 

## Textbooks

The list of textbooks recommended for reading is [here](books.md).

## Related Courses

The list of similar and related courses is [here](courses.md).

## Feedback

If you have any questions or suggestions related to the course content, please feel free to submit
an [issue](https://github.com/andrewt0301/hse-acos-course/issues)
or contact the course [author](https://github.com/andrewt0301). 
If you like the course, you are welcome to star it in [GitHub](https://github.com/andrewt0301/hse-acos-course).
