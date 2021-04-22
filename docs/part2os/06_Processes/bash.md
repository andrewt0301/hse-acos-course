Workshop: Shell Scripts
---

[Shell](https://en.wikipedia.org/wiki/Shell_script) allows creating simple scripts
that run various Linux system utilities and connect them.
So, it is possible to automate solving tasks related to managing system resources.

From a practical point of view, a Shell script is an executable text file that can be run with a command like this:
`interpreter script_file` (e.g. `sh script`).

Also, there is a special marker «shebang» (`#!/bin/sh`) that specifies the interpreter to be used to run the file.
It is placed to the first line of a script. Then the script is given the “execute” permission (`chmod +x script`).
After that the script can be run simply like this:
```bash
acos@acos-vm:~$ ./script
```

Also, it is possible to run a Shell script from any directory if its directory is added to the `$PATH` variable.
```bash
acos@acos-vm:~$ export  PATH=directory_with_script:$PATH
```

After this the script can be called from directory in the following way:
```bash
acos@acos-vm:~$ script
```

## Examples and Tasks

### Input and Output

This script reads text into the `A` variable from the console (standard input) and then prints it back to the console.
```bash
#!/bin/sh

read A
echo "$A"
```

The script below reads the user name from the standard input and greats
the user with a message containing the user name and the information about the system
(returned by the [uname](https://man7.org/linux/man-pages/man1/uname.1.html) utility).
```bash
#!/bin/sh

read A
Sys=`uname`

echo "Hello, $A!
Welcome to $Sys!"
```

#### Task 01:

Modify the previous program to get the user name from system instead of reading the input.
Use the [whoami](https://man7.org/linux/man-pages/man1/whoami.1.html) utility to get the user name.

#### Task 02:

Modify the previous program to store the message to be printed in a macro variable called `Msg`.
Pass the variable to the [echo](https://man7.org/linux/man-pages/man1/echo.1.html) utility.

### Command-Line Arguments

This script demonstrates the use of special symbols to access
command-line arguments passed to the interpreter.
```bash
#!/bin/sh

# $1, $2 … — command line argument 1, 2 ...
# $0 — name of the script itself
# $* — all command line arguments
# $# — number of command line arguments so

echo "$0"
echo "$1"

# ...

echo "$*"
echo "$#"
```

### Conditions and Exit Status

When a utility is called from a Shell script, it is possible to interpret its exit status in a conditional expression.
For example, the script below calls the [ls](https://man7.org/linux/man-pages/man1/ls.1.html) utility and prints
“YES” only if its status code is successful.
```bash
#!/bin/sh

if ls $*; then
    echo YES
else
    echo NO $?
fi
```

The script below redirects the output of the [ls](https://man7.org/linux/man-pages/man1/ls.1.html) utility and
prints it only if the status code of the utility is successful.
```bash
#!/bin/sh

if ls $* -I out > out; then
    echo YES
    cat out
    rm -f out
else
    echo NO $?
fi
```

Using `2> /dev/null` to redirect error messages out of a terminal:

```bash
acos@acos-vm:~$ ls nofile
ls: cannot access 'nofile': No such file or directory
acos@acos-vm:~$ ls nofile 2> err
acos@acos-vm:~$ cat err
ls: cannot access 'nofile': No such file or directory
acos@acos-vm:~$
```

#### Task 03:

Rewrite the previous example so that it:
* outputs the content of `ls` after «YES» message if `ls` is successful;
* does not to output an error message if `ls` is not successful.

### Advanced Shell Features

The Shell language has features common for many programming languages such as conditions, loops, and functions.
For example the script below enumerates over a collection of values:
```bash
#!/bin/sh

for n in 1 2 3 10 20 30 qwe asd xcv; do
    echo "Next value $n"
done
```

The script below defines a function that enumerates over a collection of its arguments. 
Arguments of a function are accessed using special symbols in the same way as arguments of the Shell script.
```bash
#!/bin/sh

fun() {
    echo "$0: $# $*"
    for arg; do
        echo "> $arg"
    done
}

fun 1 QWE "3 4"
fun "$*"
fun  $*
fun "$@"
```

#### Task 04:

Create a program with the following structure:
```bash
#!/bin/sh

sum() {
    # insert your code here
}

while read a b; do
    sum $a $b
done
```
Then do the following:
* Note how `read var1 var2 … varN` works.
* Read documentation on [expr](https://man7.org/linux/man-pages/man1/expr.1.html)
  and improve the program so that it prints the sum of `$a` and `$b`.
* Assume that the input is always correct.

## Homework

1. Experiments with the `read` builtin command.
   * Research: What exit status the command `read` generates? Try it.
     Consult [help read](https://www.gnu.org/software/bash/manual/bash.html#index-read)
     command instead of `man read`, because `read` is a Shell builtin and you got manual page on _all_ Shell builtins.
   * Research: How to suppress «`\n`» output after [echo](https://man7.org/linux/man-pages/man1/echo.1.html)?
   * Task: Write a script that asks user for name,
     and prints a welcome message either if a user has entered a name or not:

     ```bash
     $ ./c8
     Enter your name: Spot
     Hello, Spot!
     $ ./c8
     Enter your name:
     Hello, tmpuser?
     ```

   * Hint: In second example user had __not__ pressed «Enter»

1. Read documentation on [expr](https://man7.org/linux/man-pages/man1/expr.1.html) again.
   Write Shell script `sumsum.sh` that:

   * has function `sum()` that:
       * sums all of its arguments (any number of arguments is permitted);
       * returns this sum if there are no errors;
       * returns `0` if there was an error (e.g. attempt to sum non-numbers);

   * redirects all error messages to `/dev/null`;
   * reads two lines of numbers;
   * prints whether their sums was equal or not (`0` values as a result of errors are considered equal).

   ```bash
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
   ```

   _Hint_: errors can be checked using the `$?` symbol (status of the last command, must be 0 if successful).

1. Finish getting access to the [Ubuntu server in the cloud](../../software/cloud_ssh.md).
   You must provide a public key, the administrator must create an account, and then you must connect to it.
   After you connect, do the following:
   * create in your working folder the `os_lab_bash` directory;
   * copy there all files created during this workshop and homework
     (use the [scp](https://man7.org/linux/man-pages/man1/scp.1.html) tool).

# References

* Chapters 8 and 10. [[PGLC]](../../books.md) Mark G. Sobell, Matthew Helmke.
  [Practical Guide to Linux Commands, Editors, and Shell Programming.](
  https://www.pearson.com/store/p/practical-guide-to-linux-commands-editors-and-shell-programming-a/P100000878019/9780134774602)
  4th Edition. 2018.
