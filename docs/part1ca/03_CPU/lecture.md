Lecture 3
---

# Computer Architecture and Assembly Language

## Lecture

Slides ([PDF](CA_Lecture_03.pdf), [PPTX](CA_Lecture_03.pptx)).

#### Outline:

* Computer organization.
* Processor.
* CPU performance.
* Instruction set architecture (ISA).
* RISC and RISC-V.
* Assembly language.

## Workshop

#### Outline

* Getting familiar with the [RARS](https://github.com/TheThirdOne/rars) simulator.
* Getting familiar with RISC-V registers.
* Getting familiar with RARS system calls to input/output integer values.
    * _PrintInt_ (number 1)
    * _PrintHex_ (number 34)
    * _PrintBinary_ (number 35)
    * _PrintIntUnsigned_ (number 36)
    * _ReadInt_ (number 5)
* Practicing with RISC-V arithmetic and bitwise instructions.
    * _Arithmetic_: `add`, `sub`, `addi`
    * _Bitwise_: `and`, `or`, `xor`, `andi`, `ori`, `xori`
    * _Shifts_: `sll`, `srl`, `sra`, `slli`, `srli`, `srai`
    * _Comparison_: `slt`, `sltu`, `slti`, `sltiu`
    * _Multiplication_: `mul`, `rem`, `div`, `divu`, `remu`
 

_Hint_: Use the RARS help system (F1) and [RISC-V Greencard](
        https://github.com/andrewt0301/hse-acos-course/raw/master/related/greencard-20181213.pdf)
        to quickly find the needed instructions.

#### Tasks

1. Open in RARS and run the ["Hello World"](
   https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/03_CPU/workshop/hello.s) program.
   Get familiar with its structure. Pay attention to the `.text` and `.data` segments, labels,
   and system calls.

1. Open in RARS and run the ["Add"](
   https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/03_CPU/workshop/add.s) program.
   This is an example of a program that inputs two numbers, adds them, and prints the result.
   It is can be used a basis for other programs.

1. Write a program that inputs integer value `x` and prints it in the following formats:
   decimal, unsigned, hexadecimal, and binary. _Hint_: Use RARS help (F1) to find proper system calls. 

1. Write a program that inputs two integer values `x` and `y`, calculates the result of the
   following expressions, and prints the result.

       x + 5 - y 
       (x - y) << 3
       (x + y) >> 2
       (x + 5) + (x - 7)
       x >> 3 + y << 3

1. Write a program that inputs integer value `x`, performs alogic and arithmetical shifts to
   the left and to the right by 3 digits, and prints the result.

1. Write a program that inputs integer value `x`, performs the following operations,
   and prints the result. Use the binary format for printing.

       x * 2
       x * 3
       x * 4
       x * 5
       x * 8
       x * 31

    How to perform these operations without using a multiplication instruction?       

       x / 2
       x / 3
       x / 5
       x / 8
       x / 31

    Is it possible to do this without using a division instruction?       

       x % 2
       x % 3
       x % 5
       x % 8
       x % 31

    Is it possible to do this without using a remainder instruction?

1. Write a program that inputs integer value `x`, sets its 3-rd bit, resets its 6-th bit,
   and prints the result. Use the binary format for printing.

1. Write a program that inputs two integer values `x` and `y` and perform their signed and 
   unsigned comparison (using the `slt` and `sltu` instructions).

1. Write a program that inputs two integer values `x` and `y`, swaps them with the _XOR_
   operation, and outputs them back. 

1. Modify the add program to check whether an integer overflow has occured in the addition instruction.
   Print '0' if no, and '1' if yes.

1. Write a program that performs the following bit tricks:

   * `x & (x - 1)` - turning off the rightmost 1-bit (e.g. `01011000` => `01010000`).
   * `x | (x + 1)` - turning on the rightmost 0-bit (e.g. `10100111` => `10101111`).
   * `x | (x - 1)` - turning on the trailing 0's (e.g. `10101000` => `10101111`).

   Print the input and output values in the binary format.
 
#### Notes

What is an _integer overlow_? This is a situation when an arithmetic operation
produces a value that is outside of the range that can be represented with a given number of bits.

Let us consider how such a situation can happen when we add two 4-bit values.

1. _The values are unsigned._
 
    Here is the simplest example of the overflow situation:

       1111 (15) + 0001 (1) = 10000 (16) -> fit into 4 bits -> 0000 (0) == OVERFLOW 

   The result of this addition is a 5-bit value. When we fit it into 4 bits, we get `0000 (0)`.
   This is an incorrent result. The most significant bit of the result (`1`) is outside of the 4-bit size.

   How can we detect this? _Rule: if the sum is smaller than any of the values, this is an overflow._ 

1. _The values are signed (2's complement)._

   This case is more complicated. Here are examples of 4 possible situations:
   
       1111 (-1) + 0001  (1) = 10000 -> fit into 4 bits -> 0000  (0) == OK
       1111 (-1) + 1111 (-1) = 11110 -> fit into 4 bits -> 1110 (-2) == OK
       1000 (-8) + 1111 (-1) = 10111 -> fit into 4 bits -> 0111  (7) == OVERFLOW
       0111  (7) + 0001  (1) =                             1000 (-8) == OVERFLOW

   What rule can we draw from these examples? _Rule: if both values have the same sign 
   (their most significant bits are equal) and it is different from the sign of the result,
   this is an overflow._  

## Homework

Finish the tasks and send the programs to your team assistant.

## References

* [RISC-V web site](https://riscv.org/).
* [RISC-V](https://en.wikipedia.org/wiki/RISC-V) (Wikipedia).
* RISC-V instructions. Chapters 1 and 2 in [[CODR]](../../books.md).
* [The RISC-V Instruction Set Manual. Volume I: Unprivileged ISA](
  https://github.com/riscv/riscv-isa-manual/releases/latest).
* [RISC-V Greencard](
  https://github.com/andrewt0301/hse-acos-course/raw/master/related/greencard-20181213.pdf).
* [RISC-V Assembly Programmer's Manual](https://github.com/riscv/riscv-asm-manual/blob/master/riscv-asm.md)
* [Central Processing Unit](https://en.wikipedia.org/wiki/Central_processing_unit) (Wikipedia).
* [Motherboard](https://en.wikipedia.org/wiki/Motherboard) (Wikipedia).
* [System Bus](https://en.wikipedia.org/wiki/System_bus) (Wikipedia).
* [Instruction Set Architecture](
  https://en.wikipedia.org/wiki/Instruction_set_architecture) (Wikipedia).
* [Integer Overflow](https://en.wikipedia.org/wiki/Integer_overflow) (Wikipedia).
