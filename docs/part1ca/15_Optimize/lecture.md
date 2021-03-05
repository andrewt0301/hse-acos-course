Lecture 15
---

# Optimizations

## Lecture

Slides ([PDF](CA_Lecture_15.pdf), [PPTX](CA_Lecture_15.pptx)).

#### Outline

* Reducing amount of work 
* Data optimization
* Loop optimizations
* Logic optimizations
* Function optimizations
* Optimizing compilers and their limitations

#### List of Optimizations

Data structures

* Packing and encoding
* Augmentation
* Precomputation
* Compile-time initialization
* Caching
* Lazy evaluation
* Sparsity

Loops

* Hoisting
* Sentinels
* Loop unrolling
* Loop fusion
* Eliminating wasted iterations

Logic

* Constant folding and propagation
* Common-subexpression elimination
* Algebraic identities
* Short-circuiting
* Ordering tests
* Creating a fast path
* Combining tests

Functions

* Inlining
* Tail-recursion elimination
* Coarsening recursion

## Workshop

#### Outline

* Discuss optimizations from the lecture, whoch are related to hardware.
* Use the RISC-V toolchain to compile C programs with optimizations.
    * Study examples of optimized and unoptimized C programs.
    * Review the assembly code generate by the compiler.
    * Try different levels of compiler optimizations (`-01`, `-02`). 
* Practice implementing optimizations in the RISC-V assembly.

#### Using the RISC-V Toolchain

1. Run the [Linux Ubuntu 20.04 LTS with RISC-V toolchain](../../software/ubuntu.md) VM in your VirtualBox.

1. Use the password `acos2020` to log in and open the Bash terminal.

1. (Optional) Connect to the VM from your host OS (MacOS or Windows)
   via SSH by executing the following command in the terminal (use the same password):

       ssh acos@localhost -p2022 

1. Create a C program (e.g. `prog.c`) using your favourite editor (_nano_,  _mcedit_, _vim_, etc.).

1. Compile the C program to the assembly language:

       riscv64-unknown-linux-gnu-gcc prog.c -S

1. Compile the C program to the assembly language with optimizations enabled:

       riscv64-unknown-linux-gnu-gcc prog.c -S -O1

1. Compare the optimized and the unoptimized versions of the assembly program (the `prog.s` file).

1. Compile the assembly program to the object format and link it to an executable file:

       riscv64-unknown-linux-gnu-gcc prog.s -o prog -static

1. Run the program using the [Spike](https://github.com/riscv/riscv-isa-sim) simulator:

       spike $RISCV/riscv64-unknown-linux-gnu/bin/pk prog

See the list of optimization flags supported by GCC [here](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html).

See the RISC-V options for GCC [here](https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html).

#### Examples

1. Inlining and constant folding.

```C
#include <stdio.h>

int square(int x) {
   return x * x;
}

int add(int x, int y) {
    return x + y;
}

int main() {
    int x = 10;
    int y = 5;
    int z = add(square(x), y);
    printf("Result = %d\n", z);
    return 0;
}
```
* Compile the program without optimizations and then with optimizations. See the difference.
* Add the `inline` directive to the function declarations. What happens after you do this?
* Modify the program so that `x` and `y` are read from the user input. How does it affect optimizations? 

#### Tasks

1. Explain why passing arguments to functions by reference or by pointer is not a good idea
   unless it is really necessary. Explain the difference between:

   ```C   
   void add(int* z, int* x, int* y) {
       *z = *x + *y;
   }
   ```
   and:
   ```C
   int add(int x, int y) {
       return x + y;
   }
   ```

1. Write a function in RISC-V assembly, which accepts as arguments an array of 16-bit values and returns
   the result of following expression: `A[0] - A[1] + A[2] - A[3] + [A4] ... +- A[N-1]`.
   Use the _loop unrolling__ technique to make calculations faster.

   An unoptimized C implementation look like this:
   
   ```C
   #include <stdio.h>
   
   int func(short *array, int size) {
       int result = 0;
       for (int i = 0; i < size; ++i) {
           short value = array[i];
           if (i % 2 == 0) {
               result -= value;
           } else {
               result += value;
           }
       }
       return result;
   }

   int main() {
       short arr[] = {1, 2, 3, 4, 5};
       printf("Result= %d\n", func(arr, sizeof(arr)/sizeof(short)));
       return 0;
   }
   ```

## Homework

Finish all the tasks.

## References

* Optimizing program performance. Chapter 5 in [[CSPP]](../../books.md).
* [MIT 6.172](
  https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2018).
  Lecture 2. [Slides](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2018/lecture-slides/MIT6_172F18_lec2.pdf).
* [Loop unrolling](https://en.wikipedia.org/wiki/Loop_unrolling) (Wikipedia).
* [Loop-invariant code motion](https://en.wikipedia.org/wiki/Loop-invariant_code_motion) (Wikipedia).
* [Profiling](https://en.wikipedia.org/wiki/Profiling_%28computer_programming%29) (Wikipedia).
* [Program optimization](https://en.wikipedia.org/wiki/Program_optimization) (Wikipedia).
