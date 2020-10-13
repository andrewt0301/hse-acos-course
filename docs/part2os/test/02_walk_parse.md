2. Walk + Parse
---

<!--- page was renamed from HSE/ProgrammingOS/Lab_18_Test/Files_Parse -->

Write a program `parser.c` that takes exactly 3 arguments:

* `./parser arg1 arg2 arg3`

  1. if ''arg,,i,,'' is an integer number, this defines `N` for the upcoming search
  1. if ''arg,,i,,'' is a name of ''existing'' directory, it defines `directory` for upcoming search
  1. otherwise ''arg,,i,,'' is treated as [[man7:glob]] file `pattern`
   '''Note''': this is ''not'' regexp, see [[man3:fnmatch]] for more info

* If _all tree_ arguments are provided _in any order_,
  the program walks over all files in the `directory` (_non-recursive_),
  and prints `N`-th file object name matching `pattern`.
