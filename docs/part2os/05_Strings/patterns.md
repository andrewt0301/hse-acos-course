Patterns
---

### Pattern matching

* Task: from a number of _strings_, filter only those resembling a given example
* Example string — _pattern_ — has some _special characters_, describing string structure
* _matching_ is testing if _the whole_ string can be described by pattern
* _searching_ is finding a _substring_ that matches pattern

### Shell patterns

Patterns are used in Linux Shell to filter files by their names.
They are used for _filename generation_ before executing a Shell command.
Performed by Shell, not by command being called (i.e. __not__ by `ls` in the example below).

Details on Shell patterns can be found in
[this](https://www.gnu.org/software/findutils/manual/html_node/find_html/Shell-Pattern-Matching.html) and
[that](https://man7.org/linux/man-pages/man7/glob.7.html)
documents.

This example demonstrates using Shell patters by
the [ls](https://man7.org/linux/man-pages/man1/ls.1.html) utility:

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

The same can be done with other Linux utilities such as:
[cp](https://man7.org/linux/man-pages/man1/cp.1.html), 
[mv](https://man7.org/linux/man-pages/man1/mv.1.html),
[rm](https://man7.org/linux/man-pages/man1/rm.1.html),
[cat](https://man7.org/linux/man-pages/man1/cat.1.html),
etc. For these tools, Shell will provide file names in exactly the same way.

### Patterns in Linux utilities

Pattern matching is also used in some Linux utilities. For example,
the [find](https://man7.org/linux/man-pages/man1/find.1.html) utility
uses pattern to search for files in a directory hierarchy.

For example, the command below searches for PDF-files with the `OS_` prefix
in a directory tree:
```bash
$ find . -name "OS_*.pdf"
./part2os/01_OS_Architecture/OS_Lecture_01.pdf
./part2os/02_C/OS_Lecture_02.pdf
./part2os/03_SystemCalls/OS_Lecture_03.pdf
./part2os/04_Linking/OS_Lecture_04.pdf
./part2os/05_Strings/OS_Lecture_05.pdf
./part2os/06_Processes/OS_Lecture_06.pdf
```

### Patterns in C

Program in C sometimes need to whether a file name or path matches a specific pattern.
This can be done using the [fnmatch](https://www.man7.org/linux/man-pages/man3/fnmatch.3.html) function.
The function returns zero if the name matches the specified pattern.
The patterns are the same patterns as in Shell.

__TODO__

### Limitations of patterns

Patterns are good at filtering string that can be described by a simple template (e.g. file name).
However, they are not suitable for more complex tasks.
For such tasks, a more powerful tool required - regular expressions.
