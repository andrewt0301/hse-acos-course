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

1. Add the user to the group:
   * add `myuser` to `mygroup`:
     ```
     root@acos-vm:/home/acos# usermod -a -G mygroup myuser
     ```
   * see that the user is added to the group:
     ```
     root@acos-vm:/home/acos# cat /etc/group | grep mygroup
     mygroup:x:1003:myuser
     ```
   * add `myuser` to `acos`:
     ```
     root@acos-vm:/home/acos# usermod -a -G acos  myuser
     ```
   * see that the user is added to the group:
     ```
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
   * create a folder: `Lab_10`;

1. Make experiments with hard and soft links:
      * create files;
      * create hard and soft links;
      * see their properties;
      * modify the files;
      * delete links.
   ```bash
   tatarnikov@akos:~$ mkdir links
   tatarnikov@akos:~$ cd links/
   tatarnikov@akos:~/links$ nanomyfile.txt
   tatarnikov@akos:~/links$ ln myfile.txt hardlink
   tatarnikov@akos:~/links$ ln myfile.txt -s softlink
   tatarnikov@akos:~/links$ ls -li
   total 8
   1030979 -rw-rw-r--2 tatarnikovtatarnikov19 May 24 05:33 hardlink
   1030979 -rw-rw-r--2 tatarnikovtatarnikov19 May 24 05:33 myfile.txt
   1030978 lrwxrwxrwx1 tatarnikovtatarnikov10 May 24 05:33 softlink-> myfile.txt
   ```

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
