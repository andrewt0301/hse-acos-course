Using Linux Ubuntu in Yandex Cloud
---

## Remote Access with SSH

For this course, a VM with Linux Ubuntu is available at the public server (Yandex Cloud).

To access the server VM, please follow the steps below:

1. For Windows users: [download](https://git-scm.com/downloads) and install Git. Run Git Bash.

1. Run the `ssh-keygen` command in the console, to generate SSH keys.
   Specify the passphrase for the keys. The keys will be generated in the following folders.
   
      * MacOS: `/Users/andrew/.ssh` (private key - `id_rsa`; public key - `id_rsa.pub`)
      * Windows: `/c/Users/andrew/.ssh` (private key - `id_rsa`; public key - `id_rsa.pub`)

1. Upload the public SSH key (`id_rsa.pub`) to some Cloud drive (Google, Yandex, Mail, etc.)
   and add the link to it into this [table](
   https://docs.google.com/spreadsheets/d/1KVsUGHUl74Pfrx0GYiF2V-Cw0mFbVQ3428475FQKsDE/edit?usp=sharing).
 
1. The admin will take data from the table and will provide you with a login.

1. Once you get your login, you can connect to the server using the following command:
   ```bash
   ssh login@ipaddress -p22
   ```
   where `login` is your login and `ipaddress` is `84.201.145.249`.

   Input the passphrase for the key to authorize.

More information on the SSH tool is available [here](https://man7.org/linux/man-pages/man1/ssh.1.html).
Also, see [Wikipedia](https://en.wikipedia.org/wiki/Secure_Shell_Protocol) for details on the SSH protocol.

## Copying Files with SCP

Files and entire folders can be copied to and from the server using
the [scp](https://man7.org/linux/man-pages/man1/scp.1.html) tool.

* Copying a file __to__ the server:
   ```bash
   scp -p22 /Users/andrew/myprog.c login@ipaddress:/home/tatarnikov/
   ```

* Copying a folder __to__ the server:
   ```bash
   scp -p22 -r /Users/andrew/myfolder/ login@ipaddress:/home/tatarnikov/
   ```

* Copying a file __from__ the server:
   ```bash
   scp -p22 login@ipaddress:/home/tatarnikov/myprog.c /Users/andrew/
   ```

* Copying a folder __from__ the server:
   ```bash
   scp -p22 -r login@ipaddress:/home/tatarnikov/myfolder/ /Users/andrew/ 
   ````

_Note_: specify `login` as your login, `ipaddress` as `84.201.145.249`,
        and use paths valid for your local and remove user account.
