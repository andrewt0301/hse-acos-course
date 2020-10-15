2. Walk + Parse
---

Write a program `parser.c` that takes exactly 3 arguments:

* `./parser arg1 arg2 arg3`

  1. If _arg_ is an integer number, it defines `N` for the upcoming search.
  1. If _arg_ is a name of _existing_ directory, it defines `directory` for upcoming search.
  1. Otherwise _arg_ is treated as [glob](https://man7.org/linux/man-pages/man7/glob.7.html)
     file `pattern`. _Note_: this is _not_ regexp,
     see [fnmatch](https://man7.org/linux/man-pages/man3/fnmatch.3.html) for more info.

* If _all tree_ arguments are provided _in any order_,
  the program walks over all files in the `directory` (_non-recursive_),
  and prints `N`-th file object name matching `pattern`.
