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
* Use the RISC-V toolchain (use compiler explorer [Godbolt](https://godbolt.org/))
  to compile C programs with optimizations.
    * Study examples of optimized and unoptimized C programs.
    * Review the assembly code generate by the compiler.
    * Try different levels of compiler optimizations (`-01`, `-02`). 
* Practice implementing optimizations in the RISC-V assembly.

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

1. Loop unrolling.

   ```C
   #include <stdio.h>
 
   void fcopy(char *source, char *target) {
       for (int i = 0; i < 256; ++i) {
          target[i] = source[i];
       }
   }
    
   int main() {
       char in[256];
       scanf("%s", in);
       char out[256];
       fcopy(in, out);
       printf("Result = %s\n", out);
       return 0;
   }
   ```
   * Compile the program without optimizations and then with optimizations (`-03`). See the difference.

1. Memory accesses.

   ```C
   #include <stdio.h>
  
   void add (int x, int y, int z, int *result) {
       *result += x;
       *result += y;
       *result += z;
   }
    
   int main() {
       int x, y, z;
       scanf("%d%d%d", &x, &y, &z);
       int result;
       add(x, y, z, &result);
       printf("Result=%d\n", result);
       return 0;
   }
   ```
   * Compile the program without optimizations and then with optimizations (`-01`). See the difference.

1. Branch prediction.

   ```C
   int test(int a, int b) {
       if (a < b) [[unlikely]] {
           int x = a * 16 + 7;
           int y = b / 2 + 4;
           return x / y;
       } else {
           int x = a * 2 + 1;
           int y = b * 3 + 2;
           return x * y;
       }    
   }
   ```

   Use `[[likely]]` and `[[unlikely]]` C++ attributes or C macros to modify the program structure.

   ```C
   #define likely(x)      __builtin_expect(!!(x), 1) 
   #define unlikely(x)    __builtin_expect(!!(x), 0) 
   ```

   The idea: the standard branch prediction heuristic assumes that a forward branch is always taken.
   This means that the instructions of the `if` branch will be fetched by the CPU.
   However, we can mark the condition as _unlikely_ and the compiler will change the program structure
   in such a way that the `else` branch instructions will be fetched by the CPU.

   * Compile the program marking different branches with `[[unlikely]]`/`[[likely]]` and see the difference.

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
   Use the _loop unrolling_ technique to make calculations faster.

   An unoptimized C implementation look like this:
   
   ```C
   #include <stdio.h>
   
   int func(short *array, int size) {
       int result = 0;
       for (int i = 0; i < size; ++i) {
           short value = array[i];
           if (i % 2 == 0) {
               result += value;
           } else {
               result -= value;
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

## References

* Optimizing program performance. Chapter 5 in [[CSPP]](../../books.md#cspp).
* [MIT 6.172](
  https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2018).
  Lecture 2. [Slides](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2018/lecture-slides/MIT6_172F18_lec2.pdf).
* [Loop unrolling](https://en.wikipedia.org/wiki/Loop_unrolling) (Wikipedia).
* [Loop-invariant code motion](https://en.wikipedia.org/wiki/Loop-invariant_code_motion) (Wikipedia).
* [Profiling](https://en.wikipedia.org/wiki/Profiling_%28computer_programming%29) (Wikipedia).
* [Program optimization](https://en.wikipedia.org/wiki/Program_optimization) (Wikipedia).
* [Branch prediction macros in GCC](https://www.geeksforgeeks.org/branch-prediction-macros-in-gcc/) (GeeksForGeeks).
* [C++ attribute: likely, unlikely (since C++20)](https://en.cppreference.com/w/cpp/language/attributes/likely).
