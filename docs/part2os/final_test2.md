# Final Test: Operating Systems

The grade formula is as follows:

__Grade = 0.4 * Theory + 0.6 * Programming__

## Part 1. Theoretical Questions

Answer the theoretical questions in a few sentences (1-2 paragraphs for a question).

Use __your own words__.
Copy-paste from external sources and other students will result in 100% penalty.

1. Memory management.
   * What ways to allocate memory do you know?
   * How dynamic memory allocation is implemented in C?
   * How does memory mapping and shared memory work?

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
     262605 drwxr-xr-- 1 acos   acos  4096 июн 17 14:08 file2
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

* Execute __f0__ in the parent process and __f1__-__f4__ in separate child processes.
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
* Use the `fopen`, `fprintf`, and `fclose` functons to write data to the file.
* Multi-process calculations:
  * _Child_: a function is calculated for a range of values and results are written to IPC;
  * _Parent_: values are read from IPC in a loop and printed or used in other calculations. 

### Variants

Choose your variant number according to your number in the [list of students](
https://docs.google.com/spreadsheets/d/1RkbWDML8gzofGkz288NcYIuEtrKMY4jPowxYSxt1m1Q/edit#gid=0).

Note: the `^` symbol means "power".

---
Variant

```
f0(a, b, c, d) = (a - b + c - d) / 2
f1(x) = 2*x^3 - 4*x^2 + 3*x + 1
f2(x) = sin(5*x)*4 + 3
f3(x) = 1 / (1 + e^(-7*x))
f4(x) = 2^x + 5
```
