Linux Utility Programs and Bash
---

Unix-based systems (such as Linux and MacOS) provide utility programs to perform various systems tasks.
These utilities are via command-line interface.
Bash is command-line processor and language used to execute these command. 
Bash is supported in Linux and MacOS. In Windows, a partial support is implemented in Git Bash. 
Also, come of the commands are implemented in Terminal of JetBrains IDEs (PyCharm, IntelliJ IDEA, CLion, etc.).

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

   ```bash
   acos@acos-vm:~$ su
   root@acos-vm:/home/acos# apt install mc
   root@acos-vm:/home/acos# exit
   ```

## Creating, editing and viewing source code:

1. `cat` - concatnates and prints text files
1. `head` - outputs the first part of files
1. `tail` - outputs the last part of files
1. `nano` - simple console code editor
1. `mcedit` - mcedit simple editor from Midnight Commander
1. `vim` - Vi IMproved, a programmer's text editor

## Compiling and running programs in C

1. Use the following commands (work in MacOS too).

   Compiling:
   ```bash
   gcc hello.c -o hello.c
   ```

   Running:
   ```bash
   ./hello
   ```
