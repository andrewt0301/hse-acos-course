Lecture 8
---

# Threads and synchronization

## Lecture

Slides ([PDF](OS_Lecture_08.pdf), [PPTX](OS_Lecture_08.pptx)).

## Workshop

### Outline

* Threads
* Spinlocks
* Mutexes and locks
* Conditional variables
* Thread local variables
* Atomic variables

### Threads in C

#### Compiling

```bash
gcc thread1.c -o thread -lpthread
```

#### Simple multithreaded program

Functions:
* [pthread_create](https://www.man7.org/linux/man-pages/man3/pthread_create.3.html)
* [pthread_join](https://man7.org/linux/man-pages/man3/pthread_join.3.html)
* [pthread_exit](https://man7.org/linux/man-pages/man3/pthread_exit.3.html)
* [pthread_detach](https://man7.org/linux/man-pages/man3/pthread_detach.3.html)


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

#### Multithreaded program without synchronization

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

#### Multithreaded program with synchronization (mutexes):

Functions:
* [pthread_mutex_lock](https://man7.org/linux/man-pages/man3/pthread_mutex_lock.3p.html)
* [pthread_mutex_unlock](https://man7.org/linux/man-pages/man3/pthread_mutex_lock.3p.html)

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

#### Conditional variables

Functions:
* [pthread_cond_signal](https://man7.org/linux/man-pages/man3/pthread_cond_broadcast.3p.html)
* [pthread_cond_broadcast](https://man7.org/linux/man-pages/man3/pthread_cond_broadcast.3p.html)
* [pthread_cond_wait](https://man7.org/linux/man-pages/man3/pthread_cond_wait.3p.html)

```c
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

static pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t cv_full = PTHREAD_COND_INITIALIZER;
static pthread_cond_t cv_empty = PTHREAD_COND_INITIALIZER;

static int data;
static int data_ready;

typedef struct {
   int count;
   int* items;
} array;

static void * producerFunc(void *arg) {
    array* parr = (array *) arg;
    int count = (*parr).count;
    int *items = (*parr).items;
    for (int i = 0; i < count; ++i) {
        pthread_mutex_lock(&m);
        while (data_ready) {
            pthread_cond_wait(&cv_empty, &m);
        }
        data = items[i];
        printf("produced %d\n", data);
        data_ready = 1;
        pthread_mutex_unlock(&m);
        pthread_cond_signal(&cv_full);
    }
}

static void * consumerFunc(void *arg) {
    int items = (int) arg;
    for (int i = 0; i < items; ++i) {
        pthread_mutex_lock(&m);
        while (!data_ready) {
            pthread_cond_wait(&cv_full, &m);
        }
        printf("consumed %d\n", data);
        data_ready = 0;
        pthread_mutex_unlock(&m);
        pthread_cond_signal(&cv_empty);
   }
}

int main() {
    int items[] = {1, 1, 2, 3, 5, 8, 13, 21, 34, 55};
    pthread_t producer, consumer;
    array arr;
    int s;
    arr.count = sizeof(items) / sizeof(int);
    arr.items = items;
    s = pthread_create(&producer, NULL, producerFunc, &arr);
    if (s != 0) {
        perror("pthread_create");
        return -1;
    }
    s = pthread_create(&consumer, NULL, consumerFunc, (void *) arr.count);
    if (s != 0) {
        perror("pthread_create");
        return -1;
    }
    s = pthread_join(producer, NULL);
    if (s != 0) {
        perror("pthread_join");
        return -1;
    }
    s = pthread_join(consumer, NULL);
    if (s != 0) {
        perror("pthread_join");
        return -1;
    }
    exit(EXIT_SUCCESS);
}
```


### Threads in C++

#### Compiling:

```bash
g++ -Wall -g -std=c++0x -pthread threads.cpp -o threads
```

#### Class `std::thread` from library `<thread>`

```cpp
#include <iostream>
#include <thread>

void f1() {
    std::cout << "Hello from f1" << std::endl;
}

void f2(int a, int b) {
    std::cout << "f2 invoked with " << a << ", " << b << std::endl;
}

int main() {
    std::thread t1(f1);
    t1.join();

    std::thread t2(f2, 1, 2);
    t2.join();

    std::thread t3(f2, 5, 7);
    t3.join();

    int i = 7;
    std::thread t4([&]() {
        std::cout << "lambda invoked with captured i == " << i << std::endl;
    });
    t4.join();

    std::thread t5([&](int a) {
        std::cout << "lambda invoked with captured i == "
                  << i << " and a == " << a << std::endl;
    }, 1024);
    t5.join();

    auto f = [&](int k) {
        f1();
        f2(i, i * k);
    };
    std::thread t6(f, 99);
    t6.join();
}
```

#### Mutexes, locks, and conditional variables

```cpp
#include <condition_variable>
#include <iostream>
#include <mutex>
#include <string>
#include <thread>

std::mutex m;
std::condition_variable cv_full, cv_empty;

int data;
bool data_ready;

void consumer_thread(int items) {
    for (int i = 0; i < items; ++i) {
        std::unique_lock<std::mutex> g(m);
        cv_full.wait(g, []() { return data_ready; });
        std::cout << "consumed " << data << std::endl;
        data_ready = false;
        cv_empty.notify_one();
    }
}

void producer_thread(int count, int *items) {
    for (int i = 0; i < count; ++i) {
        std::unique_lock<std::mutex> g(m);
        cv_empty.wait(g, []() { return !data_ready; });
        data = items[i];
        std::cout << "produced " << data << std::endl;
        data_ready = true;
        cv_full.notify_one();
    }
}

int main() {
    int items[] = {1, 1, 2, 3, 5, 8, 13, 21, 34, 55};
    std::thread producer(producer_thread, 10, items);
    std::thread consumer(consumer_thread, 10);
    producer.join();
    consumer.join();
}
```

#### Atomic and thread local variables

```cpp
#include <iostream>
#include <atomic>
#include <mutex>
#include <thread>
#include <vector>

thread_local int local_counter = 0;
std::atomic<int> global_counter{0};
std::mutex m;

void increment(int howmany) {
    for (int i = 0; i < howmany; ++i) {
        local_counter++;
        global_counter++;
    }
    std::lock_guard<std::mutex> g(m);
    std::cout << "Thread exiting with local = " << local_counter
              << " and global = " << global_counter << std::endl;
}

void run_threads(int thread_count, int increments_per_thread) {
    std::vector<std::thread> threads;
    for (int i = 0; i < thread_count; ++i)
        threads.push_back(std::thread(increment, increments_per_thread));
    for (int i = 0; i < thread_count; ++i)
        threads[i].join();
}

int main() {
    run_threads(5, 10);
    return 0;
}
```

## Tasks

Please use the C language and the POSIX thread library.

1. Write a multithreaded program that calculates various statistical values
   for a list of numbers. This program will be passed a series of numbers
   on the command line and will then create three separate worker threads.
   One thread will determine the average of the numbers, the second will
   determine the maximum value, and the third will determine the minimum
   value. For example, suppose your program is passed the integers:

   ```
   90 81 78 95 79 72 85
   ```

   The program will report:

   ```
   The average value is 82
   The minimum value is 72
   The maximum value is 95
   ```

   The variables representing the average, minimum, and maximum values
   will be stored globally. The worker threads will set these values, and
   the parent thread will output the values once the workers have exited.
   (We could obviously expand this program by creating additional threads
   that determine other statistical values, such as median and standard
   deviation).
   
1. The Fibonacci sequence is the series of numbers `0, 1, 1, 2, 3, 5, 8, ...`.
   Formally, it can be expressed as:

   ```
   fib(0) = 0
   fib(1) = 1
   fib(n) = fib(n−1) + fib(n−2)
   ```

   Write a multithreaded program that generates the Fibonacci sequence.
   This program should work as follows: On the command line, the user
   will enter the number of Fibonacci numbers that the program is to generate.
   The program will then create a separate thread that will generate
   the Fibonacci numbers, placing the sequence in data that can be shared
   by the threads (an array is probably the most convenient data structure).
   When the thread finishes execution, the parent thread will output
   the sequence generated by the child thread. Because the parent thread
   cannot begin outputting the Fibonacci sequence until the child thread.

## Homework

__TODO__

# References

* [Synchronization](https://en.wikipedia.org/wiki/Synchronization_%28computer_science%29) (Wikipedia)
* [Critical section](https://en.wikipedia.org/wiki/Critical_section) (Wikipedia)
* [Spinlock](https://en.wikipedia.org/wiki/Spinlock) (Wikipedia)
* Synchronization Tools. Chapter 6 in [[OSC]](../../books.md)
* Threads: Introduction. Chapter 29 in [[TLPI]](../../books.md)
* Threads: Thread synchronization. Chapter 30 in [[TLPI]](../../books.md)
* [Thread support in C++](https://en.cppreference.com/w/cpp/thread)
