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
* [euclid.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/06_CallStack/euclid.s)
* [min_max.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/06_CallStack/min_max.s)
* [min_max2.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/06_CallStack/min_max2.s)
* [swap.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/06_CallStack/swap.s)

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

#### How to call a function?

Saving registers:

* The caller does not know what registers are used by the callee.
* The callee does not know what registers are used by the caller.
* Therefore, the callee is likely to overwrite registers that are important for the caller. 
* To avoid this situation, a programmer must follow the calling conventions.

Regiter conventions:

1. Callee-saved registers: `sp`, `s0`-`s11`
1. Caller-saved registers: `ra`, `a0`-`a7`, `t0`-`t6`

What is done by the caller?

1. Save all caller-saved registers, which must be preserved, to the stack.
1. Put the arguments into registers `a0`-`a7`.
1. Call the function.
1. When the function returns, read the return values from `a0` and `a1`.
1. Restore all the previosly saved caller-saved registers from the stack.

What is done by the callee?

1. Save all callee-saved registers, which will be modified, to the stack.
1. Perform some operations (if the callee wants to call a function, it becomes the caller for this callee function). 
1. Save the result to registers `a0` and `a1`. 
1. Restore all the previosly saved the callee-saved registers from the stack.
1. Return back to the caller.

#### Tasks

1. Translate the following C code into the RISC-V assembly language:

   ```c
   int f(int x, int y) {
       return 2 * x + y;
   }

   int g(int x, int y) {
       return 3 * y - x);
   }

   int main() {
       int x = read_int();
       int y = read_int();
       int z = f(x, y) + x + g(x, y) - y;
       print_int(z);
   }
   ```

1. Translate the following C code into the RISC-V assembly language:

   ```c
   int f(int x, int y) {
       return 2 * x + y;
   }

   int g(int a, int b, int c, int d) {
       return f(a, c) - f(b, d);
   }

   int main() {
       int a = read_int();
       int b = read_int();
       int c = read_int();
       int d = read_int();
       int x = g(a, b, c, d);
       print_int(x);
   }
   ```

1. Write program `divide.s` that inputs two positive integer values `N` and `D`,
   finds their quatient (`Q`) and remainder (`R`) using the algorithm below, and prints the result.
   The algorithm must be implemented as a function (the code from the previous seminar can be reused).

   ```pascal
   function divide_unsigned(N, D)
       Q := 0; R := N
       while R ≥ D do
           Q := Q + 1
           R := R − D
       end
       return (Q, R)
   end
   ```

1. Write program `gcd.s` that inputs two positive integer values `a` and `b`,
   finds their greatest common divisor using the algorithm below, and prints the result.
   The algorithm must be implemented as a recursive function.

   ```pascal
   function gcd(a, b)
       if b = 0
           return a
       else
           return gcd(b, a mod b)
   ```

1. Write program `fib.s` that inputs integer value `n`, computes n-th Fibonacci number
   using the algorithm below, and prints the result.
   The algorithm must be implemented as a recursive function.

   ```c
   int fib(int n) {
       if (n < 2)
           return n;
       else
           return fib(n-1) + fib(n-2);
   }
   ```

1. Write program `sum.s` that first inputs integer value `n`, after that inputs `n` integer elements
   and stores them in the stack, then calls function `sum` adding all the elements, and, finally, prints the sum.  

## Homework

Study and run all examples and finish all the tasks.

## References

* Functions in RISC-V. Section 2.8 in [[CODR]](../../books.md).
* [Call stack](https://en.wikipedia.org/wiki/Call_stack) (Wikipedia).
* [Calling convention](https://en.wikipedia.org/wiki/Calling_convention) (Wikipedia).
