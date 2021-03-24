Lecture 2
---

# C Programming Language

__Before Start:__ [Using Linux Ubuntu in the Cloud.](../../software/cloud_ssh.md)

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
<!---
* GNU Tools
    * GCC
    * Make
-->

#### Theory

Builtin data types:

```c
char unsiged char
short
unsigned short
int 
unsigined int
long
unsigned long
float
double
__int8_t
__int16_t
__int32_t
__int64_t;
void *
size_t
```

Structures:

```c
struct point {
    int x;
    int y;
}
```

```c
struct point {
    int x;
    int y1 : 16;
    int y2 : 16
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
    printf("%d %d\n");
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

## Workshop

#### Outline

* Discuss main features of C and differences from C++ and other languages
* Discuss questions from [this](disc02.pdf) document

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

1. Write a program in C that inputs two integer values `x` and `y`,
   call function `swap` that takes the values as arguments and swaps them,
   prints the values after the swap.

1. Write a program in C, which does the following:
   * inputs an integer value 'N';
   * allocates an array of 'N' integer elements;
   * fills the array with integer values from the standard input;
   * reverses the array;
   * prints the resulting array;
   * dellocates the array.

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
* [KRC] Brian W. Kernighan, Dennis Ritchie.
  [C Programming Language](
  https://www.pearson.com/us/higher-education/program/Kernighan-C-Programming-Language-2nd-Edition/PGM54487.html)
  2nd Edition. 1988.
* [C programming language](https://en.wikipedia.org/wiki/C_%28programming_language%29) (Wikipedia)
* [C data types](https://en.wikipedia.org/wiki/C_data_types)
* [Function Pointer in C](https://www.geeksforgeeks.org/function-pointer-in-c/)
* [C reference](https://en.cppreference.com/w/c) on _cppreference.com_
