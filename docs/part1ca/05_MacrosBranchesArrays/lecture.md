Lecture 5
---

# Pseudo instructions, macros, and includes. Conditions, loops, loads, and stores.

## Lecture

Slides ([PDF](CA_Lecture_05.pdf), [PPTX](CA_Lecture_05.pptx)).

#### Outline

* Program structure: segments and labels.
* Branch instructions and their use in conditions and loops.
* Data segment and data directives (`.byte`, `.half`, `.word`, `.space`, `.align`, `.ascii`, `.asciz`).
* Load and store instructions and their use for accessing static data.
* Macros (directives `.macro`, `.end_macro`, `.include`, and `.eqv`)
* Examples of programs processing static variables stored in the data segment.

#### Examples:

* [hello.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/hello.s)
* [if_then_else.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/if_then_else.s)
* [while.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/while.s)
* [for.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/for.s)
* [for_nested.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/for_nested.s)
* [macros1.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/macros1.s)
* [macros2.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/macros2.s)
* [macros3.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/macros3.s)
* [macrolib.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/macrolib.s)
* [fibonacci.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/fibonacci.s)
* [euclid.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/euclid.s)
* [data.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/data.s)
* [loadstore.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/loadstore.s)
* [loadstore2.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/loadstore2.s)
* [loadstore3.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/loadstore3.s)
* [min_max.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/05_MacrosBranchesArrays/min_max.s)

## Workshop

#### Outline

* Study and run all the examples from the lecture.
* Practice writing programs with conditions and loops.
* Practice writing programs that access values in the data segment.
* Practice using macros. Pay attention to the code generated from macros.

#### Tasks

1. Write a program that inputs two integer values `x` and `y` and prints all the values
   in the range `min(x, y)..max(x, y)`.

1. Write a program that fills an array of 32 integers from values from the standard input.
   It reads values in a loop and finishes reading when all 32 values are read or when value `0` is read.

1. Write a program that inputs two positive integer values `N` and `D`, finds their quatient (`Q`) and
   remainder (`R`) using the algorithm below, prints the result.

       function divide_unsigned(N, D)
           Q := 0; R := N
           while R ≥ D do
              Q := Q + 1
              R := R − D
           end
          return (Q, R)
       end

1. Write your own macros `print_hex` and `print_bin` for printing values in hexadecimal and binary formats
   respectively. What if you want to print immediate values? What kind of macro do you need in this case?

1. Write a program that inputs two unsigned integer values `x` and `y`, calculates `x ** y`
   (`x` raised to the power of `y`), and prints the result. The exponentiation should be implemented
   as a multiplication in a loop. If an overflow occurs, the program must exit the loop and
   print an error message. 

## Homework

Solve the following tasks:

1. [DoubleSum](../Tasks/homeworks.md#doublesum)
2. [DigitSum](../Tasks/homeworks.md#digitsum)
3. [PlusMinus](../Tasks/homeworks.md#plusminus)
4. [EvenBack](../Tasks/homeworks.md#evenback)
5. [NoDups](../Tasks/homeworks.md#nodups)

Commit the programs to your private GitHub account. Place them into the folder `ca/lab05`.

## References

* RARS help system (click in the main menu `Help > Help` or press `F1`).
* Multiplication and division algorithms.
  Sections 3.3 and 3.4 in [[CODR]](../../books.md) and Appendix J in [[CAQA]](../../books.md).
* [Macros](https://en.wikipedia.org/wiki/Macro_%28computer_science%29) (Wikipedia).
* [Macros in Assembly Language](https://en.wikipedia.org/wiki/Assembly_language#Macros) (Wikipedia).
* [RISC-V Assembly Programmer's Manual](https://github.com/riscv-non-isa/riscv-asm-manual/blob/main/src/riscv-asm.adoc).
* [Memory Alignment](https://en.wikipedia.org/wiki/Data_structure_alignment) (Wikipedia).
