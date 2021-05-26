Lecture 9
---

# Inter-Process Communication

## Lecture

Slides ([PDF](OS_Lecture_09.pdf), [PPTX](OS_Lecture_09.pptx)).

## Outline

* Signals
* Message Queues
* Shared Memory

## Examples

### Signals

Never-ending program (to be used to send signals). 

__endless.c:__

```c
#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
   int i;
   for (i = 0;; i++) {
       sleep(1);
       printf("%d\n", i);
   }
   return 0;
}
```

Sending signals in a C program.

__killn.c__:

```c
#include <stdio.h>
#include <sys/types.h>
#include <signal.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (kill(atoi(argv[1]), atoi(argv[2]))) {
        perror("Failed to kill");
    }
    return 0;
}
```

Handling signals in C programs.

__catch.c:__

```c
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
 
void handler(int sig) {
    printf("Caught %d\n", sig);
}

int main(int argc, char *argv[]) {
    signal(SIGINT,  handler);
    signal(SIGSEGV, handler);
    
    int i;
    for (i = 0;; i++) {
       sleep(1);
       printf("%d\n", i);
    }
    return 0;
}
```

Monitoring child processes.

__waitchild.c__:

```c
#include <stdio.h>
#include <wait.h>
#include <signal.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    int stat;
    pid_t pid;
    if ((pid = fork()) == 0) {
        while(1);
    } else {
        printf("Forking a child: %d\n", pid);
        wait(&stat);
        printf("And finally…\n");

        if (WIFSIGNALED(stat)) {
            psignal(WTERMSIG(stat), "Terminated:");
        }
        printf("Exit status: %d\n", stat);
    }
    return 0;
}
```

### Message Queues

Creating a message queue:
```c
#include <mqueue.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
    mqd_t mqd;
    struct mq_attr attr;
    attr.mq_maxmsg = 10;
    attr.mq_msgsize = 2048;
    
    mqd = mq_open(argv[1], O_RDWR|O_CREAT|O_EXCL, S_IRUSR|S_IWUSR, attr);
    return 0;
}
```

Sending a message to queue:
```c
#include <mqueue.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    mqd_t mqd;
    unsigned int prio;
    mqd = mq_open(argv[1], O_WRONLY);
    prio = atoi(argv[2]);
    mq_send(mqd, argv[3], strlen(argv[3]), prio);
    return 0;
}
```

Receiving a message:
```c
#include <mqueue.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>

int main(intargc, char *argv[]) {
   mqd_t mqd;
   unsigned int prio;
   void *buf;
   struct mq_attr attr;
   ssize_t n;
   mqd = mq_open(argv[1], O_RDONLY);
   mq_getattr(mqd, &attr);
   buf = malloc(attr.mq_msgsize);
   n = mq_receive(mqd, buf, attr.mq_msgsize, &prio);
   printf("Read %ld bytes; priority = %u\n", (long) n, prio);
   free(buf);
   return 0;
}
```

### Shared memory

Mapping a file to memory:

```c
#include <sys/mman.h>
#include <sys/stat.h>
#include <stdio.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {
    char *addr;
    int fd;
    struct stat sb;

    fd = open(argv[1], O_RDONLY);
    fstat(fd, &sb);
    addr = mmap(NULL, sb.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
    fwrite(addr, 1, sb.st_size, stdout);
    return 0;
}
```

Creating shared memory:

```c
#include <stdio.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int fd;
    size_t size;
    void *addr;

    fd = shm_open(argv[1], O_RDWR|O_CREAT|O_EXCL, S_IRUSR|S_IWUSR);
    size = atol(argv[2]);
    ftruncate(fd, size);

    addr = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    close(fd);

    return 0;
}
```

Writing to shared memory:

```c
#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    int fd;
    size_t len;
    char *addr;

    fd = shm_open(argv[1], O_RDWR, 0);
    len = strlen(argv[2]);
    ftruncate(fd, len);

    addr = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    close(fd);

    printf("Copying %d bytes\n", len);
    memcpy(addr, argv[2], len);
    return 0;
}
```

Reading from shared memory:
```c
#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    int fd;
    char *addr;
    struct stat sb;

    fd = shm_open(argv[1], O_RDONLY, 0);
    fstat(fd, &sb);
    addr = mmap(NULL, sb.st_size, PROT_READ, MAP_SHARED, fd, 0);
    close(fd);

    fwrite(addr, 1, sb.st_size, stdout);
    printf("\n... Done");
    return 0;
}
```

## Workshop

### Outline

* Practice with signals
* Study, run, and modify the lecture examples.

### Notes

#### Signals

List of signals supported in your Linux or MacOS:
```bash
kill -l
```

Documentation on the `kill` utility that sends signals to processes:
```bash
man kill
```

Documentation on the `kill` system call:
```bash
man 2 kill
```

Important signals:

