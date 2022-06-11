# Final Test: Operating Systems

The grade formula is as follows:

__Grade = 0.4 * Theory + 0.6 * Programming__

## Part 1. Theoretical Questions

Answer the theoretical questions in a few sentences (1-2 paragraphs for a question).

Use __your own words__.
Copy-paste from external sources and other students will result in 100% penalty.

1. Operating system achitecture.
   * List the main components of an operating system.
   * List the tasks a typical operating system solves.
   * What is a system call?

2. Processes and threads.
   * Give definitions of process and thread.
   * What is the difference between them?
   * What inter-process communication mechanisms do you know?
   * What synchronization mechanisms do you now?

3. Permissions.
   * What Linux files types to you know?
   * What access rights and permission groups do you know?
   * Study the output of the `ls -li` command below.
   * What can you say about `file1`, `file2`, and `file3`?

     ```bash
     acos@acos-vm:~/folder$ ls -li
     total 44
     268508 -rwsr-xr-x 2 myuser acos 16832 июн 17 14:04 file1
     262605 drwxr-xr-- 2 acos   acos  4096 июн 17 14:08 file2
     268508 -rwsr-xr-x 2 myuser acos 16832 июн 17 14:04 file3
    ```

## Part 2. Programming Task

Write a program in C that does the following:

* Calculates the value of the specified function in the range
  from `argv[1]` to `argv[2]` with step `argv[3]`.
