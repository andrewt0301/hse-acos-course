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

Never-ending program:
```c
#include <stdio.h>
#include <unistd.h>

int main(intargc, char *argv[]) {
   int i;
   for (i=0;; i++) {
       sleep(1);
       printf("%d\n", i);
   }
   return 0;
}
```

Sending signals in a C program:
```c
#include <stdio.h>
#include <sys/types.h>
#include <signal.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (kill(atoi(argv[1]), atoi(argv[2])))
        perror("Failed to kill");
    return 0;
}
```

Handling signals in C programs:
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
    for (i=0;; i++) {
       sleep(1);
       printf("%d\n", i);
    }
    return 0;
}
```

Monitoring child processes:
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
        
        if (WIFSIGNALED(stat))
            psignal(WTERMSIG(stat), "Terminated:");
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

<!--
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
-->

## Workshop

Use lecture examples and modify them.

1. Make 09_IPC directory at the server. Code must reside there.

1. Utilities for managing processes.
   * `ps -ef`
   * `pstree`
   * `ps axu` (BSD-style format)
   * `ps xf` (BSD style own process only)
   * `pidof program`
   * `ls /proc`
   * `kill proc` / `kill -STOP proc` / `kill -HUP proc` (use two terminals)

1. Create program `proc.c` that waits forever,
   periodically printfs its PID via `getpid` and the increased counter.
   A parameter defines the timeout between printfs.
   * `./proc 5 printfs` once a 5 seconds (using sleep). Examples
        ```
        26475: 0
        26475: 1
        26475: 2
        ...
        ```

1. Write program `killn.c` to send a signal.
   * use `/bin/kill -l | head -16` and edit its output to create signal names array.
   * (!) challenge: use `sed s/regexp/replacement/` to eliminate handwork.
     Spoiler: much uglier version that does all is
     `/bin/kill -l | head -16 | sed 's/\(.*\)/"\1",/;1s/^/char *names[]={"NONE", /;$s/,$/};/' | tr '\n' ' '`
    * `./killn PID NAME` sends PID process signal NAME
    * see [kill]()
    * use [perror]() if error occurred
    * print "No such signal" if NAME isn't found and returns 1 instead of 0
    * try to `./killn` running `proc 4`, non-existent process, foreign process.

1. Copy `proc.c` to `catch.c` and modify it, adding a signal handler

   * `./catch 5 SIGNAL_NAME1 SIGNAL_NAME2 ...` should print corresponded signals'
      description (via `strsignal`) when catching a signal instead of falling off
     (still printing messages once a 5 seconds).
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

1. Join `catch.c` with child-control program from lecture, name the result `childctl.c`.
    * `./childctl timeout signalQ signal1 … signaln` should:
        * print a message once in timeout seconds;
        * catch signal1 … signaln and print message;
        * peacefully exit when got signalQ.

## Homework

__TODO__

# References

__TODO__
