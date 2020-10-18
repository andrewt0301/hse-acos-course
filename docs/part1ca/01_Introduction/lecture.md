Lecture 1
---

# Introduction into Computer Architecture

## Lecture

Slides ([PDF](CA_Lecture_01.pdf), [PPTX](CA_Lecture_01.pptx)).

#### Outline

* Introduction.
* Information on course administration.
* Course motivation.
* Historical overview.
* Computer architecture and organization.

## Quiz

__TODO__

## Workshop

#### Outline

* Introduction: instructor meets class.
* Information on workshop organisation (goals, topics)
  and administration (attendance, homeworks, grading).
* Introduction to [software tools](../../software.md).
   * RARS.
   * Virtual Box. 
   * Linux Ubuntu VM.
* Practice: play with matrix multiplication and see the benchmarks.

#### Tasks

* Read documentation on software tools (RARS, Virtual Box, Ubuntu).
* Download and install the tools.
* Download, compile, and run matrix computation examples.
   * [Python](
     https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/01_Introduction/matrix.py).
     __TODO__
   * [Java](
     https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/01_Introduction/Matrix.java).
     __TODO__
   * [C](
     https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/01_Introduction/matrix.c).
     __TODO__
   * [C optimized](). __TODO__

## Homework

* Finish installing all required software.
* Finish experiments with matrix multiplication and provide benchmarks.
   * Run matrix multiplication in Python and C (all versions) in your machine.
   * Provide a table with execution time.
* Send the file with table to your instructor.

## References

* [Von Neumann architecture](https://en.m.wikipedia.org/wiki/Von_Neumann_architecture) (Wikipedia).
* [Turing machine](https://en.m.wikipedia.org/wiki/Turing_machine) (Wikipedia).
* History of computers and operating systems. Chapter 1 in [[MOS]](../../books.md).
* Computer technology overview. Chapter 1 in [[CODR]](../../books.md).

```
(base) Andreis-MacBook-Pro:01_Introduction andrew$ ./matrix_jki 
19.083199
(base) Andreis-MacBook-Pro:01_Introduction andrew$ cc matrix.c -o matrix
(base) Andreis-MacBook-Pro:01_Introduction andrew$ ./matrix
14.641458
(base) Andreis-MacBook-Pro:01_Introduction andrew$ gcc
clang: error: no input files
(base) Andreis-MacBook-Pro:01_Introduction andrew$ gcc matrix.c -o matrix
(base) Andreis-MacBook-Pro:01_Introduction andrew$ ./matrix
14.157631
(base) Andreis-MacBook-Pro:01_Introduction andrew$ vi matrix.py 
(base) Andreis-MacBook-Pro:01_Introduction andrew$ java Matrix
12.946224373000002
(base) Andreis-MacBook-Pro:01_Introduction andrew$ ./matrix
13.714264
(base) Andreis-MacBook-Pro:01_Introduction andrew$ ./matrix_ikj 
2.739385
(base) Andreis-MacBook-Pro:01_Introduction andrew$ ./matrix_jki 
19.074106
(base) Andreis-MacBook-Pro:01_Introduction andrew$ python3 matrix.py
503.130450
```

