# Using Debuggers

## Debuggers 

Debugger is a tool for dynamic analysis program execution path and memory usage
  * High-level: step-by-step C source execution and variable inspection
  * Low-level: assembler instructions execution and memory/register dump

Compiling for debug: `cc -O0 -g program.c -o binaryprog`
 * `-O0` — turn off optimization. The higher level of optimization is,
    the more "reorganization" of assembler code is done.
    Debugging optimized binary is tricky, because there is no strict correspondence 
    of C source code and result assembler code. More than that, some unneeded constructions usually "optimized out"
 * `-g` — include C source references in binary file (you still need the source file itself)
 * `-o binaryprog` — set result binary file name

### Debugging with `gdb`

1. Example program:

```c
#include <stdio.h>
#define SIZE 10

int A[SIZE] = {7,6,5,4,3,2,1,0,1,2};
int B[SIZE];

void fun(int *a, int *b, int len) {
    int i;

    for(i=0; i<len; i++)
        b[i] = a[i];
}

int main(int argc, char *argv[]) {
    fun(A, B, 100500);
    return 0;
}
```

1. start with `gdb binaryprog`

1. first set a breakpoint to `main()` function (it always exists in C program)

```
(gdb) b main
Breakpoint 1 at 0x400758: file arrr.c, line 15.
```

1. run program until breakpoint is reached with `r`

```
(gdb) r
Starting program: /home/george/src/arrr
Breakpoint 1, main (argc=1, argv=0x7fbf7854) at arrr.c:15
15              fun(A, B, 100500);
```

1. step into function call with `s`:

```
(gdb) s
fun (a=0x4108c0 <A>, b=0x410950 <B>, len=100500) at arrr.c:10
10              for(i=0; i<len; i++)
```

1. run next c code (executing function call as "one" instruction) with `n`

```
(gdb) n
11                      b[i] = a[i];
(gdb) n
10              for(i=0; i<len; i++)
(gdb)
11                      b[i] = a[i];
(gdb)
10              for(i=0; i<len; i++)
(gdb)
11                      b[i] = a[i];
```

Also you can just press enter for repeating last command

1. print a variable with `p`

```
(gdb) p a
$1 = (int *) 0x4108c0 <A>
(gdb) p B
$2 = {7, 6, 0, 0, 0, 0, 0, 0, 0, 0}
(gdb) p i
$3 = 2
```

(`$1`, `$2` etc. is the number of expressions printed)

1. Add an expression to display list to display it on all command with `display`:

```
(gdb) display i
1: i = 2
(gdb) n
10              for(i=0; i<len; i++)
1: i = 2
(gdb)
11                      b[i] = a[i];
1: i = 3
(gdb)
10              for(i=0; i<len; i++)
1: i = 3
```

1. quit with q

```
(gdb) q
A debugging session is active.

        Inferior 1 [process 10578] will be killed.

Quit anyway? (y or n) y
```

### Using Breakpoints

```
[user@sugon]$ gdb arrr
...
(gdb) b fun
Breakpoint 1 at 0x4006c8: file arrr.c, line 10.
(gdb) r
Starting program: /home/george/src/arrr
Breakpoint 1, fun (a=0x4108c0 <A>, b=0x410950 <B>, len=100500) at arrr.c:10
10              for(i=0; i<len; i++)
(gdb) bt
#0  fun (a=0x4108c0 <A>, b=0x410950 <B>, len=100500) at arrr.c:10
#1  0x00400774 in main (argc=1, argv=0x7fbf7854) at arrr.c:15
(gdb) c
Continuing.

Program received signal SIGSEGV, Segmentation fault.
0x004006f8 in fun (a=0x4108c0 <A>, b=0x410950 <B>, len=100500) at arrr.c:11
11                      b[i] = a[i];
(gdb) p a[i]
$1 = 1
(gdb) p b[i]
Cannot access memory at address 0x414000
(gdb) p i
$2 = 3500
(gdb) info breakpoints
Num     Type           Disp Enb Address    What
1       breakpoint     keep y   0x004006c8 in fun at arrr.c:10
        breakpoint already hit 1 time
(gdb) delete 1
(gdb) info breakpoints
No breakpoints or watchpoints.
```

* `bt` — show ''backtrace'', stack of functions call
* `c` — continue
* `delete №` — delete breakpoint №
* also `u` — execute code until block or function ends
* also there are ''watchpoints'' — program stops after a variable or expression changed

### Other debuggers

On sugon:
 * `gdb -tui binaryprog` — with window of code, console

On local machine (linux):
 * `cgdb binaryprog` — almost like `gdb -tui`, but better, console
 * `nemiver binaryprog` — simple graphical debugger
 
## Homework

Pick up your favorite debugger and learn how to use it.

## References

* [GDB documentation](https://www.gnu.org/software/gdb/documentation)
