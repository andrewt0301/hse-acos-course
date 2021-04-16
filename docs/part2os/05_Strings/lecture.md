Lecture 5
---

# Strings and regular expressions

## Lecture

Slides ([PDF](OS_Lecture_05.pdf), [PPTX](OS_Lecture_05.pptx)).

#### Theory

* [Strings in C](c_strings.md)
* [Patterns](patterns.md)
* [Regular expressions](regexes.md)

## Workshop

#### Outline

* Practice using functions of the C language to handle strings
* Practice using Shell patterns and regular expressions
    * Shell
    * C language

## Homework

Write a program that inputs three command-line arguments:

  * `argv[1]` - regular expression;
  * `argv[2]` - text;
  * `argv[3]` - replacement.

The program finds all occurrences of the regular expression in the text and 
replaces all of them with the specified replacement string.
The updated text is stored in a separate buffer and printed to the console in the end.

_Hint_: Algorithm is as follows. Allocate a buffer for the new text. Find a regular expression
match. Copy to the buffer text before match. Copy to the buffer replacement. Find the next
regular expression match and so on.

_Note_: The problem when the size of the allocated buffer is not enough to store the text
can be solved by using the [realloc](https://man7.org/linux/man-pages/man3/realloc.3p.html)
function to allocated additional space.

# References

* Jeffrey Friedl [Mastering Regular Expressions](http://regex.info/book.html) (aka The Owl Book).
* [regex101: build, test, and debug regex](https://regex101.com)
