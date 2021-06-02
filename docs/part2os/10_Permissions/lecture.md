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
   * create a file under user `acos` and see its ownership:
     ``` 
     acos@acos-vm:~/Lab_10/files$ echo "ACOS text" > acosfile
     acos@acos-vm:~/Lab_10/files$ ls -li
     total 4
     794688 -rw-rw-r-- 1 acos acos 10 июн  3 01:01 acosfile
     acos@acos-vm:~/Lab_10/files$ 
     ```
   * switch to `myuser`, create a file, and see its ownership:
     ```
     acos@acos-vm:~/Lab_10/files$ su myuser
     Password: 
     $ pwd
     /home/acos/Lab_10/files
     $ echo "Myuser Text" > myuserfile        
     $ ls -li
     total 8
     794688 -rw-rw-r-- 1 acos   acos   10 июн  3 01:01 acosfile
     794689 -rw-rw-r-- 1 myuser myuser 12 июн  3 01:04 myuserfile
     ```

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

__TODO__

# References

* Users and groups. Chapter 8 in [[TLPI]](../../books.md).
* Process credentials. Chapter 9 in [[TLPI]](../../books.md).
* Directories and links. Chapter 18 in [[TLPI]](../../books.md).
* The file system (Access permissions and links). Chapter 4 in [[PGLC]](../../books.md).
* [Understanding Linux File Permissions](
  https://www.linux.com/training-tutorials/understanding-linux-file-permissions/)
