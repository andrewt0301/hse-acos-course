Patterns
---

#### Pattern matching

* Task: from a number of _strings_, filter only those resembling a given example
* Example string — _pattern_ — has some _special characters_, describing string structure
* _matching_ is testing if _the whole_ string can be described by pattern
* _searching_ is finding a _substring_ that matches pattern

#### Shell patterns

 * [see](https://man7.org/linux/man-pages/man7/glob.7.html)
 * used for _filename generation_ before executing shell command

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
