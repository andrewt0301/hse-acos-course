Workshop. Shell Programming. Part 1.
---

__TODO__: Rewrite. Source is [here](https://uneex.ru/HSE/ArchitectureOS/Lab_00_OverviewShell).

Create `00_OverviewShell` directory. All code must reside here.

Script: executable text file
 * can be executed with ''`interpretator script_file`''
  * e. g. `sh script`
 * «shebang» (`#!/bin/sh` at the first line)
  * `chmod +x script` 
  * ⇒ can be executed via `./script`
 * run by name if it's directory is in `$PATH` variable
  * `PATH=`''`directory_with_script`''`:$PATH` 
  * ⇒ can be executed via just `script`
Tasks
 1.#0 Simple script file named `c1`:
 {{{#!highlight sh
#!/bin/sh
read A
echo $A
}}}
 * A is variable
 * `$A` is a ''substitution'' of `A` value
 * `echo` command is executed ''after'' substitution, so
  * if called as 
      `sh c1   ABC      def  123`
    it outputs
      `ABC def 123`
    without extra spaces, because `echo $A` expands to `echo ABC      def  123`, which is command `echo` with three command line parameters
 * (!) How to make `echo` display all spaces as well?
  Spoiler: /* use `sh c1 "  ABC      def  123"` form — it constructs ''one'' parameter instead of three with all the words and spaces in it */
  * fix `c1` to do this
 1. Output substitution, `c2` file
 {{{#!highlight sh
#!/bin/sh
read A
Sys=`uname`
echo "Hello, $A!
Welcome to $Sys!"
}}}
  * The «{{{`command`}}}» (also «`$(command)`») construction runs `command` and substitute it with its' output
  * '''No''' spaces is allowed around «`=`» when assigning
  * All variables are strings
  * (!) Modify  `c2` not to read `A`, but to output user login name instead (use `logname` or `whoami` command)
 1. Multiline
  * `echo $A` squeezes all newlines as well
  * If you want to use control characters like in C, use [[man1:echo|echo -e]] key
  * (!) Write a `c4` script that 
   * ends with command `echo -e "$Msg"`
   * outputs
   {{{
Hello, your_login_name!
Welcome to Linux
}}}
   * and contains only one two extra lines:
    * one shebang
    * and one like `Msg=…something…`
   * make this script executable
 1. Commandline parameters. This is `c5` file:
 {{{#!highlight sh
#!/bin/sh

echo "$0"
echo "$1"
# ...
echo "$*"
echo "$#"
}}}
  * `$1`, `$2` … — command line argument №1, №2 …
  * `$0` — name of the script itself
  * `$*` — ''all'' command line arguments
  * `$#` — number of command line arguments
  so
  {{{#!highlight console
[tmpuser@sugon 00_OverviewShell]$ sh c5 A bc  cde   fff
c5
A
A bc cde fff
4
}}}
 1. Conditional `if` operator.
  * Overview:
  {{{#!highlight sh
if condition-conmands
then
  true-commands
else
  false-commands
fi
}}}
   * if last of `condition-conmands` exit with success status (zero status code), `true-commands` are executed.
   * otherwise, if last of `condition-conmands` exit with `non-zero` exit status (an error), `false-commands` are executed.
   * '''Yes''', 0 status is `true`, non-0 is `false`!
   * Yes, `fi` is `if` backwards
  * Example `c6` file:
{{{#!highlight sh
#!/bin/sh
if ls $*; then
        echo YES
else
        echo NO $?
fi
}}}
   * if `ls` is successful, echoes `YES`, otherwise `NO`
   * «`$?`» — is exit status of failed command
  * using `2> /dev/null` to redirect error messages out of terminal:
  {{{#!highlight sh
$ ls c6
c6
$ ls c6 > o
$ ls c100500
ls: cannot access 'c100500': No such file or directory
$ ls c100500 > oo
ls: cannot access 'c100500': No such file or directory
$ ls c100500 2> oo
$ cat o
c6
$ cat oo
ls: cannot access 'c100500': No such file or directory
}}}
  * (!) Rewrite `c6` file (copy it to `c7`)
   * To output content of `ls` ''after'' «YES» message, if ls is successful
   * Not to output error message if `ls` is not successful

== H/W ==
 Research:: What exit status the command `read` generates? Try it
  * ''Important'': Please consult `help read` (e. g. [[https://www.gnu.org/software/bash/manual/bash.html#index-read|here]]) command instead of `man read`, because `read` is shell built-in and you got manual page on ''all'' shell builtins
 Research:: How to suppress «`\n`» output after `echo` (see [[man1:echo]])?
 Task:: Write a `c8` script that asks user for name, and prints a welcome message either if an user has entered a name or not:
 {{{#!highlight console
$ ./c8
Enter your name: Spot
Hello, Spot!
$ ./c8
Enter your name: 
Hello, tmpuser?
}}}
  * Hint: In second example user had ''not'' pressed «Enter»
  