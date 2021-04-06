Lecture 5
---

# Strings and regular expressions

## Lecture

<!---
Slides ([PDF](CA_Lecture_01.pdf), [PPTX](CA_Lecture_01.pptx)).

Outline:
-->

### Strings

![String](string_representation.jpg)

__There no such data type as strings__.

* Variable length
* Locale-aware vs low-level

#### Conventional LibC string

* sequence of _bytes_
* zero-terminated (s. c. ASCIIZ)
* no metadata

[C reference](https://en.cppreference.com/w/c/string/byte).
* Genres:
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

### Regular expressions
    
#### Pattern matching

* Task: from a number of _strings_, filter only those resembling a given example
* Example string — _pattern_ — has some _special characters_, describing string structure
* _matching_ is testing if _the whole_ string can be described by pattern
* _searching_ is finding a _substring_ that matches pattern

#### Shell patterns

 * [see](https://man7.org/linux/man-pages/man7/glob.7.html)
 * used for ''filename generation'' before executing shell command
   ```bash
   $ ls
   a  a0  aa  aaa  aaaa  abab  abba  acb  b  b0  bb  bbb  cabba  cba
   $ ls a*
   a  a0  aa  aaa  aaaa  abab  abba  acb
   $ ls a?b
   acb
   $ ls c*a
   cabba  cba
   $ ls [ab]*
   a  a0  aa  aaa  aaaa  abab  abba  acb  b  b0  bb  bbb
   $ ls *[a-z]
   a  aa  aaa  aaaa  abab  abba  acb  b  bb  bbb  cabba  cba
   $ ls *[^a-z]
   a0  b0
   ```
  * performed by Shell, not by command called (i. e. __not__ by `ls` here)

Too weak.

#### Regular expressions

Narrowest [Chomsky_hierarchy](https://en.wikipedia.org/wiki/Chomsky_hierarchy) formal language class:

* Can be (relatively) easily parsed
* Can describe almost any possible pattern, not bound to context and having no internal parts dependence
  (e. g. «a if precedes by b» or «integer number, than that number of characters» _can not_ be described)
* Laconic

_Warning: To write a regexp is far more easier than to read other's regexp._

1. Atomic regexp:
  * any non-special character matches exactly same character
    - "`E`" → «`E`»
  * a dot "`.`" matches __any__ one character
    - "`.`" → «`E`»
    - "`.`" → «`:`»
    - "`.`" → «`.`»
  * a set of characters matches any character __from the set__:
    - "`[quack!]`" → «`a`»
    - "`[quack!]`" → «`!`»
    - "`[a-z]`" → «`q`» (any small letter)
    - "`[a-z]`" → «`z`» (any small letter)
    - "`[a-fA-F0-9]`" → «`f`» (any hexadecimal digit)
    - "`[a-fA-F0-9]`" → «`D`» (any hexadecimal digit)
    - "`[abcdefABCDEF0-9]`" → «`4`» (any hexadecimal digit)
  * a negative set of characters matches any character __not from the set__:
    - "`[^quack!]`" → «`r`»
    - "`[^quack!]`" → «`#`»
    - "`[^quack!]`" → «`A`»
  * any atomic regexp followed by "`*`" __repeater__ matches a continuous sequence of substrings,
    including empty sequence, each matched by the regexp
    - "`a*`" → «`aaa`»
    - "`a*`" → «``»
    - "`a*`" → «`a`»
    - "`[0-9]*`" → «`7`»
    - "`[0-9]*`" → «``»
    - "`[0-9]*`" → «`1231234`»
    - "`.*`" → _any string_!
  * any complex regexp enclosed by special grouping parenthesis "`\(`" and "`\)`" (see below)
1. Complex regexp
  * A sequence of atomic regexps
  * Matches a continuous sequence of substrings, each matched by corresponded atomic regexp
    - "`boo`" → «`boo`»
    - "`r....e`" → «`riddle`»
    - "`r....e`" → «`r re e`»
    - "`[0-9][0-9]*`" → any non-negative integer
    - "`[A-Za-z_][A-Za-z0-9]*`" → C identifier (alphanumeric sequence with «`_`», not started from digit)
  * grouping parenthesis can be used for repeating complex regexp:
    - "`\([A-Z][a-z]\)*`" → «`ReGeXp`»
    - "`\([A-Z][a-z]\)*`" → «``»
    - "`\([A-Z][a-z]\)*`" → «`Oi`»
  * Implies __leftmost longest rule__ (aka «greedy»):
    In successful match of complex regexp _leftmost_ atomic regexp takes _longest possible_ match,
    second leftmost atomic regexp takes longest match that possible in current condition; and so on
    - "`.*.*`" → all the string leftmost, empty string next
    - "`[a-z]*[0-9]*[a-z0-9]*`" → «`123b0c0`»
      - "`[a-z]*`" → «»
      - "`[0-9]*`" → «`123`»
      - "`[a-z0-9]*`" → «`b0c0`»
    - "`[a-d]*[c-f]*[d-h]*`" → «`abcdefgh`»
      - "`[a-d]*`" → «`abcd`»
      - "`[c-f]*`" → «`ef`»
      - "`[d-h]*`" → «`gh`»
1. Positioning mark
  * "`^`''`regexp`''" matches only substrings located at the beginning of the line
  * "''`rgexp`''`$`" matches only substrings located at the end of line


## Workshop

__TODO__

## Homework

__TODO__

# References

* Jeffrey Friedl [Mastering Regular Expressions](http://regex.info/book.html) (aka The Owl Book).
* [regex101: build, test, and debug regex](https://regex101.com)

