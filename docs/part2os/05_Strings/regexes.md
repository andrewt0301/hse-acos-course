Regular Expression
---

![RE](automata.png)

Narrowest [Chomsky_hierarchy](https://en.wikipedia.org/wiki/Chomsky_hierarchy) formal language class:

* Can be (relatively) easily parsed
* Can describe almost any possible pattern, not bound to context and having no internal parts dependence
  (e. g. «a if precedes by b» or «integer number, than that number of characters» _can not_ be described)
* Laconic

__Warning: To write a regexp is far easier than to read other's regexp.__

Examples of regular expressions can be found [here](regexes_ex.md).
For experiments with regular expressions, the [regex101](https://regex101.com) site can be used.

### Regexp Tools

1. Find. [grep](http://man7.org/linux/man-pages/man1/grep.1.html): filtering strings that contain regexp:

   ```bash
   $ cal | grep 18
   16 17 18 19 20 21 22
   $ cal | grep '9.*4'
   9 10 11 12 13 14 15
   ```
   * (!) try all examples above via `grep` (happily it colors all substring matches)
   * `vim` (command enter command-line mode)
       * `/regexp`: search forward
       * `?regexp`: search backward
   * `less` — same
   * ...

1. Search and replace. [sed](https://man7.org/linux/man-pages/man1/sed.1.html): stream editor.

   * Search and replace: `s/regexp/replacement`
       * Replace once
       ```bash
       $ cal | sed 's/[12][23]/@@/' 
              March 2020     
       Su Mo Tu We Th Fr Sa
        1  2  3  4  5  6  7
        8  9 10 11 @@ 13 14
       15 16 17 18 19 20 21
       @@ 23 24 25 26 27 28
       29 30 31            
       ``` 
       * Replace all (___g___lobally)
       ```bash
       $ cal | sed 's/[12][23]/@@/g'
           March 2020     
       Su Mo Tu We Th Fr Sa
        1  2  3  4  5  6  7
        8  9 10 11 @@ @@ 14
       15 16 17 18 19 20 21
       @@ @@ 24 25 26 27 28
       29 30 31
       ```
   * Group recall: every substring matched regexp grouped by "`\(`"/"`\)"
     can be inserted into replacement string by referencing to corresponded number ("`\1`", "`\2`" etc):
     ```bash
     $ cal | sed 's/2\([0-6]\)/=\1/g'
          March =0=0     
     Su Mo Tu We Th Fr Sa
      1  2  3  4  5  6  7
      8  9 10 11 12 13 14
     15 16 17 18 19 =0 =1
     =2 =3 =4 =5 =6 27 28
     29 30 31
     $ echo '15 16 17 18 19 20 21' | sed 's/\(15\)\(.*\)\(20\)/\3\2\1/'
     20 16 17 18 19 15 21
     $ echo '==15 16 17 18 19 20 21==' | sed 's/\([0-9][0-9]*\).*\([0-9]\)/\1\2/'
     ==151==
     $ echo '==15 16 17 18 19 20 21==' | sed 's/\([0-9]*\).*\([0-9]\)/\1\2/' 
     1==
     ```
     * (!) check [[#complex]] examples with `sed`
     * Groups are numbered by the _opening  parenthesis_ order:
       ```bash
       $ echo 'aaabbbccc' | sed 's/\(a*\(b*\)\)/\2-\1=/'
       bbb-aaabbb=ccc
       $ echo '15 16 17 18 19 20 21' | sed 's/\(1.*7.*\(8.*2\)\)/\2-\1=/'
       8 19 20 2-15 16 17 18 19 20 2=1
       ```

1. Text editor. `vim`: same as `sed`, but plus:
    * "`:s/regexp/replacement/`" — replace once in current line
    * "`:s/regexp/replacement/g`" — replace all (globally) in current line
    * "`:%s/regexp/replacement/g`" — replace all in the while file
    * "`:10,30s/regexp/replacement/g`" — replace all in 10, 11, …, 30 line
    * "`:/BEGIN/,/END/s/regexp/replacement/g`" — replace all in lines started from line contains `BEGIN` to the line contains `END`
    * "`:/main(/,/^}/s/'\([^']*\)'/"\1"/g`" — replace all «`'...'`» strings (wich are _not_ in C :) ) to «`"..."`» (which are) in function `main()`
    * "`:/main(/,/^}/s/'\([^']*\)'/"\1"/gc`" — do the same with _confirmation_ of each replacement

### Regexp in C language

