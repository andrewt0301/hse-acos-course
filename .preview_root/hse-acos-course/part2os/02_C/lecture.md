Lecture 2
---

# C Programming Language

## Lecture

Slides ([PDF](OS_Lecture_02.pdf), [PPTX](OS_Lecture_02.pptx)).

#### Outline

* The C Language
* History
* Data types (built-in, structures)
* Functions
* Pointers, arrays, address arithmetic
* Memory allocation
* Strings

#### Theory

Builtin data types:

```c
char
unsigned char
short
unsigned short
int 
unsigned int
long
unsigned long
float
double
void
```

Pointer data types:

```c
void *
char *
int *
long *
```

Type aliases:

```c
typedef unsigned long int size_t;
```

Structures:

```c
struct point {
    int x;
    int y;
};
```

Bitfields:

```c
struct point {
    int x;
    int y1 : 16;
    int y2 : 16;
};
```

Size of various data types:

```c
#include <stdio.h>

typedef struct {
    int x;
    int y;
} point_t;

int main() {
    printf("sizeof(char)   = %ld\n", sizeof(char));
    printf("sizeof(int)    = %ld\n", sizeof(int));
    printf("sizeof(long)   = %ld\n", sizeof(long));
    printf("sizeof(float)  = %ld\n", sizeof(float));
    printf("sizeof(double) = %ld\n", sizeof(double));
    printf("sizeof(void *) = %ld\n", sizeof(void *));
    printf("sizeof(point)  = %ld\n", sizeof(point_t));
    return 0;
}   
```

Unions:

```c
#include <stdint.h>
#include <stdio.h>

int main(void) {
    union S {
        uint32_t u32;
        uint16_t u16[2];
        uint8_t  u8[4];
    } s = {0x12345678}; // s.u32 is now the active member

    printf("sizeof(s)=%zu\n", sizeof(s));
    printf("address(s)=%p\n", &s);
    printf("address(s.u32)=%p\n", &s.u32);
    printf("address(s.u16)=%p\n", &s.u16);
    printf("address(s.u8)=%p\n\n", &s.u8);
    printf("s.u32=%x\n", s.u32);
    printf("s.u16[0]=%x, s.u16[1]=%x\n", s.u16[0], s.u16[1]);
    printf("s.u8[0]=%x, s.u8[1]=%x, s.u8[2]=%x, s.u8[3]=%x\n\n", s.u8[0], s.u8[1], s.u8[2], s.u8[3]);

    s.u16[0] = 0x0011; // s.u16 is now the active member
    printf("s.u32=%x\n", s.u32);
    printf("s.u16[0]=%x, s.u16[1]=%x\n", s.u16[0], s.u16[1]);
    printf("s.u32=%x\n", s.u32);
    printf("s.u8[0]=%x, s.u8[1]=%x, s.u8[2]=%x, s.u8[3]=%x\n\n", s.u8[0], s.u8[1], s.u8[2], s.u8[3]);

    union pad {
        char  c[5];
        float f;
    } p = { .f = 1.23 };
    printf("sizeof(pad)=%zu\n", sizeof(p));
    printf("address(p)=%p\n", &p);

    return 0;
}
```

Input/output:

```c
int x;
scanf("%d", &x);
printf("%d", x);
```

Functions and function pointers:

```c
#include <stdio.h>

void print(int x, int y) {
    printf("%d %d\n", x, y);
}

typedef void (* func_t)(int, int);

void test(func_t func) {
    (*func)(10, 20);
}

int main() {
    void (* func )(int, int) = &print;
    (*func)(10, 20);
    test(func);
    return 0;
}

```

Dynamic memory allocation (use `malloc` and `free`):

```c
#include <stdio.h>

int main() {
    int i, n;
    printf("Enter array size:\n");
    scanf("%d", &n);

    int* array = malloc(sizeof(int) * n);
    printf("Enter array:\n");
    for (i = 0; i < n; i++) {
        scanf("%d", &array[i]);
    }
    printf("Array:\n");
    for (i = 0; i < n; i++) {
        printf("array[%d] = %d\n", i, array[i]);
    }
    free(array);

    return 0;
}
```

Preprocessor:

_lib.h_:
```c
#ifndef LIB
#define LIB

#ifdef NO_MACRO
  inline int max(int a, int b) { return a < b ? a : b; }
#else
  #define max(a, b) ((a) < (b) ? (a) : (b))
#endif

#endif
```
_prog.c_:
```c
#include "lib.h"

int main() {
   int x = max(0, -5);
   return x;
}
```
_Preprocessing:_
```bash
gcc prog.c -E # NO_MACRO is not defined
gcc prog.c -E -DNO_MACRO # NO_MACRO is defined
```

## Workshop

#### Outline

* Discuss main features of C and differences with other languages
* Discuss questions from [this](disc02.pdf) document
* [Learn how to use GDB to debug simple programs](debugger.md)
* Write and debug small programs covering different features of C language

#### Tasks

1. Write a program in C, which does the following:
   * defines the point structure;
   * inputs an integer value `N`;
   * allocates an array of `N` points (assume the coordinates a non-negative);
   * inputs `N` points;
   * inputs a point;
   * finds the point closest to the specified point in the array of points.

   Notes: use `malloc` and `free` to allocate and deallocate the array respectively.

## Homework

_Write and submit to GitHub the programs described below._
_An instruction on how to work with GitHub is [here](../../software/git.md)_.

### Tasks

1. Write a program in C that inputs two integer values `x` and `y`,
   call function `swap` that takes the values as arguments and swaps them,
   prints the values after the swap.

1. Write a program in C, which does the following:
   * inputs an integer value `N`;
   * allocates an array of `N` integer elements;
   * fills the array with integer values from the standard input;
   * reverses the array;
   * prints the resulting array;
   * deallocates the array.

   Notes: use `malloc` and `free` to allocate and deallocate the array respectively.

1. Write a program in C, which does the following:
   * inputs two integer values `N` and `M`;
   * allocates a matrix of size `N * M` and fills it with values from standard input;
   * transposes the matrix;
   * prints the resulting matrix;
   * deallocate the matrices.

   Note: the matrices must be allocated with `malloc` and deallocated with `free`.
   
1. Write a program in C, which does the following:
   * creates a singly-linked list;
   * add to the list numbers from the standard input until user inputs `0`;
   * reverses the list;
   * prints the resulting list;
   * deallocates the list.

   Note: use `malloc` and `free` to allocate and deallocate list entries respectively. 

# References

* Brian Harvey. [CS 61C: C: Introduction, Pointers, & Arrays](HarveyNotesC1-3.pdf) 
* CS 61C by UC Berkeley. C: Introduction, Pointers. [Slides](lec02.pdf)
* [KRC] Brian W. Kernighan, Dennis Ritchie.
  [C Programming Language](
  https://www.pearson.com/us/higher-education/program/Kernighan-C-Programming-Language-2nd-Edition/PGM54487.html)
  2nd Edition. 1988.
* [C programming language](https://en.wikipedia.org/wiki/C_%28programming_language%29) (Wikipedia)
* [C data types](https://en.wikipedia.org/wiki/C_data_types) (Wikipedia)
* [C preprocessor](https://en.wikipedia.org/wiki/C_preprocessor) (Wikipedia)
* [Function Pointer in C](https://www.geeksforgeeks.org/function-pointer-in-c/)
* [Dynamic 2-D arrays in C](https://www.geeksforgeeks.org/dynamically-allocate-2d-array-c/)
* [C reference](https://en.cppreference.com/w/c) on _cppreference.com_
* [Typedef](https://en.wikipedia.org/wiki/Typedef) (Wikipedia)
