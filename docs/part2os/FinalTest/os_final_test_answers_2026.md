Operaing Systems Midterm (2026)
---

1. Data type `Rec` is defined below. What will be returned by `sizeof(Rec)` (64-bit machine)?

   ```c
   typedef struct {
     char a;
     short b;
     char c;
   } *Rec;
   ```

   __Answer: 8__

2. Data type `Union` is defined below. What will be returned by `sizeof(Union)` (64-bit machine)?

   ```c
   typedef union {
     int x;
     float y;
     char z[5];
   } Union;
   ```

   __Answer: 8__

3. A pointer to an array called `parr` is defined below. What will be the result of 
   `sizeof(parr)/sizeof(parr[0])`.

   ```c
   int arr[10];
   int *parr = arr;
   ```

   __Answer: 2__

4. You have the following small program. What value will be retuned by the main function if the program is compiled with default flags?

  ```c
  #ifdef SUCCESS
    #define RET 0
  #else
    #define RET 1
  #endif

  int main() {
    return RET;
  }
  ```

   __Answer: 1__ 

5. What of the following global variables and functions are considered strong symbols by the linker?

  A. `void func();`
  B. `void func() {}`
  C. `static void func() {}`
  D. `int x = 10;`
  E. `static int x = 10;`
  F. `extern int x;`

  __Answer: B and D__ 


6. Write a declaration of variable `p`, which is a pointer to a function that returns `int` and has one parameter of type `int`.

  __Answer: `int(*p)(int)`__

7. Which is the slowest way of memory allocation?

  A. Stack memory
  B. Heap memory
  C. Static memory

  __Answer: B__

8. What utility and system call is used to send a signal?

   __Answer: kill__

9. What of the following signals cannot be handled in a user program?

  A. INT
  B. STOP
  C. CONT

  __Answer: B and C__

10. What number will be printed by a child process if it is successfully created?

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

  __Answer: 2__

11. What will be printed by the following code?

   ```c
   int fd1, fd2, fd3;
   char c1, c2, c3;
   char *fname = argv[1];
   fd1 = open(fname, O_RDONLY, 0);
   fd2 = open(fname, O_RDONLY, 0);
   fd3 = open(fname, O_RDONLY, 0);
   dup2(fd2, fd3);
   read(fd1, &c1, 1);
   read(fd2, &c2, 1);
   read(fd3, &c3, 1);
   printf("%c %c %c\n", c1, c2, c3);
   ```

  __Answer: `a a b`__

12. Write a command that will create a symbolic link called `mylink` for file called `myfile`.

   __Answer: `ln -s myfile mylink`__

13. Write a permission mask to give all rights to everyone (read/write/execute permissions to user/group/other). It looks like `abc`, where a/b/c are integer numbers.

  __Answer: 777__

14. Which file is the same as file `file1.txt?`

    ```
    35153094 -rw-rw-r-- 2 andrewt andrewt 9 Jun  3 18:08 file1.txt
    35153285 -rw-rw-r-- 1 andrewt andrewt 9 Jun  3 18:08 file2.txt
    35140410 lrwxrwxrwx 1 andrewt andrewt 9 Jun  3 18:07 file3.txt -> file1.txt
    35153094 -rw-rw-r-- 2 andrewt andrewt 9 Jun  3 18:08 file4.txt
    ```

    A. file2
    B. file3
    C. file4

  __Answer: C__
