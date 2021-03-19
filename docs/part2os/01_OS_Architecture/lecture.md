Lecture 1
---

# Operating System Architecture. Linux

## Lecture

Slides ([PDF](OS_Lecture_01.pdf), [PPTX](OS_Lecture_01.pptx)).

## Workshop

#### Outline

* [Installing](../../software/ubuntu_install.md) and [using]((../../software/ubuntu.md)) Linux Ubuntu in VirtualBox
* Installing Git Bash (for Windows users)
* Learning main Bash commands

#### Practice

Before start

1. Windows users need to [download](https://git-scm.com/downloads) and install Git.
1. Make sure that VirtualBox with Linux Ubuntu VM is installed and running.
1. See reference on Git is available [here](https://git-scm.com/book/en/v2).

Connecting to the running VM

1. Run terminal in your host operating system (Git Bash for Windows).
1. Execute the following command:
   ```bash
   ssh acos@localhost -p2022
   ```
1. Use the password `acos2020`.

Linux utility programs and Bash

Unix-based systems (such as Linux and MacOS) provide utility programs to perform various systems tasks.
These utilities are via command-line interface.
Bash is command-line processor and language used to execute these command. 
Bash is supported in Linux and MacOS. In Windows, apratial support is implemented in Git Bash. 
Also, come of the commands are implemented in Terminal of JetBrains IDEs (PyCharm, IntelliJ IDEA, CLion, etc.).

Main Bash commands

1. `man` - prints documentation on other commands
1. `pwd` - prints current working directory
1. `ls` - prints directory contents
1. `cd` - changes current directory
1. `mkdir` - creates a new directory
1. `cat` - concatnates and prints text files
1. `file` - determines file type
1. `echo` - prints messages to the standard output
1. `cp` - copies files and folders
1. `mv` - renames or moves files or folders
1. `rm` - deletes files or folders
1. `su` - run a command with substitute user (e.g. root)
1. `exit` - causes Bash to exit

Compiling programs in C

1. Use the following command (works in MacOS too):
   ```bash
   gcc hello.c -o hello.c
   ```

Installing programs in Linux Ubuntu

   ```
   acos@acos-vm:~$ su
   root@acos-vm:/home/acos# apt install mc
   root@acos-vm:/home/acos# exit
   ```

## Homework

__TODO__

# References

1. [Bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29) (Wikipedia)
1. [Linux man pages online](https://man7.org/linux/man-pages/index.html)

__TODO__
