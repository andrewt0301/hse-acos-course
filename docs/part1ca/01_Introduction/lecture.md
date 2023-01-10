Lecture 1
---

# Introduction and Motivation

## Lecture

Slides ([PDF](CA_Lecture_01.pdf), [PPTX](CA_Lecture_01.pptx)).

#### Outline

* Introduction.
* Information on course administration.
* Course motivation.
* Historical perspective.

## Workshop

#### Outline

* Introduction: the instructor meets the class.
* Information on workshop organisation (goals, topics).
  and administration (attendance, homeworks, grading).
* Introduction to [software tools](../../software.md).
   * RARS.
   * Godbolt.
   * VirtualBox. 
   * Linux Ubuntu VM.
* Introduction to Cloud [Ubuntu VM](../../software/cloud_ssh.md) via [SSH](https://en.wikipedia.org/wiki/Secure_Shell).
* Introduction to Git and GitHub.
* Practice: play with matrix multiplication and see the benchmarks.

#### Tasks

* Read documentation on software tools (RARS, Virtual Box, Ubuntu).
* Download and install the tools.
* Generate [SSH keys](../../software/cloud_ssh.md) for access to Cloud and GitHub.
  Save the public key to the [table](
  https://docs.google.com/spreadsheets/d/1AcuDJwfho_MzBqayo9dhVKe1iqPnUcMEjUkB1mVog60/edit?usp=sharing).
* [Create](git.md) a private GitHub repository and give access to it to the lecturer,
  workshop instructor, and teaching assistant.
   * Name it `<group>_<surname>`, e.g. `204_tatarnikov` 
* Download, compile, and run matrix computation examples:
   * [Python](
     https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/01_Introduction/matrix.py).
   * [Java](
     https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/01_Introduction/Matrix.java).
   * [C basic (ijk)](
     https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/01_Introduction/matrix.c).
   * [C optimized (ikj)](
     https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/01_Introduction/matrix_ikj.c).
   * [C incorrectly optimized (jki)](
     https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/01_Introduction/matrix_jki.c).

#### Notes

##### VirtualBox

Some laptops might have issues with hardware virtualization.
It should be enabled in BIOS.
If you face problems running the VM, please refer to this [instruction]( 
https://bce.berkeley.edu/enabling-virtualization-in-your-pc-bios.html).

##### Connecting to the running VirtualBox VM

1. Run terminal in your host operating system (Git Bash for Windows).
1. Execute the following command:
   ```bash
   ssh acos@localhost -p2022
   ```
1. Use the password `acos2020`.

##### Bash Commands

Information on useful Linux and MacOS command-line tools can be found [here](bash.md).

##### Git and GitHub

Notes on how to work with GitHub and Git can be found [here](git.md). 

#### Example

For example, a MacBook with the following configuration:

```
Model Name:                 MacBook Pro
Model Identifier:           MacBookPro9,1
Processor Name:             Quad-Core Intel Core i7
Processor Speed:            2,3 GHz
Number of Processors:       1
Total Number of Cores:      4
L2 Cache (per Core):        256 KB
L3 Cache:                   6 MB
Hyper-Threading Technology: Enabled
Memory:                     8 GB
```
gives these results:

```
(base) Andreis-MacBook-Pro:01_Introduction andrew$ javac Matrix.java
(base) Andreis-MacBook-Pro:01_Introduction andrew$ gcc matrix.c -o matrix
(base) Andreis-MacBook-Pro:01_Introduction andrew$ gcc matrix_ikj.c -o matrix_ikj
(base) Andreis-MacBook-Pro:01_Introduction andrew$ gcc matrix_jki.c -o matrix_jki
(base) Andreis-MacBook-Pro:01_Introduction andrew$ python3 matrix.py
503.130450
(base) Andreis-MacBook-Pro:01_Introduction andrew$ java Matrix
12.946224373000002
(base) Andreis-MacBook-Pro:01_Introduction andrew$ ./matrix
13.714264
(base) Andreis-MacBook-Pro:01_Introduction andrew$ ./matrix_ikj 
2.739385
(base) Andreis-MacBook-Pro:01_Introduction andrew$ ./matrix_jki 
19.074106
```

## Homework

* Finish installing all required software.
* Save a link to the SSH public key to the [table](
  https://docs.google.com/spreadsheets/d/1AcuDJwfho_MzBqayo9dhVKe1iqPnUcMEjUkB1mVog60/edit?usp=sharing). 
* Finish experiments with matrix multiplication and provide benchmarks (for your machine).
   * Run matrix multiplication in Python and C (all versions) in your machine.
   * Provide a table with execution time.
* Commit the file with the table to your private GitHub account. Place it into the folder `ca/lab01`.

Homework is successful if:

1. GitHub account is created.
2. Table with execution time is uploaded to GitHub.
3. Cloud VM account is created.

## References

* History of computers and operating systems. Chapter 1 in [[MOS]](../../books.md).
* Computer technology overview. Chapter 1 in [[CODR]](../../books.md).
* [MIT 6.172](
  https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2018).
  Lecture 1.
* [FLOPS](https://en.wikipedia.org/wiki/FLOPS) (Wikipedia).
* [Analytical Engine](https://en.wikipedia.org/wiki/Analytical_Engine) (Wikipedia).
* [Von Neumann Architecture](https://en.wikipedia.org/wiki/Von_Neumann_architecture) (Wikipedia).
* [Turing machine](https://en.wikipedia.org/wiki/Turing_machine) (Wikipedia).
* [Moore's law](https://en.wikipedia.org/wiki/Moore%27s_law) (Wikipedia).
* [Internet of Things](https://en.wikipedia.org/wiki/Internet_of_things) (Wikipedia).
* Compiler Explorer [Godbolt](https://godbolt.org/)