* Writes pairs `<function argument>, <function result>)` into text file `output.csv`
  ([CSV](https://en.wikipedia.org/wiki/Comma-separated_values) format).  
* The function to be calculated has the following format:
  ``` 
  f(x) = f0(f1(x), f2(x), f3(x), f4(x))
  ```
  , where:
    * `x` is the function argument;
    * `f0`-`f4` are functions that are individual according to the variant.

Requirements:

* _Grade 4_: make all calculations in a single process;
* _Grade 8_: execute the __f0__ function for the entire value range in a __child process__
  and return the resulting values to the parent process using __IPC__ (a _pipe_ or other type of IPC you like);
* _Grade 10_: execute __f0__ in the parent process and __f1__-__f4__ in separate child processes.
  Return the calculated values of __f1__-__f4__ to __f0__ using __IPC__ (a _pipe_ or other type of IPC you like).

#### Hints

* Functions `f1`-`f4` have the following  structure:
  ```c
  double f1(double x) {
      return <math expr>;
  }
  ```
* Command-line arguments (strings) can be converted to `double` using
  the [atof](https://man7.org/linux/man-pages/man3/atof.3.html) function.
* Mathematical functions (such as `sin`, `cos`, `pow`, `exp` etc.) and constants (`M_E`) are
  provided in the [math.h](https://man7.org/linux/man-pages/man0/math.h.0p.html) library.
* Programs using library `<math.h>` must be linked with the `m` library: use the `-lm` GCC flag.
* Use the [fopen](https://cplusplus.com/reference/cstdio/fopen/),
          [fprintf](https://cplusplus.com/reference/cstdio/fprintf/), and
          [fclose](https://cplusplus.com/reference/cstdio/fclose/)
  functions to write data to the file.
* Multi-process calculations:
  * _Child_: a function is calculated for a range of values and results are written to IPC;
  * _Parent_: values are read from IPC in a loop and printed or used in other calculations. 

### Variants

Choose your variant number according to your number in the [list of students](
https://docs.google.com/spreadsheets/d/1RkbWDML8gzofGkz288NcYIuEtrKMY4jPowxYSxt1m1Q/edit#gid=0).

Note: the `^` symbol means "power".

---
#### Group 191

1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 7*x^3 + 5*x^2 + 3*x + 2
	f2(x) = sin(2*x)*3 + 2
	f3(x) = 3^x + 5
	f4(x) = 1 / (1 + e^(-2*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 6*x^3 + 9*x^2 + 3*x + 6
	f2(x) = sin(9*x)*4 + 7
	f3(x) = 2^x + 5
	f4(x) = 1 / (1 + e^(-7*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 2*x^3 + 6*x^2 + 6*x + 9
	f2(x) = sin(3*x)*7 + 3
	f3(x) = 7^x + 9
	f4(x) = 1 / (1 + e^(-7*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 6*x^3 + 2*x^2 + 9*x + 3
	f2(x) = sin(2*x)*4 + 6
	f3(x) = 5^x + 8
	f4(x) = 1 / (1 + e^(-4*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 4*x^3 + 8*x^2 + 5*x + 2
	f2(x) = sin(4*x)*5 + 6
	f3(x) = 9^x + 7
	f4(x) = 1 / (1 + e^(-8*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 3*x^3 + 7*x^2 + 2*x + 5
	f2(x) = sin(9*x)*4 + 9
	f3(x) = 4^x + 3
	f4(x) = 1 / (1 + e^(-6*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 5*x^3 + 5*x^2 + 7*x + 6
	f2(x) = sin(3*x)*8 + 2
	f3(x) = 8^x + 5
	f4(x) = 1 / (1 + e^(-8*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 7*x^3 + 8*x^2 + 5*x + 4
	f2(x) = sin(5*x)*4 + 2
	f3(x) = 7^x + 9
	f4(x) = 1 / (1 + e^(-8*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 7*x^3 + 7*x^2 + 7*x + 3
	f2(x) = sin(2*x)*6 + 8
	f3(x) = 3^x + 3
	f4(x) = 1 / (1 + e^(-2*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 5*x^3 + 4*x^2 + 7*x + 2
	f2(x) = sin(6*x)*9 + 5
	f3(x) = 4^x + 2
	f4(x) = 1 / (1 + e^(-4*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 5*x^3 + 9*x^2 + 3*x + 2
	f2(x) = sin(6*x)*2 + 8
	f3(x) = 7^x + 3
	f4(x) = 1 / (1 + e^(-4*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 5*x^3 + 8*x^2 + 2*x + 7
	f2(x) = sin(4*x)*5 + 5
	f3(x) = 8^x + 6
	f4(x) = 1 / (1 + e^(-5*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 6*x^3 + 2*x^2 + 7*x + 6
	f2(x) = sin(3*x)*3 + 2
	f3(x) = 6^x + 2
	f4(x) = 1 / (1 + e^(-7*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 9*x^3 + 6*x^2 + 3*x + 5
	f2(x) = sin(8*x)*7 + 8
	f3(x) = 5^x + 2
	f4(x) = 1 / (1 + e^(-6*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 3*x^3 + 2*x^2 + 7*x + 2
	f2(x) = sin(6*x)*7 + 2
	f3(x) = 2^x + 9
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 6*x^3 + 9*x^2 + 2*x + 9
	f2(x) = sin(5*x)*3 + 4
	f3(x) = 9^x + 7
	f4(x) = 1 / (1 + e^(-6*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 2*x^3 + 2*x^2 + 7*x + 9
	f2(x) = sin(7*x)*3 + 7
	f3(x) = 7^x + 3
	f4(x) = 1 / (1 + e^(-5*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 5*x^3 + 2*x^2 + 7*x + 2
	f2(x) = sin(5*x)*8 + 5
	f3(x) = 6^x + 7
	f4(x) = 1 / (1 + e^(-9*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 9*x^3 + 6*x^2 + 8*x + 3
	f2(x) = sin(8*x)*5 + 7
	f3(x) = 4^x + 8
	f4(x) = 1 / (1 + e^(-8*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 3*x^3 + 3*x^2 + 4*x + 7
	f2(x) = sin(3*x)*7 + 5
	f3(x) = 6^x + 4
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 5*x^3 + 8*x^2 + 7*x + 2
	f2(x) = sin(9*x)*9 + 7
	f3(x) = 4^x + 5
	f4(x) = 1 / (1 + e^(-9*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 9*x^3 + 9*x^2 + 2*x + 3
	f2(x) = sin(7*x)*8 + 6
	f3(x) = 2^x + 6
	f4(x) = 1 / (1 + e^(-6*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 3*x^3 + 5*x^2 + 4*x + 3
	f2(x) = sin(5*x)*3 + 8
	f3(x) = 2^x + 4
	f4(x) = 1 / (1 + e^(-4*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 4*x^3 + 6*x^2 + 3*x + 5
	f2(x) = sin(9*x)*3 + 4
	f3(x) = 2^x + 3
	f4(x) = 1 / (1 + e^(-2*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 3*x^3 + 5*x^2 + 3*x + 5
	f2(x) = sin(4*x)*5 + 5
	f3(x) = 4^x + 6
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 3*x^3 + 9*x^2 + 2*x + 5
	f2(x) = sin(4*x)*7 + 4
	f3(x) = 9^x + 4
	f4(x) = 1 / (1 + e^(-2*x))
	```

---
#### Group 192

1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 7*x^3 + 9*x^2 + 8*x + 2
	f2(x) = sin(4*x)*5 + 3
	f3(x) = 4^x + 2
	f4(x) = 1 / (1 + e^(-2*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 8*x^3 + 8*x^2 + 5*x + 3
	f2(x) = sin(3*x)*2 + 8
	f3(x) = 6^x + 2
	f4(x) = 1 / (1 + e^(-9*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 3*x^3 + 5*x^2 + 2*x + 5
	f2(x) = sin(9*x)*4 + 8
	f3(x) = 5^x + 7
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 2*x^3 + 3*x^2 + 5*x + 8
	f2(x) = sin(5*x)*9 + 2
	f3(x) = 5^x + 4
	f4(x) = 1 / (1 + e^(-4*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 2*x^3 + 9*x^2 + 7*x + 2
	f2(x) = sin(7*x)*4 + 4
	f3(x) = 8^x + 9
	f4(x) = 1 / (1 + e^(-8*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 9*x^3 + 5*x^2 + 2*x + 6
	f2(x) = sin(9*x)*4 + 7
	f3(x) = 5^x + 2
	f4(x) = 1 / (1 + e^(-6*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 9*x^3 + 7*x^2 + 5*x + 7
	f2(x) = sin(5*x)*9 + 7
	f3(x) = 6^x + 2
	f4(x) = 1 / (1 + e^(-6*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 7*x^3 + 9*x^2 + 6*x + 3
	f2(x) = sin(6*x)*5 + 7
	f3(x) = 8^x + 3
	f4(x) = 1 / (1 + e^(-4*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 4*x^3 + 8*x^2 + 8*x + 5
	f2(x) = sin(3*x)*5 + 9
	f3(x) = 9^x + 8
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 8*x^3 + 6*x^2 + 6*x + 8
	f2(x) = sin(8*x)*2 + 2
	f3(x) = 8^x + 3
	f4(x) = 1 / (1 + e^(-6*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 7*x^3 + 7*x^2 + 5*x + 5
	f2(x) = sin(7*x)*6 + 5
	f3(x) = 8^x + 5
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 7*x^3 + 8*x^2 + 8*x + 2
	f2(x) = sin(5*x)*4 + 3
	f3(x) = 9^x + 2
	f4(x) = 1 / (1 + e^(-9*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 4*x^3 + 3*x^2 + 3*x + 5
	f2(x) = sin(4*x)*3 + 5
	f3(x) = 7^x + 7
	f4(x) = 1 / (1 + e^(-7*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 2*x^3 + 2*x^2 + 8*x + 5
	f2(x) = sin(3*x)*6 + 4
	f3(x) = 5^x + 3
	f4(x) = 1 / (1 + e^(-4*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 7*x^3 + 2*x^2 + 3*x + 2
	f2(x) = sin(2*x)*2 + 9
	f3(x) = 6^x + 5
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 4*x^3 + 4*x^2 + 9*x + 8
	f2(x) = sin(4*x)*7 + 3
	f3(x) = 2^x + 7
	f4(x) = 1 / (1 + e^(-8*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 5*x^3 + 4*x^2 + 4*x + 8
	f2(x) = sin(8*x)*2 + 8
	f3(x) = 5^x + 9
	f4(x) = 1 / (1 + e^(-9*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 5*x^3 + 4*x^2 + 8*x + 7
	f2(x) = sin(6*x)*6 + 5
	f3(x) = 8^x + 4
	f4(x) = 1 / (1 + e^(-5*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 8*x^3 + 3*x^2 + 7*x + 6
	f2(x) = sin(9*x)*8 + 2
	f3(x) = 7^x + 5
	f4(x) = 1 / (1 + e^(-5*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 4*x^3 + 5*x^2 + 4*x + 6
	f2(x) = sin(9*x)*6 + 6
	f3(x) = 5^x + 5
	f4(x) = 1 / (1 + e^(-6*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 2*x^3 + 7*x^2 + 3*x + 8
	f2(x) = sin(8*x)*7 + 9
	f3(x) = 6^x + 6
	f4(x) = 1 / (1 + e^(-9*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 2*x^3 + 2*x^2 + 2*x + 7
	f2(x) = sin(9*x)*5 + 5
	f3(x) = 7^x + 6
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 4*x^3 + 8*x^2 + 8*x + 6
	f2(x) = sin(7*x)*4 + 5
	f3(x) = 7^x + 4
	f4(x) = 1 / (1 + e^(-7*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 4*x^3 + 4*x^2 + 4*x + 9
	f2(x) = sin(5*x)*4 + 7
	f3(x) = 8^x + 6
	f4(x) = 1 / (1 + e^(-4*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 9*x^3 + 5*x^2 + 9*x + 5
	f2(x) = sin(8*x)*9 + 9
	f3(x) = 4^x + 3
	f4(x) = 1 / (1 + e^(-6*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 3*x^3 + 9*x^2 + 8*x + 9
	f2(x) = sin(6*x)*7 + 3
	f3(x) = 2^x + 6
	f4(x) = 1 / (1 + e^(-2*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 8*x^3 + 9*x^2 + 9*x + 8
	f2(x) = sin(9*x)*8 + 2
	f3(x) = 8^x + 2
	f4(x) = 1 / (1 + e^(-6*x))
	```

---
#### Group 193

1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 2*x^3 + 9*x^2 + 9*x + 3
	f2(x) = sin(2*x)*5 + 7
	f3(x) = 2^x + 7
	f4(x) = 1 / (1 + e^(-8*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 3*x^3 + 2*x^2 + 4*x + 9
	f2(x) = sin(3*x)*7 + 2
	f3(x) = 4^x + 6
	f4(x) = 1 / (1 + e^(-4*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 8*x^3 + 6*x^2 + 6*x + 6
	f2(x) = sin(5*x)*2 + 7
	f3(x) = 6^x + 6
	f4(x) = 1 / (1 + e^(-4*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 4*x^3 + 9*x^2 + 3*x + 6
	f2(x) = sin(5*x)*6 + 9
	f3(x) = 3^x + 6
	f4(x) = 1 / (1 + e^(-5*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 8*x^3 + 2*x^2 + 4*x + 3
	f2(x) = sin(3*x)*9 + 3
	f3(x) = 9^x + 8
	f4(x) = 1 / (1 + e^(-7*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 9*x^3 + 2*x^2 + 8*x + 7
	f2(x) = sin(5*x)*2 + 6
	f3(x) = 5^x + 2
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 4*x^3 + 6*x^2 + 4*x + 8
	f2(x) = sin(6*x)*2 + 2
	f3(x) = 2^x + 4
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 2*x^3 + 7*x^2 + 5*x + 6
	f2(x) = sin(3*x)*7 + 6
	f3(x) = 8^x + 3
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 5*x^3 + 4*x^2 + 5*x + 8
	f2(x) = sin(6*x)*5 + 9
	f3(x) = 6^x + 4
	f4(x) = 1 / (1 + e^(-4*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 5*x^3 + 7*x^2 + 9*x + 4
	f2(x) = sin(2*x)*7 + 9
	f3(x) = 9^x + 5
	f4(x) = 1 / (1 + e^(-7*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 5*x^3 + 7*x^2 + 8*x + 5
	f2(x) = sin(5*x)*2 + 8
	f3(x) = 8^x + 3
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 3*x^3 + 9*x^2 + 2*x + 8
	f2(x) = sin(9*x)*8 + 9
	f3(x) = 2^x + 4
	f4(x) = 1 / (1 + e^(-9*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 2*x^3 + 2*x^2 + 8*x + 9
	f2(x) = sin(7*x)*6 + 9
	f3(x) = 3^x + 4
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 6*x^3 + 9*x^2 + 6*x + 4
	f2(x) = sin(6*x)*6 + 9
	f3(x) = 3^x + 4
	f4(x) = 1 / (1 + e^(-2*x))
	```
1. Variant

	```
	f0(a, b, c, d) = AVG(a, b, c, d) = (a + b + c + d) / 4
	f1(x) = 9*x^3 + 5*x^2 + 6*x + 2
	f2(x) = sin(9*x)*8 + 9
	f3(x) = 4^x + 3
	f4(x) = 1 / (1 + e^(-7*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 7*x^3 + 6*x^2 + 8*x + 5
	f2(x) = sin(9*x)*2 + 7
	f3(x) = 7^x + 9
	f4(x) = 1 / (1 + e^(-9*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 5*x^3 + 6*x^2 + 5*x + 5
	f2(x) = sin(2*x)*3 + 6
	f3(x) = 2^x + 7
	f4(x) = 1 / (1 + e^(-3*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 5*x^3 + 4*x^2 + 3*x + 2
	f2(x) = sin(4*x)*9 + 6
	f3(x) = 7^x + 6
	f4(x) = 1 / (1 + e^(-8*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 5*x^3 + 6*x^2 + 9*x + 9
	f2(x) = sin(3*x)*2 + 7
	f3(x) = 7^x + 3
	f4(x) = 1 / (1 + e^(-7*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 5*x^3 + 9*x^2 + 4*x + 7
	f2(x) = sin(2*x)*7 + 8
	f3(x) = 5^x + 7
	f4(x) = 1 / (1 + e^(-5*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 8*x^3 + 9*x^2 + 6*x + 3
	f2(x) = sin(8*x)*3 + 5
	f3(x) = 5^x + 9
	f4(x) = 1 / (1 + e^(-7*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 2*x^3 + 2*x^2 + 4*x + 5
	f2(x) = sin(8*x)*9 + 8
	f3(x) = 2^x + 3
	f4(x) = 1 / (1 + e^(-8*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 3*x^3 + 4*x^2 + 3*x + 6
	f2(x) = sin(2*x)*7 + 8
	f3(x) = 8^x + 6
	f4(x) = 1 / (1 + e^(-5*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MAX(a, b, c, d)
	f1(x) = 5*x^3 + 8*x^2 + 2*x + 2
	f2(x) = sin(6*x)*5 + 4
	f3(x) = 6^x + 8
	f4(x) = 1 / (1 + e^(-5*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 8*x^3 + 8*x^2 + 6*x + 9
	f2(x) = sin(5*x)*7 + 7
	f3(x) = 6^x + 3
	f4(x) = 1 / (1 + e^(-2*x))
	```
1. Variant

	```
	f0(a, b, c, d) = MIN(a, b, c, d)
	f1(x) = 8*x^3 + 6*x^2 + 5*x + 4
	f2(x) = sin(2*x)*5 + 5
	f3(x) = 5^x + 2
	f4(x) = 1 / (1 + e^(-9*x))
	```
1. Variant

	```
	f0(a, b, c, d) = L2(a, b, c, d) = sqrt(a^2 + b^2 + c^2 + d^2)
	f1(x) = 5*x^3 + 3*x^2 + 5*x + 7
	f2(x) = sin(5*x)*4 + 4
	f3(x) = 8^x + 2
	f4(x) = 1 / (1 + e^(-9*x))
	```
