Workshop. Shell Programming. Part 2.
---

__TODO__: Rewrite. Source is [here](https://uneex.ru/HSE/ArchitectureOS/Lab_03_ShellProgramming).

= 03. Shell Programming (part 2) =
Make `03_ShellProgramming` subdirectory and store all the code there.

(!) As always, part of this tasks is about ''reading [[man1:man|manual pages''

 1. `while.sh`
 {{{#!highlight sh
 #!/bin/sh

 A=.
 while echo "Run"; ls $A 2> /dev/null; do
         read A
 done
 echo "Exit status: $?"
 }}}
  * Like `if`, while executes a command chain (`echo "Run"; ls $A` in example) and check exit status of ''last'' command executed (`ls`)
   * if it's 0 (successful execution) this means true
   * if it is non-zero, this means false (when `ls` got an error
  * exit status on any last command executed is stored to «`?`» variable
  * (optionally) you can use `&&` and `||` instead of `;` to force ''all'' exit statuses into account, e. g. `cmd1 || cmd2` is true if either of `cmd1` or `cmd2` was successful, and `cmd && cmd2 && cmd3` is true only if all commands was successful.
 1. (!) (was in homework, but can get it from `help read`). Write a program `while2.sh` that simulates `cat`: reads from standard input (one read per line):
 {{{#!highlight console
$ fortune > file
$ cat < file
Isn't it ironic that many men spend a great part of their lives
avoiding marriage while single-mindedly pursuing those things that
would make them better prospects?
$ sh while2.sh < file
Isn't it ironic that many men spend a great part of their lives
avoiding marriage while single-mindedly pursuing those things that
would make them better prospects?
 }}}
  * (!) Also:  what we ought to do to make `./whil2.sh` run?
 1. [[man1:test]]. Can compare strings, numbers, check is string is a real file name etc.
  * (!) '''Research''': read the manual page. What these commands do:
  * try `test $A = $B ; echo $?` for various A and B
   * (!) why we got an error if either `A` or `B` is empty?
  * `$A -lt $B`
  * `-f $A`
  * `-z "$A"`
 1. (!) Write a `while3.sh` script that print all the lines from standard input, but stops if `QUIT` is entered
  * <!> (optional) it must also stop when standard input is closed
 1. `for.sh`
 {{{#!highlight sh
#!/bin/sh

for n in 1 2 3 10 20 30 qwe asd xcv; do
        echo "Next value $n"
done

echo "$#" / "$*"
for n ; do
        echo "What is this: $n?"
done
}}}
  * The `for` cycle is like python's (strictly speaking, ''python's'' for is like shell's one :) ). It assigns to a variable (`n` in example) all words from word sequence
  * (!) '''Research''':
   * What are `#` and `*` variables?
   * What the `for variable;` construction do?
    1. You can read all the way though [[man1:bash]]
    1. or you can just play with this script a little :)
 1. Functions:
  * Function in shell is like a (temporally defined) command
  * Arguments are passing to the function just like command line arguments does
  * ''inside'' a function all the command-line aware constructions (like `$0`, `$1`, `$#`, `$*` etc) deals with function arguments instead
  * See `funct.sh` file:
 {{{#!highlight sh
#!/bin/sh

fun() {
  echo "$0: $# $*"
  for arg; do
        echo "> $arg"
  done
}

fun 1   QWE  "3 4"
fun "$*"
fun  $*
fun "$@"
}}}
  * (!) '''Research''':
   * Describe the difference between `"$*"`, `$*`, and especially `"$@"` (yes, it is special construction)
 1. Reminder. Command output substitution, {{{`command`}}} and `$(command)` forms (equivalent)
  {{{#!highlight console
$ date
Чт апр 23 20:13:35 MSK 2020
$ A=`date`
$ echo $A
Чт апр 23 20:13:44 MSK 2020
$ B=$(cal)
$ echo $B
Апрель 2020 Пн Вт Ср Чт Пт Сб Вс 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
$ echo "$B"
     Апрель 2020
Пн Вт Ср Чт Пт Сб Вс
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30
  }}}
   * Why `echo $B` looks like this?
  * (!) Create `funct2.sh` program
 {{{#!highlight sh
#!/bin/sh

sum() {
  # insert your code here
}

while read a b; do
        sum $a $b
done
}}}
  * Note how `read var1 var2 … varN` works
  * (!) read [[man1:expr]] and improve the program so it will print the sum of `$a` and `$b`. Assume input is always correct
 1. (!) Copy `funct2.sh` to `funct3.sh` and modify it so it shall also stop if `$A`+`$B`>`100`.
  * Hint: use substitution here.
  * You can use `break` to quit from cycle
  * Hint: debug shell script with `sh -x shellscript.sh`

== H/W ==
 * Complete all tasks
 * [[man1:expr]] again :)
 * Write a shell script `sumsum.sh` that
  * Has function `sum()` that
   * sums all of it's arguments (any number of arguments are permitted)
   * prints this sum if there's no errors
   * prints `0` if there was error (e. g. try to sum non-numbers)
   * redirects all error messages to `/dev/null`
  * Reads two lines of numbers
  * Prints if their sums was equal or not
  {{{#!highlight console
$ ./sumsum.sh
1 3 5
2 4 6
Not equal
$ ./sumsum.sh
1 5 6
4 4 4
Equal
$ ./sumsum.sh
1 2 w
3 4 e
Equal
$ ./sumsum.sh
1 2 1
2 2 Q
Not equal
$ ./sumsum.sh
qwe 3 4
10 20 -30
Equal
}}}
