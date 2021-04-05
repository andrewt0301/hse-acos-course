Lecture 4
---

# Libraries and binary file format

## Lecture

Slides ([PDF](OS_Lecture_04.pdf), [PPTX](OS_Lecture_04.pptx)).

#### Outline

* Linking
* Relocatable object files
* Executable and Linkable Format (ELF)
* Shared libraries
* Linked libraries
* Library interpositioning

#### Tools for Manipulating Object Files

* [ar](https://man7.org/linux/man-pages/man1/ar.1.html) -
  creates static libraries, and inserts, deletes, lists, and extracts members.
* [strings](https://man7.org/linux/man-pages/man1/strings.1.html) -
  lists all of the printable strings contained in an object file.
* [strip](https://man7.org/linux/man-pages/man1/strip.1.html) -
  deletes symbol table information from an object file.
* [nm](https://man7.org/linux/man-pages/man1/nm.1.html) -
  lists the symbols defined in the symbol table of an object file.
* [size](https://man7.org/linux/man-pages/man1/size.1.html) -
  lists the names and sizes of the sections in an object file.
* [readelf](https://man7.org/linux/man-pages/man1/readelf.1.html) -
  displays the complete structure of an object file, including all of the information
  encoded in the ELF header. Subsumes the functionality of `size` and `nm`.
* [objdump](https://man7.org/linux/man-pages/man1/objdump.1.html) -
  themotherofallbinarytools.Candisplayalloftheinformationinan object file.
  Its most useful function is disassembling the binary instructions in the .text section.
* [ldd](https://man7.org/linux/man-pages/man1/ldd.1.html) -
  lists the shared libraries that an executable needs at run time.

## Workshop

* [Part 1](libs.md).
* [Part 2](make.md).

## Homework

__TODO__

# References

* Linking. Chapter 7 in [[CSPP]](../../books.md).
* Section 2.6. in [[OSC]](../../books.md).
* Chapters 41 and 42 in [[TLPI]](../../books.md).
