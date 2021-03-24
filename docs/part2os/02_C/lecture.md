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

## Workshop

#### Outline

* Discuss main features of C and differences from C++ and other languages
* Discuss questions from [this](disc02.pdf) document 

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
* [C programming language](https://en.wikipedia.org/wiki/C_%28programming_language%29) (Wikipedia).
* [C data types](https://en.wikipedia.org/wiki/C_data_types)
* [C reference](https://en.cppreference.com/w/c) on _cppreference.com_
