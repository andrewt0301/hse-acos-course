Strings in C
---

![String](string_representation.jpg)

__In C, there are no such a data type as string (variable length, locale-aware vs. low-level)__.
__Conventional LibC string__:

* sequence of _bytes_
* zero-terminated (s. c. ASCIIZ)
* no metadata

### Functions for handling strings

Reference on C function for handling strings and symbols is [here](https://en.cppreference.com/w/c/string/byte).

Main types of functions:

* [Character_classification](https://en.cppreference.com/w/c/string/byte#Character_classification)
* [Conversions_to_numeric_formats](https://en.cppreference.com/w/c/string/byte#Conversions_to_numeric_formats)
* [String_manipulation](https://en.cppreference.com/w/c/string/byte#String_manipulation)
* [String_examination](https://en.cppreference.com/w/c/string/byte#String_examination)
* [Character_array_manipulation](https://en.cppreference.com/w/c/string/byte#Character_array_manipulation)

Most commonly used functions:

* [strlen](https://man7.org/linux/man-pages/man3/strlen.3.html) – calculate the length of a string
* [strcpy](https://man7.org/linux/man-pages/man3/strcpy.3.html) – copy a string
* [strncpy](https://man7.org/linux/man-pages/man3/strncpy.3p.html) - copy `n` symbols of a string
* [strcat](https://man7.org/linux/man-pages/man3/strcat.3.html) – concatenate two strings
* [strdup](https://man7.org/linux/man-pages/man3/strdup.3.html) – duplicate a string
* [strcmp](https://man7.org/linux/man-pages/man3/strcmp.3.html) – compare two strings
* [atoi](https://man7.org/linux/man-pages/man3/atoi.3.html) – convert a string to an integer

The buffer for a string can be a global array, a stack-allocated array or a dynamically
allocated chunk of memory (allocated with the help of
the [malloc](https://man7.org/linux/man-pages/man3/malloc.3.html) function or other functions).
Dynamically allocated strings must be freed with the help
of the [free](https://man7.org/linux/man-pages/man3/free.3p.html) function.

Full list of functions from `<string.h>` is [here](https://man7.org/linux/man-pages/man0/string.h.0p.html).
