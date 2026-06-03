Final Test: Operating Systems
---

## Grading

The grade formula is as follows:

__Grade = 0.4 * Theory + 0.6 * Programming__

### Video

Form for video is [here](https://forms.gle/nogmLhVgYSa7A64X9).

### Submission

Form for theory and program is [here](https://forms.gle/nhn5SNjmnVdxoaHA9).

## Rules

It is allowed to use only a text editor and Linux console (with all related commmand-line tools). No lecture materials, AI, or Google search.
[Cheating policy](../grades.md#cheating-policy) applies here.

## Proctoring

You must record a video of your __desktop + video + audio__ with [OBS Studio](https://obsproject.com), upload it to your cloud drive, and [submit](#video) a link to it. The suggested format for video is `.mkv`.

Solving both parts (theory and programming) must be recorded. Please start video-recording before you start solving enything.

The [form](#video) for submitting video will be avaialble for several hours after the deadline in case uploading video takes a long time.

## Part 1. Theoretical Questions

Please answer the questions from the [form](#submission).

## Part 2. Programming Task

Please solve the programming task below and submit it to the [form](#submission).
Send the source code and the Make file as a text (merge them and submit to a text field).

### Task

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

* Function `f0` has the following  structure:
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
https://docs.google.com/spreadsheets/d/1SLz62hBvVooonQb5VpfwELxt-Xh22oyiFM-gSPcJdoM/edit?usp=sharing).

Variants for groups:

* [Group 241](variants_dsba_2026_g241.md)
* [Group 242](variants_dsba_2026_g242.md)
* [Group 243](variants_dsba_2026_g243.md)
* [Group 244](variants_dsba_2026_g244.md)
* [Group 245](variants_dsba_2026_g245.md)
* [Group 246](variants_dsba_2026_g246.md)

_Note_: the `^` symbol means "power".
