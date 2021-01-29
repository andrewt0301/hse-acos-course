Lecture 6
---

# Subroutines. Call stack. Calling conventions.

## Lecture

Slides ([PDF](CA_Lecture_06.pdf), [PPTX](CA_Lecture_06.pptx)).

#### Outline:

* Functions, caller, callee
* Jump-and-link instructions
* Register conventions
* Stack pointer
* Stack frame
* Caller-saved and cellee-saved registers

#### Examples:

* [leaf.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/06_CallStack/leaf.s)
* [fact.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/06_CallStack/fact.s)
* [fp.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/06_CallStack/fp.s)

## Workshop

#### Outline

* Demonstrate using the RISC-V toolchain (use the Ubunbu VM with RISC-V from [here](../../software/ubuntu.md))
* Practice writing programs that use functions
* Practice using caller-saved and callee-saved registers
* Practice writing nested and recursive functions

#### Using the RISC-V toolchain

Compiling a C program to RISC-V executable:

    acos@acos-vm:~/Documents/acos$ riscv64-unknown-linux-gnu-gcc hello.c -o hello -static

Compiling a C program to RISC-V assembly:

    acos@acos-vm:~/Documents/acos$ riscv64-unknown-linux-gnu-gcc hello.c -S
    
Assembling and linking a RISC-V assembly program to executable:

    acos@acos-vm:~/Documents/acos$ riscv64-unknown-linux-gnu-gcc hello.s -o hello -static

Disassembling a compiled executable file:

    acos@acos-vm:~/Documents/acos$ riscv64-unknown-linux-gnu-objdump hello -S

Running the compiled program with the Spike RISC-V simulator:

    acos@acos-vm:~/Documents/acos$ spike $RISCV/riscv64-unknown-linux-gnu/bin/pk hello
    bbl loader
    Hello, world!

#### Tasks

__TODO__

## Homework

Study and run all examples and finish all the tasks.

## References

* Functions in RISC-V. Section 2.8 in [[CODR]](../../books.md).
* [Call stack](https://en.wikipedia.org/wiki/Call_stack) (Wikipedia).
* [Calling convention](https://en.wikipedia.org/wiki/Calling_convention) (Wikipedia).
