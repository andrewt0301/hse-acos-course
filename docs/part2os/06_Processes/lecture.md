Lecture 6
---

# Processes and Threads

## Lecture

Slides ([PDF](OS_Lecture_06.pdf), [PPTX](OS_Lecture_06.pptx)).

## Workshop

### Processes

Modern operating systems run programs in an isolated context called a process.
Each process has its own address space,
where it stores the code of the executed program and data the program operates with.
A process is typically run by double-clicking a program or by executing a command-line command (`./program`).
The operating system switches between processes to give a user possibility to interact
with several programs and to give a feeling of concurrent execution of programs
(multicore processors allow executing multiple processes in parallel, but this parallelism is limited
by the number of cores).

In Linux, the list of the currently running processes can be viewed
with the help of the [ps](https://man7.org/linux/man-pages/man1/ps.1.html) utility:
```bash
acos@acos-vm:~$ ps -ef
```

Another useful utility is [top](https://man7.org/linux/man-pages/man1/top.1.html).
It provides a dynamic view on running processes and resources allocated by the operating system.

Linux also includes the `/proc` virtual file system,
which provides information on running processes and other feature of the system
in the form of virtual folders and files.
For example, it is possible to get information in the version of the currently running Linux:
```bash
acos@acos-vm:~$ cat /proc/version

Linux version 5.4.0-52-generic (buildd@lgw01-amd64-060) (gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #57-Ubuntu SMP Thu Oct 15 10:57:00 UTC 2020
```
Each process is assigned a unique process identifier (PID), which is an integer number.
It allows addressing a specific process running in the system.

For example, the process of the Shell terminal used in these examples has an identifier equal to `2134`.
```bash
acos@acos-vm:~$ ps
PID TTY TIME CMD
  2134 pts/0 00:00:00 bash
  2297 pts/0 00:00:00 ps
```

### Managing Processes

Linux provides system calls for managing process.
The most important of them is [fork](https://man7.org/linux/man-pages/man2/fork.2.html).
It creates a new process by duplicating the calling process.
The new process is called the _child process_, while the current process is called the _parent process_.
The processes run in separate memory.
However, at the time of calling fork, both memory spaces have the same content.

To run a different program in the newly created process (and, thus, to update memory),
the [exec](https://man7.org/linux/man-pages/man3/exec.3.html) system call is used.

Another useful system call is [wait](https://man7.org/linux/man-pages/man2/wait.2.html),
which allows the parent process to wait for the child process to change state (e.g. terminate).

The example below runs the `ls` utility in a separate child process:

```c
#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>

int main() {
    pid_t pid;
    // fork a child process
    pid = fork();
    if (pid < 0) { // error occurred
        perror("Fork Failed");
        return 1;
    } else if (pid == 0) { // child process
        execlp("/bin/ls", "ls", NULL);
    } else { // parent process
        // parent will wait for the child to complete
        wait(NULL);
        printf("Child Complete");
    }
    return 0;
}
```

## Homework

__TODO__

# References

* Processes. Chapter 3 in [[OSC]](../../books.md).
* Processes. Section 8.2 in [[CSPP]](../../books.md).
* Processes. Chapter 6 in [[TLPI]](../../books.md).
