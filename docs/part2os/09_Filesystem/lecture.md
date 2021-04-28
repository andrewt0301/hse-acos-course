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
 
void handler(intsig) {
    printf("Caught %d\n", sig);
}

int main(intargc, char *argv[]) {
    signal(SIGINT,  handler);
    signal(SIGSEGV, handler);
    
    int i;
    for(i=0;; i++) {
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

int main(intargc, char *argv[]) {
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

## Homework

__TODO__

# References

__TODO__
