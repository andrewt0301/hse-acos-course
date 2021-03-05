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

## Workshop

#### Outline

* Discuss most important optimizations from the lecture.
* Use the RISC-V toolchain to compile C programs with optimizations.
    * Study examples of optimized and unoptimized C programs.
    * Review the assembly code generate by the compiler.
    * Try different levels of compiler optimizations (`-01`, `-02`). 
* Practice implementing optimizations in the RISC-V assembly.

#### Using the RISC-V Toolchain

__TODO__

#### Examples

__TODO__

#### Tasks

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
