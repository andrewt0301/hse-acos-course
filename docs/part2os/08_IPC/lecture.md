Lecture 8
---

# Inter-process communication

## Lecture

Slides ([PDF](OS_Lecture_08.pdf), [PPTX](OS_Lecture_08.pptx)).

<!--
Outline:
-->
## Workshop

### Threads

* [pthread_create](https://www.man7.org/linux/man-pages/man3/pthread_create.3.html)
* [pthread_join](https://man7.org/linux/man-pages/man3/pthread_join.3.html)
* [pthread_exit](https://man7.org/linux/man-pages/man3/pthread_exit.3.html)
* [pthread_detach](https://man7.org/linux/man-pages/man3/pthread_detach.3.html)

A simple multithreaded program:
```c
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void * threadFunc(void *arg) {
    char *s = (char *) arg;
    printf("%s", s);
    return (void *) strlen(s);
}

int main(int argc, char *argv[]) {
    pthread_t t1;
    void *res;
    int s;
    s = pthread_create(&t1, NULL, threadFunc, "Hello world\n");
    if (s != 0) {
        perror("pthread_create");
        return -1;
    }
    printf("Message from main()\n");
    s = pthread_join(t1, &res);
    if (s != 0) {
        perror("pthread_join");
        return -1;
    }
    printf("Thread returned %ld\n", (long) res);
    exit(EXIT_SUCCESS);
}
```

A multithreaded program without synchronization:
```c
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

static int glob = 0;

/* Loop 'arg' times incrementing 'glob' */
static void * threadFunc(void *arg) {
    int loops = *((int *) arg);
    int loc, j;
    for (j = 0; j < loops; j++) {
        loc = glob;
        loc++;
        glob = loc;
    }
    return NULL;
}

int main(int argc, char *argv[]) {
    pthread_t t1, t2;
    int loops, s;
    loops = (argc > 1) ? atoi(argv[1]) : 10000000;
    s = pthread_create(&t1, NULL, threadFunc, &loops);
    if (s != 0) {
        perror("pthread_create");
        return -1;
    }
    s = pthread_create(&t2, NULL, threadFunc, &loops);
    if (s != 0) {
        perror("pthread_create");
        return -1;
    }
    s = pthread_join(t1, NULL);
    if (s != 0) {
        perror("pthread_join");
        return -1;
    }
    s = pthread_join(t2, NULL);
    if (s != 0) {
        perror("pthread_join");
        return -1;
    }
    printf("glob = %d\n", glob);
    exit(EXIT_SUCCESS);
}
```

A multithreaded program with synchronization:

```c
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

static int glob = 0;
static pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;

/* Loop 'arg' times incrementing 'glob' */
static void * threadFunc(void *arg) {
    int loops = *((int *) arg);
    int loc, j, s;
    for (j = 0; j < loops; j++) {
        s = pthread_mutex_lock(&mtx);
        if (s != 0) {
            perror("pthread_mutex_lock");
            return NULL;
        }
        loc = glob;
        loc++;
        glob = loc;
        s = pthread_mutex_unlock(&mtx);
        if (s != 0) {
            perror("pthread_mutex_unlock");
            return NULL;
        }
    }
    return NULL;
}

int main(int argc, char *argv[]) {
    pthread_t t1, t2;
    int loops, s;
    loops = (argc > 1) ? atoi(argv[1]) : 10000000;
    s = pthread_create(&t1, NULL, threadFunc, &loops);
    if (s != 0) {
        perror("pthread_create");
        return -1;
    }
    s = pthread_create(&t2, NULL, threadFunc, &loops);
    if (s != 0) {
        perror("pthread_create");
        return -1;
    }
    s = pthread_join(t1, NULL);
    if (s != 0) {
        perror("pthread_join");
        return -1;
    }
    s = pthread_join(t2, NULL);
    if (s != 0) {
        perror("pthread_join");
        return -1;
    }
    printf("glob = %d\n", glob);
    exit(EXIT_SUCCESS);
}
```

__TODO__

## Homework

__TODO__

# References

__TODO__
