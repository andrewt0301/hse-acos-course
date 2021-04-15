Strings in C
---

![String](string_representation.jpg)

__There no such data type as strings__.

* Variable length
* Locale-aware vs low-level

#### Conventional LibC string

* sequence of _bytes_
* zero-terminated (s. c. ASCIIZ)
* no metadata

Reference on C function for handling strings and symbols is [here](https://en.cppreference.com/w/c/string/byte).

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
  * ⇒ __Warning__ check if buffer shall be `free()`-d
    * rule: you allocated — you freed
    * __Exceptions__ `strdup()` etc.
