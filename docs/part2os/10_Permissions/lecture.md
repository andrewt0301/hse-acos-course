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
     ```
     root@acos-vm:/home/acos# cat /etc/passwd | grep myuser
     myuser:x:1002:1002::/home/myuser:/bin/sh 
     root@acos-vm:/home/acos# cat /etc/group | grep mygroup
     mygroup:x:1003:
     ```
   * switch to the new user: `https://man7.org/linux/man-pages/man1/passwd.1.html`;
   * check the current user ID: `whoami`.

1. Create a folder for experiments:
   * create a folder: `Lab_10`;
   * 
   
   root@acos-vm:/home/acos# cat /etc/group | grep mygroup
   mygroup:x:1003:

__TODO__

## Homework

__TODO__

# References

* Users and groups. Chapter 8 in [[TLPI]](../../books.md).
* Process credentials. Chapter 9 in [[TLPI]](../../books.md).
* Directories and links. Chapter 18 in [[TLPI]](../../books.md).
* The file system (Access permissions and links). Chapter 4 in [[PGLC]](../../books.md).
* [Understanding Linux File Permissions](
  https://www.linux.com/training-tutorials/understanding-linux-file-permissions/)