* `SIGHUP`   (1) - Terminal is closed.
* `SIGINT`   (2) - Interrupt process from terminal (`Ctrl-C`).
* `SIGQUIT`  (3) - Terminate process and dumps core (`Ctrl-\`).
* `SIGKILL`  (9) - Immediately terminate process (cannot be handled).
* `SIGTERM` (15) - Request terminating process (can be handled). Sent by default.
* `SIGSTOP` (19) - Stop a process for later resumption (cannot be handled).
* `SIGTSTP` (20) - Request stop process (`Ctrl-Z`, can be handled). 
* `SIGCONT` (18) - Continue (restart) process previously paused by `SIGSTOP` or `SIGTSTP`. 
* `SIGCHLD` (17) - Child process exits, is interrupted, or resumes. 

See the full list in [Wikipedia](https://en.wikipedia.org/wiki/Signal_%28IPC%29).

#### Managing processes

Utilities for managing processes:

* `ps`
* `ps -a`
* `ps -ef`
* `pstree`
* `ps axu` (BSD-style format)
* `ps xf` (BSD style own process only)
* `pidof program`
* `ls /proc`
* `kill proc` / `kill -STOP proc` / `kill -HUP proc` (use two terminals)

To get detailed documentation, use the [man](https://man7.org/linux/man-pages/man1/man.1.html) utility.

#### Foreground and background processes

* Foreground
    * Interactive process (can input and output)
    * Can be only one per a terminal
    * Run like this: `./endless`
* Background
    * Can only output
    * Can be any number
    * Run like this: `./endless &` (__&__ at the end)
* Changing type
    * `Ctrl-Z` to stop (or send `SIGSTOP` / `SIGTSTP`)
    * `fg` to continue in foreground
    * `bg` to continue in background

### Tasks

1. Make the `09_IPC` directory at the server. Code must reside there.

1. Compile program `endless.c` from the lecture. Perform the following actions with it:

   * runs it in the background;
   * stops it;
   * resumes it in foreground;
   * sends it the `SIGINT` signal to terminate:
       * use `ps -a` to get the list of running processes and their IDs;
       * use another instance of terminal to send a signal.

1. Create program `proc.c` (modify `endless.c` from the lecture) that:

   * waits forever;
   * periodically printfs its PID via [getpid](https://man7.org/linux/man-pages/man2/getpid.2.html) and the increased counter;
   * uses a command-line argument to define the timeout between printfs.

   For example, `./proc 5` printfs once a 5 seconds
   (using [sleep](https://man7.org/linux/man-pages/man3/sleep.3.html)):

   ```
   26475: 0
   26475: 1
   26475: 2
   ...
   ```

1. Write program `killn.c` to send a signal.
   * use `kill -l` and edit its output to create signal names array;
       *  _challenge_: you can use the [sed](https://man7.org/linux/man-pages/man1/sed.1.html)
          utility (`sed s/regexp/replacement/g`) to eliminate handwork;
   * `./killn PID NAME` sends `PID` process signal `NAME`;
   * see [kill](https://man7.org/linux/man-pages/man2/kill.2.html);
   * use [perror](https://man7.org/linux/man-pages/man3/perror.3.html) if an error occurred;
   * print "No such signal" if `NAME` is not found and returns `1` instead of `0`;
   * try to `./killn` running `proc 4`, non-existent process, foreign process.

1. Copy `proc.c` to `catch.c` and modify it, adding a signal handler

   * `./catch 5 SIGNAL_NAME1 SIGNAL_NAME2 ...` should print corresponded signals'
   description (via [strsignal](https://man7.org/linux/man-pages/man3/strsignal.3.html))
   when catching a signal instead of falling off (still printing messages once a 5 seconds).
      * note not all signals can be handled

         ```
         $ ./catch 5 INT ABRT SEGV
         26775: 0
         ^C[Caught: Interrupt]26775: 1
         26775: 2
         [Caught: Segmentation fault]26775: 3
         26775: 4
         26775: 5
         [Caught: Aborted]26775: 6
         26775: 7
         Illegal instruction
         $
         ```
    
         ```
         $ kill -SEGV 26775
         $ kill -ABRT 26775
         $ kill -ILL 26772
         ```

1. Join `catch.c` with child-control program from the lecture, name the result `childctl.c`.
    * `./childctl timeout signalQ signal1 … signaln` should:
        * print a message once in timeout seconds;
        * catch `signal1` ... `signaln` and print message;
        * peacefully exit when got `signalQ`.

## Homework

1. Finish all programs from the workshop (and send them).

1. Modify the last program to:
   * exit after getting `signalQ` three times;
   * check every syscall return values on error state.

# References

* Interprocess communication overview. Chapter 49 in [[TLPI]](../../books.md).
* Signals: fundamental concepts. Chapter 20 in [[TLPI]](../../books.md).
* POSIX message queues. Chapter 50 in [[TLPI]](../../books.md).
* Memory mappings. Chapter 49 in [[TLPI]](../../books.md).
* POSIX shared memory. Chapter 54 in [[TLPI]](../../books.md).
