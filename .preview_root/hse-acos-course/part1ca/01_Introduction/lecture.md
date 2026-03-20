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

##### Example

Measuring performance in different power modes (Linux).

CPU configuration:
```bash
(base) andrewt@ThinkPad-T490s:~/Documents/src/hse/hse-acos-course/docs/part1ca/01_Introduction$ lscpu
Architecture:             x86_64
  CPU op-mode(s):         32-bit, 64-bit
  Address sizes:          39 bits physical, 48 bits virtual
  Byte Order:             Little Endian
CPU(s):                   8
  On-line CPU(s) list:    0-7
Vendor ID:                GenuineIntel
  Model name:             Intel(R) Core(TM) i7-8665U CPU @ 1.90GHz
    CPU family:           6
    Model:                142
    Thread(s) per core:   2
    Core(s) per socket:   4
    Socket(s):            1
    Stepping:             12
    CPU(s) scaling MHz:   17%
    CPU max MHz:          4800.0000
    CPU min MHz:          400.0000
    BogoMIPS:             4199.88
```

Performance:
```bash
(base) andrewt@ThinkPad-T490s:~/Documents/src/hse/hse-acos-course/docs/part1ca/01_Introduction$ cat /proc/cpuinfo | grep MHz
cpu MHz		: 4203.633
cpu MHz		: 4200.157
cpu MHz		: 4200.018
cpu MHz		: 4202.291
cpu MHz		: 4200.038
cpu MHz		: 4200.039
cpu MHz		: 4200.745
cpu MHz		: 4200.007
```

Power Saver:
```bash
(base) andrewt@ThinkPad-T490s:~/Documents/src/hse/hse-acos-course/docs/part1ca/01_Introduction$ cat /proc/cpuinfo | grep MHz
cpu MHz		: 798.948
cpu MHz		: 799.999
cpu MHz		: 799.996
cpu MHz		: 799.981
cpu MHz		: 800.033
cpu MHz		: 799.991
cpu MHz		: 400.000
cpu MHz		: 800.000
```

## Workshop

#### Outline

* Introduction: the instructor meets the class.
* Information on workshop organisation (goals, topics).
  and administration (attendance, homeworks, grading).
* Introduction to [software tools](../../software.md).
   * RARS.
   * Godbolt.
   * VirtualBox. 
   * Linux Ubuntu VM (including connecting to it via [SSH](https://en.wikipedia.org/wiki/Secure_Shell).
* Introduction to Git and GitHub.
* Practice: play with matrix multiplication and see the benchmarks.

#### Tasks

* Read documentation on software tools (RARS, Virtual Box, Ubuntu).
* Download and install the tools.
* Generate [SSH keys](../../software/cloud_ssh.md) for access to Cloud and GitHub.
* [Create](../../software/git.md) a private GitHub repository and give access to it to
  the workshop instructor and teaching assistant.
   * Name it `<group>_<surname>`, e.g. `204_tatarnikov` 
* Download, compile, and run matrix computation examples:
   * [Python](matrix.py)
   * [Java](Matrix.java)
   * [C basic (ijk)](matrix.c)
   * [C optimized (ikj)](matrix_ikj.c)
   * [C incorrectly optimized (jki)](matrix_jki.c)

#### Notes

##### VirtualBox

Some laptops might have issues with hardware virtualization.
It should be enabled in BIOS.
If you face problems running the VM, please refer to this [instruction](
https://www.simplilearn.com/enable-virtualization-windows-10-article).
We have a ready-to-use VirtualBox VM with Linux Ubuntu.
The instruction how to get and deploy it is [here](../../software/ubuntu.md).

##### Connecting to the running VirtualBox VM

1. Run terminal in your host operating system (Git Bash for Windows).
1. Execute the following command:
   ```bash
   ssh acos@localhost -p2022
   ```
1. Use the password `acos2020`.

##### Bash Commands

Information on useful Linux and MacOS command-line tools can be found [here](../../software/bash.md).

##### Git and GitHub

Notes on how to work with GitHub and Git can be found [here](../../software/git.md). 

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

__NOTE: This is a self-study activity, do not need to hand in, no checking, no score.__

* Finish installing all required software.
* Finish experiments with matrix multiplication and provide benchmarks (for your machine).
   * Run matrix multiplication in Python and C (all versions) in your machine.
   * Provide a table with execution time.
* Collect information on your CPU (`lscpu` utility in Linux) and save it to a text file.
* Commit the file with the table and CPU information to your private GitHub account. Place it into the folder `ca/lab01`.

## References

* History of computers and operating systems. Chapter 1 in [[MOS]](../../books.md#mos).
* Computer technology overview. Chapter 1 in [[CODR]](../../books.md#codr).
* Hardware and its Habits. Chapter 3 in [[PARL]](../../books.md#parl).
* [MIT 6.172](
  https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2018).
  Lecture 1.
* [FLOPS](https://en.wikipedia.org/wiki/FLOPS) (Wikipedia).
* [Analytical Engine](https://en.wikipedia.org/wiki/Analytical_Engine) (Wikipedia).
* [Von Neumann Architecture](https://en.wikipedia.org/wiki/Von_Neumann_architecture) (Wikipedia).
* [Turing machine](https://en.wikipedia.org/wiki/Turing_machine) (Wikipedia).
* [Moore's law](https://en.wikipedia.org/wiki/Moore%27s_law) (Wikipedia).
* [CPU throttling](https://en.wikipedia.org/wiki/Dynamic_frequency_scaling) (Wikipedia).
* Compiler Explorer [Godbolt](https://godbolt.org/).
* Utility [lscpu](https://man7.org/linux/man-pages/man1/lscpu.1.html).
