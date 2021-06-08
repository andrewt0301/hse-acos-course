Lecture 10
---

# Users, groups, and permissions.

## Lecture

Slides ([PDF](OS_Lecture_10.pdf), [PPTX](OS_Lecture_10.pptx)).

#### Outline

* Access Control
* Users and Groups
* Permissions
* Links

## Workshop

_Use the local Ubuntu VM (Cloud does not allow creating new account and groups - only admins can do this)._

1. Study documentation on system utilities for managing users and their permissions:
   * [su](https://man7.org/linux/man-pages/man1/su.1.html),
     [sudo](https://man7.org/linux/man-pages/man8/sudo.8.html),
     [passwd](https://man7.org/linux/man-pages/man1/passwd.1.html);
   * [useradd](https://man7.org/linux/man-pages/man8/useradd.8.html),
     [usermod](https://man7.org/linux/man-pages/man8/usermod.8.html),
     [userdel](https://man7.org/linux/man-pages/man8/userdel.8.html);
   * [chmod](https://man7.org/linux/man-pages/man1/chmod.1.html),
     [chown](https://man7.org/linux/man-pages/man1/chown.1.html),
     [chgrp](https://man7.org/linux/man-pages/man1/chgrp.1.html);
   * [groupadd](https://man7.org/linux/man-pages/man8/groupadd.8.html),
     [groupmod](https://man7.org/linux/man-pages/man8/groupmod.8.html),
     [groupdel](https://man7.org/linux/man-pages/man8/groupdel.8.html);
   * [ln](https://man7.org/linux/man-pages/man1/ln.1.html).

1. Create a new user and group:
   * switch to the root mode: `su` (type the password `acos2020`);
   * create a new user: `root@acos-vm:/home/acos# useradd -m myuser`;
   * set a password for this user: `root@acos-vm:/home/acos# passwd myuser`;
   * add a new group: `root@acos-vm:/home/acos# groupadd mygroup`;
   * see the user and the group added in configuration files:
     ```bash
     root@acos-vm:/home/acos# cat /etc/passwd | grep myuser
     myuser:x:1002:1002::/home/myuser:/bin/sh 
     root@acos-vm:/home/acos# cat /etc/group | grep mygroup
     mygroup:x:1003:
     ```
   * switch to the new user: `https://man7.org/linux/man-pages/man1/passwd.1.html`;
   * check the current user ID: `whoami`.

1. Add the user to the group:
   * add `myuser` to `mygroup`:
     ```bash
     root@acos-vm:/home/acos# usermod -a -G mygroup myuser
     ```
   * see that the user is added to the group:
     ```bash
     root@acos-vm:/home/acos# cat /etc/group | grep mygroup
     mygroup:x:1003:myuser
     ```
   * add `myuser` to `acos`:
     ```bash
     root@acos-vm:/home/acos# usermod -a -G acos  myuser
     ```
   * see that the user is added to the group:
     ```bash
     root@acos-vm:/home/acos# cat /etc/group | grep acos
     adm:x:4:syslog,acos
     cdrom:x:24:acos
     sudo:x:27:acos
     dip:x:30:acos
     plugdev:x:46:acos
     lpadmin:x:120:acos
     lxd:x:131:acos
     acos:x:1000:myuser
     sambashare:x:132:acos
     ```

1. Create a folder for experiments:
   * create folder `Lab_10`:
     ```bash
     acos@acos-vm:~$ mkdir Lab_10
     ```

1. Create files for experiments with ownership:
   * create folder `files`:
     ```bash
     acos@acos-vm:~/Lab_10$ mkdir files
     acos@acos-vm:~/Lab_10$ cd files/
     ```
   * create a file under user `acos` and see its ownership and permissions:
     ```bash
     acos@acos-vm:~/Lab_10/files$ echo -e '#!/bin/sh\necho "ACOS"' > acosfile
     acos@acos-vm:~/Lab_10/files$ ls -li
     total 4
     794688 -rw-rw-r-- 1 acos acos 10 июн  3 01:01 acosfile
     acos@acos-vm:~/Lab_10/files$ 
     ```
   * switch to `myuser`, create a file, and see its ownership and permissions:
     ```bash
     acos@acos-vm:~/Lab_10/files$ su myuser
     Password: 
     $ pwd
     /home/acos/Lab_10/files
     $ echo -e '#!/bin/sh\necho "MYFILE"' > myuserfile        
     $ ls -li
     total 8
     794688 -rw-rw-r-- 1 acos   acos   10 июн  3 01:01 acosfile
     794689 -rw-rw-r-- 1 myuser myuser 12 июн  3 01:04 myuserfile
     ```

1. Make experiments with permissions:
   * switch back to `acos`:
     ```bash
     $ exit
     acos@acos-vm:~/Lab_10/files$
     ```
   * try to execute `acosfile`:
     ```bash
     acos@acos-vm:~/Lab_10/files$ ./acosfile
     -bash: ./acosfile: Permission denied
     ```
   * assign the execute permission to `acosfile` for user `acos` and execute it:
     ```bash
     acos@acos-vm:~/Lab_10/files$ chmod u+x acosfile   
     acos@acos-vm:~/Lab_10/files$ ./acosfile 
     ACOS
     ```
   * switch to `myuser` and try to execute `acosfile`:
     ```bash 
     acos@acos-vm:~/Lab_10/files$ su myuser
     Password: 
     $ ./acosfile    
     sh: 1: ./acosfile: Permission denied
     ```
   * switch back to `acos`, add the execute permissionto the group, switch to `myuser`, and execute `acosfile`:
     ```bash
     $ exit
     acos@acos-vm:~/Lab_10/files$ chmod g+x acosfile 
     acos@acos-vm:~/Lab_10/files$ su myuser
     Password: 
     $ ./acosfile    
     ACOS
     ```

1. Make experiments with ownership:
   * give the execute permission for `myuserfile` to `myuser`:
     ```bash
     $ chmod u+x myuserfile 
     ```
   * switch back to `acos`:  
     ```bash
     $ exit
     acos@acos-vm:~/Lab_10/files$
     ```
   * try to execute `myuserfile`:
     ```bash
     acos@acos-vm:~/Lab_10/files$ ./myuserfile
     -bash: ./myuserfile: Permission denied
     ```
   * change ownership of `myuserfile` to `acos` and execute it:
     ```bash
     acos@acos-vm:~/Lab_10/files$ sudo chown acos myuserfile
     [sudo] password for acos: 
     MYFILE
     acos@acos-vm:~/Lab_10/files$ ./myuserfile 
     MYFILE
     ```

1. Make experiments with `setuid`/`setguid` permissions:
   * create folder `setuid`:
     ```bash
     acos@acos-vm:~/Lab_10$ mkdir setuid
     acos@acos-vm:~/Lab_10$ cd setuid/
     ```
   * write program `hello.c` that prints text to file `hello.txt`:
     ```c
     #include <sys/stat.h>
     #include <fcntl.h>
     #include <unistd.h>
   
     int main() {
         char hello[] = "Hello, World!";
         int fd = open("hello.txt", O_CREAT | O_WRONLY, S_IRUSR | S_IWUSR);
         write(fd, hello, sizeof(hello));
         close(fd);
     }
     ```
   * compile and run it under `acos` and see the result:
     ```bash
     acos@acos-vm:~/Lab_10/setuid$ gcc hello.c -o hello
     acos@acos-vm:~/Lab_10/setuid$ ./hello 
     acos@acos-vm:~/Lab_10/setuid$ ls -li
     total 28
     786637 -rwxrwxr-x 1 acos acos 16832 июн  8 10:53 hello
     792456 -rw-rw-r-- 1 acos acos   236 июн  8 10:53 hello.c
     787959 -rw------- 1 acos acos    14 июн  8 10:53 hello.txt   
     ```
     __The owner of the created file is `acos`, the group is `acos`.__
    * remove the file:
      ```bash
      acos@acos-vm:~/Lab_10/setuid$ rm hello.txt
      ```
    * switch to `myuser`, run the program, and see the results.  
      ```bash
      acos@acos-vm:~/Lab_10/setuid$ su myuser
      Password:
      $ ./hello
      $ ls -li
      total 28
      786637 -rwxrwxr-x 1 acos   acos   16832 июн  8 10:53 hello
      792456 -rw-rw-r-- 1 acos   acos     236 июн  8 10:53 hello.c
      786453 -rw------- 1 myuser myuser    14 июн  8 11:02 hello.txt
      ```
      __The owner of the created file is `myuser`, the group is `myuser`.__
    * remove the file
    * switch to `acos`, give the `setgid` permission to `hello`, run it under `myuser`,
      and see the results:
      ```bash
      $ exit
      acos@acos-vm:~/Lab_10/setuid$ chmod g+s hello
      acos@acos-vm:~/Lab_10/setuid$ su myuser
      Password:
      $ ./hello
      $ ls -li
      total 28
      786637 -rwxrwsr-x 1 acos   acos 16832 июн  8 10:53 hello
      792456 -rw-rw-r-- 1 acos   acos   236 июн  8 10:53 hello.c
      786453 -rw------- 1 myuser acos    14 июн  8 11:08 hello.txt
      ```
      __The owner of the created file is `myuser`, the group is `acos`.__
    * remove the file  
    * switch to `acos`, give the `setuid` permission to `hello`, run it under `myuser`,
      and see the results:
      ```bash
      $ exit
      acos@acos-vm:~/Lab_10/setuid$ chmod u+s hello
      acos@acos-vm:~/Lab_10/setuid$ su myuser
      Password: 
      $ ./hello
      $ ls -li
      total 28
      786637 -rwsrwsr-x 1 acos acos 16832 июн  8 10:53 hello
      792456 -rw-rw-r-- 1 acos acos   236 июн  8 10:53 hello.c
      786453 -rw------- 1 acos acos    14 июн  8 11:15 hello.txt
      ```
      __The owner of the created file is `acos`, the group is `acos`.__

1. Make experiments with hard and soft links:
   * create folder `Lab_10/links`;
   * create files;
   * create hard and soft links;
   * see their properties;
   * modify the files;
   * delete links.
   ```bash
   acos@acos-vm:~/Lab_10$ mkdir links
   acos@acos-vm:~/Lab_10$ cd links/
   acos@acos-vm:~/Lab_10/links$ nano myfile.txt
   acos@acos-vm:~/Lab_10/links$ ln myfile.txt hardlink
   acos@acos-vm:~/Lab_10/links$ ln myfile.txt -s softlink
   acos@acos-vm:~/Lab_10/links$ ls -li
   total 8
   794685 -rw-rw-r-- 2 acos acos  5 июн  3 00:51 hardlink
   794685 -rw-rw-r-- 2 acos acos  5 июн  3 00:51 myfile.txt
   793985 lrwxrwxrwx 1 acos acos 10 июн  3 00:52 softlink -> myfile.txt
   ```

## Homework

* Read documentation.
* Do all the tasks from the workshop.
* Make sure you understand everything.

# References

* Users and groups. Chapter 8 in [[TLPI]](../../books.md).
* Process credentials. Chapter 9 in [[TLPI]](../../books.md).
* Directories and links. Chapter 18 in [[TLPI]](../../books.md).
* The file system (Access permissions and links). Chapter 4 in [[PGLC]](../../books.md).
* [Understanding Linux File Permissions](
  https://www.linux.com/training-tutorials/understanding-linux-file-permissions/)
