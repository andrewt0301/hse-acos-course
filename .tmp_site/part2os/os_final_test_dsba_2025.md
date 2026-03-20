# Final Test: Operating Systems

__The link for the submission form is [here](https://forms.gle/B5fuRo48EAWZTCZ97).__

The grade formula is as follows:

__Grade = 0.4 * Theory + 0.6 * Programming__

## Part 1. Theoretical Questions

Answer the theoretical questions in a few sentences (1-2 paragraphs for a question).

Use __your own words__.
Copy-paste from external sources and other students will result in 100% penalty.

1. Memory management.
   * Memory layout of a process: What memory segments do you know? What purposes do they serve? What are their distinct features?
   * What ways to allocate memory do you know? Compare their performance.
   * How dynamic memory allocation via `malloc`/`free` is implemented (using what data structures)?
   * Give definitions of payload, fragmentation (internal and external), and placement strategies.
   * Briefly describe the idea of splitting and coalescing.
   * What is the purpose of the `sbrk` system call?
   * What real world memory allocators do you know? What are common challenges for them?

1. Processes.
   * What is a process? What parts does it contain (its layout in memory)?
   * What states does a process have (how they change)? Also, explain how CPU switches between processes.
   * Describe the idea of process creation with system calls `fork` and `exec`. What is the role of system call `wait`?
   * What is file descriptor? What standard descriptors do you know?
     What happens with descriptors when a child process is created?
     Describe the idea input/output redirection.
   * Explain the idea of shared memory. How is it connected with shared libraries?

1. Permissions.
   * What access rights do you know? What permission groups do you know?
   * How to view and how to change file permissions (what utility tools to use)? How to change file ownership?
   * Give definitions of hard and soft links, explain the differences between them. How to create links?
   * Explain the `setuid`/`setguid` permissions.
   * Study the text below. What can you say about `file1`, `file2`, `file3`, and `file4`?
   
   ```bash
   35390128 -rwsr-xr-x 2 andrewt acos 15776 Jun 16 02:16 file1
   35390138 lrwxrwxrwx 1 myuser  acos     5 Jun 16 02:18 file2 -> file3
   35390137 drwxrwxr-x 2 andrewt acos  4096 Jun 16 02:17 file3
   35390128 -rwsr-xr-x 2 andrewt acos 15776 Jun 16 02:16 file4
   ```

## Part 2. Programming Task

Write a program in C that does the following:

* Calculates the value of the specified function `f(x)` in the range from `argv[1]` to `argv[2]` with step `argv[3]`.
* Writes pairs `x, f(x)` into text file `output.csv` ([CSV](https://en.wikipedia.org/wiki/Comma-separated_values) format).  
* The function to be calculated has the following format:
  ``` 
  f(x) = f0(f1(x), f2(x), f3(x), f4(x))
  ```
  , where:
    * `x` is the function argument;
    * `f0`-`f4` are functions that are individual according to the variant.

### Example of Function (you need your variant, see below)

_Note_: the `^` symbol means "power".

    f0(a, b, c, d) = (a - b + c - d) / 2
    f1(x) = 2*x^3 - 4*x^2 + 3*x + 1
    f2(x) = sin(5*x)*4 + 3
    f3(x) = 1 / (1 + e^(-7*x))
    f4(x) = 2^x + 5

### Requirements and Grades

* ___4 Points___:
  make all calculations and write to file in a __parent__ process;
  provide a Makefile to build the program;
* ___5 Points___:
  write to a file using output redirection (redirect the standard output
  to the file using [dup2](https://man7.org/linux/man-pages/man2/dup.2.html));
* ___6 Points___:
  make all calculations and write to the file in a __child__ process
  (use [fork](https://man7.org/linux/man-pages/man2/fork.2.html));
* ___8 Points___:
  execute the __f0__ function for the entire value range in a __child__ process
  and send the resulting values to the parent process using
  a [pipe](https://man7.org/linux/man-pages/man2/pipe.2.html);
* ___10 Points___:
  execute __f0__ in the __parent__ process and __f1__-__f4__ in separate __child__ processes;
  return the calculated values of __f1__-__f4__ to __f0__ using a pipe (you will need 4 pipes).

__NOTE__: Your program must _call `fork` no more than 4 times_ (for f1-f4). In the past, an invalid solution
with 4*N calls to `fork` was distributed among students. Such code will not be accepted (0 points).
This solution is very bad because it will be slower that a single-process solution.
Running in parallel is aimed to improve performance, while extra system calls are very expensive
(especially `fork`) and may totally kill this advantage. Try to keep the number of system calls to minimum.

### Hints

* Function `f0` have the following  structure:
  ```c
  double f0(double a, double b, double c, double d) {
      return <math expr>;
  }
  ```
* Functions `f1`-`f4` have the following  structure:
  ```c
  double f1(double x) {
      return <math expr>;
  }
  ```
* Command-line arguments (strings) can be converted to `double` using the [atof](
  https://man7.org/linux/man-pages/man3/atof.3.html) function.
* Mathematical functions (such as `sin`, `cos`, `pow`, `exp` etc.) and constants (`M_E`) are in the [math.h](
  https://man7.org/linux/man-pages/man0/math.h.0p.html) library.
  The program must be linked with the library: use the `-lm` GCC flag.
* To write to a file, [open](https://man7.org/linux/man-pages/man2/open.2.html) the file and redirect the standard output
  (`STDOUT_FILENO`) to this file with the [dup2](https://man7.org/linux/man-pages/man2/dup.2.html) system call.
  When you do this, you will be able to use `printf` to print to the file. If you do this in the parent process,
  redirection will work in both processes (parent and child).
* Sending data from child to parent using a pipe: see example in the [manual](
  https://man7.org/linux/man-pages/man2/pipe.2.html).
  * _Child_: `f(x)` is calculated for a range of values and results (`x` and `f(x)`) are written (`write(pfd[1], &x, sizeof(x))`) to the pipe;
  * _Parent_: results (`x` and `f(x)`) are read (`read(pfd[0], &x, sizeof(x))`) from the pipe in a loop and printed.
 
### Variants

Choose your __variant number__ according to __your number in your group__.

See the lists of students [here](
https://docs.google.com/spreadsheets/d/1iaO6hQZfhSpIam7TED384-BaHH1kChlq67U8fgRuNSI/edit?usp=sharing).

Variants for groups:

* [Group 231](variants_dsba_2025_g231.md)
* [Group 232](variants_dsba_2025_g232.md)
* [Group 233](variants_dsba_2025_g233.md)
* [Group 234](variants_dsba_2025_g234.md)

_Note_: the `^` symbol means "power".
