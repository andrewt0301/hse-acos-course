Контрольная Работа по Операционным Системам (2026)
---

1.  Data type `Var` is defined below. What will be returned by `sizeof(Var)` (64-bit machine)?

  ```c
  typedef struct {
    unsigned int size;
    union {
      char *s;
      short i;
      int n;
    } u;
  } Var;
  ```

  __Answer: 16__

2.  What will be the result of `sizeof(p)` for the code snippet below?

  ```c
  char s[] = "Hello!";
  int *p = s;
  ```

  __Answer: 8__

3.  You have the following small program. What value will be retuned by the main function if the program is compiled with this command `gcc prog.c -DSUCCESS -o prog`?

  ```c
  #ifdef SUCCESS
    #define ZERO
  #endif
  #ifdef ZERO
    #define RET 0
  #else
    #define RET 1
  #endif

  int main() {
    return RET;
  }
  ```

  __Answer: 0__

4.  You have a project that uses static libraries: `libfred.a`, `libjohn.a`, and `libmike.a`.
Library `libfred.a` has no dependencies, library `libjohn.a` depends on library `libmike.a`.
Which commands will lead to linking errors?

  A. gcc -o main main.o -L. -lfred -ljohn -lmike
  B. gcc -o main main.o -L. -lfred -lmike -ljohn
  C. gcc -o main main.o -L. -ljohn -lmike -lfred
  D. gcc -o main main.o -L. -ljohn -lfred -lmike
  E. gcc -o main main.o -L. -lmike -lfred -ljohn
  F. gcc -o main main.o -L. -lmike -ljohn -lfred

  __Answer: B and F__

5.  What of the following global variables and functions are considered weak symbols by the linker?

  A. `void func();`
  B. `void func() {}`
  C. `static void func() {}`
  D. `int x = 10;`
  E. `static int x = 10;`
  F. `extern int x;`

  __Answer: A and F__ 

  __Note: The question is not well-formulated. The correct answer should be "None". So, the following answers are accepted: None (in any form) + A and/or F.__ 

6.  Write a declaration of variable `p`, which is a pointer to a function that:
   * has 1st parameter which is a constant C string (pointer to `char`);
   * has 2nd parameter which is a non-negative integer;
   * returns a C string (pointer to `char`).

  __Answer: `char* (*p)(const char*, unsigned int)`__

7.  You have a `malloc` library based on an implicit list. The size of header/footer is 4 bytes and 
payload is 4-byte aligned. You call malloc with size: 1, 2, 3, 4, and 5 bytes. How many bytes are wasted on internal fragmentation?

  __Answer: 49__

8.  What system call is used to map a file into memory (type just its name without parameters)?

  __Answer: mmap__

9.  See the program below. Which variable is not guaranteed to have final value 50000?

  ```cpp
  std::atomic<int> a = 0;
  thread_local int b = 0;
  int c = 0;
  std::mutex m;

  void increment() {
    for (int i = 0; i < 10000; ++i) {
      a++;
      {
        std::lock_guard<std::mutex> g(m);
        b++;
        c++;
      }
    }
  }

  int main() {
    std::vector<std::thread> threads;
    for (int i = 0; i < 5; ++i)
      threads.push_back(std::thread(increment));
    for (int i = 0; i < 5; ++i)
      threads[i].join();
    return 0;
  }
   ```

  A. a
  B. b
  C. c

  __Answer: B and C__

10.  What number will be printed by the parent process if the child is successfully created?

  ```c
  int main() {
    pid_t pid;
    pid = fork();
    if (pid < 0) {
      printf("1");
    } else if (pid == 0) {
      printf("2");
    } else {
      printf("3");
    }
    return 0;
  }
  ```

  __Answer: 3__

11.  What will be printed by the following code for a file with contents `abcde`?

  ```c
  int fd1;
  char c1, c2;
  char *fname = argv[1];
  fd1 = open(fname, O_RDONLY, 0);
  read(fd1, &c1, 1);
  if (fork()) {
    wait(NULL);
    read(fd1, &c2, 1);
  } else {
    read(fd1, &c2, 1);
  }
  printf("%c%c", c1, c2);
  ```

  __Answer: `abac`__

12. Write a command that will create a hard link called `mylink` for file called `myfile`.

  __Answer: `ln myfile mylink`__

13.  Write a permission mask to give all permissions (read/write/execute) to user and nothing to anyone else. It looks like `abc`, where a/b/c are integer numbers.

  __Answer: 700__

14.  Which file is the same as file `file1.txt?`

    ```
    35153094 -rw-rw-r-- 2 andrewt andrewt 9 Jun  3 18:08 file1.txt
    35140410 lrwxrwxrwx 1 andrewt andrewt 9 Jun  3 18:07 file2.txt -> file1.txt
    35153094 -rw-rw-r-- 2 andrewt andrewt 9 Jun  3 18:08 file3.txt
    35153285 -rw-rw-r-- 1 andrewt andrewt 9 Jun  3 18:08 file4.txt
    ```

    A. file2.txt
    B. file3.txt
    C. file4.txt

  __Answer: B__

15.  From which directory is user `ejudge` not allowed to delete a file?

    ```
    drwxrwxrwx 2 tatarnikov tatarnikov 4096 Jun 15 22:19 dir1
    drwxrwxr-x 2 tatarnikov ejudge     4096 Jun 15 22:19 dir2
    drwxrwxr-t 2 tatarnikov ejudge     4096 Jun 15 22:14 dir3
    drwxrwxr-x 2 ejudge     ejudge     4096 Jun 15 22:19 dir4
    ```

    A. dir1
    B. dir2
    C. dir3
    D. dir4

  __Answer: C__
