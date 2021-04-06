Lecture 5
---

# Strings and regular expressions

## Lecture

<!---
Slides ([PDF](CA_Lecture_01.pdf), [PPTX](CA_Lecture_01.pptx)).

Outline:
-->

### Strings

__There no such data type as strings__.

* Variable length
* Locale-aware vs low-level

#### Conventional LibC string

* sequence of _bytes_
* zero-terminated (s. c. ASCIIZ)
* no metadata

[C reference](https://en.cppreference.com/w/c/string/byte).
* genres
  * [Character_classification](https://en.cppreference.com/w/c/string/byte#Character_classification)
  * [Conversions_to_numeric_formats](https://en.cppreference.com/w/c/string/byte#Conversions_to_numeric_formats)
  * [String_manipulation](https://en.cppreference.com/w/c/string/byte#String_manipulation)
  * [String_examination](https://en.cppreference.com/w/c/string/byte#String_examination)
  * [Character_array_manipulation](https://en.cppreference.com/w/c/string/byte#Character_array_manipulation)
* Locale-awareness: byte, wide and multibyte
  * locale voodoo, e. g. collation, 'A' == 'a' etc.
* Need a buffer to store result
  * ⇒ Fixed length
    * ⇒ lots of UB and
    * ⇒ `n`-versions
  * ⇒ '''Warning''' check if buffer shall be `free()`-d
    * rule: you allocated — you freed
    * '''Exceptions''' `strdup()` etc.

## Workshop

__TODO__

## Homework

__TODO__

# References

__TODO__
