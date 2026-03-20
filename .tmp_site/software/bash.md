Linux Utility Programs and Bash
---

Unix-based systems (such as Linux and MacOS) provide utility programs to perform various systems tasks.
These utilities are used via command-line interface.
[Bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29)
is command-line processor and language used to execute these command. 
Bash is supported in Linux and MacOS.
In Windows, a limited support is implemented in [Windows PowerShell](https://en.wikipedia.org/wiki/PowerShell) Git Bash. 
Also, some of the commands are implemented in Terminal of JetBrains IDEs (PyCharm, IntelliJ IDEA, CLion, etc.).

# Main Bash commands

1. `man` - prints documentation on other commands
1. `pwd` - prints current working directory
1. `ls` - prints directory contents
1. `cd` - changes current directory
1. `mkdir` - creates a new directory
1. `file` - determines file type
1. `echo` - prints messages to the standard output
1. `cp` - copies files and folders
1. `mv` - renames or moves files or folders
1. `rm` - deletes files or folders
1. `su` - run a command with substitute user (e.g. root)
1. `exit` - causes Bash to exit
1. `uname` - print system information
1. `which` - locate a command

## Installing additional programs in Linux Ubuntu

Midnight Commander file manager:
```bash
acos@acos-vm:~$ sudo apt install mc
```
1. `sudo` helps execute a command as a superuser
1. `apt` is a Linux package manager

## Creating, editing and viewing source code:

1. `cat` - concatenates and prints text files
1. `head` - outputs the first part of files
1. `tail` - outputs the last part of files
1. `nano` - simple console code editor
1. `mcedit` - mcedit simple editor from Midnight Commander
1. `vim` - Vi IMproved, a programmer's text editor

## Compiling and running programs in C

Use the following commands (work in MacOS too).

Compiling:
```bash
gcc hello.c -o hello.c
```

Running:
```bash
./hello
```

Measuring performance with the `time` utility:
```bash
time ./hello
```

## Getting information on CPU configuration

Using utility `lscpu`:
```bash
lscpu
```

Viewing virtual file `/proc/cpuinfo`:
```bash
less /proc/cpuinfo
```

## Getting information on the computer and OS

Using utility `uname` to get system information:
```bash
uname -a
```

Viewing virtual file `/proc/version`:
```bash
cat /proc/version
```

Using utility `hostnamectl` to get information on the computer:
```bash
hostnamectl
```
