Shell Scripts
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

## Homework

1. * Research: What exit status the command `read` generates? Try it
     Consult `help read` (e.g. [here](https://www.gnu.org/software/bash/manual/bash.html#index-read))
     command instead of `man read`, because `read` is a Shell builtin and you got manual page on _all_ Shell builtins.
   * Research: How to suppress «`\n`» output after `echo` (see [[man1:echo]])?
   * Task: Write a `c8` script that asks user for name,
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
