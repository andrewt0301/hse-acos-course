Lecture 9
---

# Inter-Process Communication

## Lecture

Slides ([PDF](OS_Lecture_09.pdf), [PPTX](OS_Lecture_09.pptx)).

## Outline

* Signals
* Message Queues
* Shared Memory

## Workshop

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


## Homework

__TODO__

# References

__TODO__
