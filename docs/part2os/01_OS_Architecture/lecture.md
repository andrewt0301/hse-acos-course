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
* Using Git

#### Practice

##### Before start

1. Windows users need to [download](https://git-scm.com/downloads) and install Git.
1. Make sure that VirtualBox with Linux Ubuntu VM is installed and running.
1. See reference on Git is available [here](https://git-scm.com/book/en/v2).

##### Connecting to the running VM

1. Run terminal in your host operating system (Git Bash for Windows).
1. Execute the following command:
   ```bash
   ssh acos@localhost -p2022
   ```
1. Use the password `acos2020`.

##### Linux utility programs and Bash

Unix-based systems (such as Linux and MacOS) provide utility programs to perform various systems tasks.
These utilities are via command-line interface.
Bash is command-line processor and language used to execute these command. 
Bash is supported in Linux and MacOS. In Windows, apratial support is implemented in Git Bash. 
Also, come of the commands are implemented in Terminal of JetBrains IDEs (PyCharm, IntelliJ IDEA, CLion, etc.).

##### Main Bash commands

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

##### Installing additional programs in Linux Ubuntu

   ```bash
   acos@acos-vm:~$ su
   root@acos-vm:/home/acos# apt install mc
   root@acos-vm:/home/acos# exit
   ```

##### Creating, editing and viewing source code:

1. `cat` - concatnates and prints text files
1. `head` - outputs the first part of files
1. `tail` - outputs the last part of files
1. `nano` - simple console code editor
1. `mcedit` - mcedit simple editor from Midnight Commander
1. `vim` - Vi IMproved, a programmer's text editor

##### Compiling and running programs in C

1. Use the following commands (work in MacOS too).

   Compiling:
   ```bash
   gcc hello.c -o hello
   ```

   Running:
   ```bash
   ./hello
   ```

##### Using Git and GitHub

1. Create a public repository at [GitHub](https://github.com). Create an account if you do already have it.
1. Clone the created repository:
   ```bash
   git clone https://github.com/andrewt0301/test.git
   ```

1. The repository will be cloned in the `test` folder. Change the current directory to it:
   ```bash
   cd test
   ```

1. See help of using Git:
   ```bash
   git help
   ```

1. Set your user name and email for this repository:
   ```bash
   git config user.name Andrei Tatarnikov
   git config user.email andrewt0301@gmail.com
   ```

1. Create or copy the `hello.c` program to this folder.

1. Check the status of files in the Git repository:
   ```bash
   git status
   ```

1. Add the `hello.c` file to the commit:
   ```bash
   git add hello.c
   ```

1. Send the commit to the repository:
   ```bash
   git commit -s -m "hello.c is added"
   ```

1. Update the remote repository (GitHub): 
   ```bash
   git push origin main
   ```

1. Get changes from the remote repository (GitHub): 
   ```bash
   git pull
   ```

## Homework

__TODO__

# References

* [Bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29) (Wikipedia)
* [Linux man pages online](https://man7.org/linux/man-pages/index.html)
* [PGLC] Mark G. Sobell, Matthew Helmke.
  [Practical Guide to Linux Commands, Editors, and Shell Programming.](
  https://www.pearson.com/store/p/practical-guide-to-linux-commands-editors-and-shell-programming-a/P100000878019/9780134774602)
  4th Edition. 2018.
