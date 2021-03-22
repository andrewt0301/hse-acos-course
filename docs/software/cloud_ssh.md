Using Linux Ubuntu in Yandex Cloud
---

For this course, a VM with Linux Ubuntu is available at the public server (Yandex Cloud).

To access the server VM, please follow the steps below:

1. Run the `ssh-keygen` command in the console, to generate SSH keys.
   Specify the passphrase for the keys. The keys will be generated in the following folders.
   
      * MacOS: `/Users/andrew/.ssh` (private key - `id_rsa`; public key - `id_rsa.pub`)
      * Windows: `/c/Users/andrew/.ssh` (private key - `id_rsa`; public key - `id_rsa.pub`)

1. Upload the public SSH key (`id_rsa.pub`) to some Gloud drive (Google, Yandex, Mail, etc.)
   and add the link to it into this [table](
   https://docs.google.com/spreadsheets/d/1OEQYWgQ2ge4h66gBOiexFCXA3V3K3Ded_PhfTObm1Gs/edit?usp=sharing).
 
1. The admin will take data from the table and will provide you with a login.

1. Once you get your login, you can connect to the server using the following command:
   ```bash
   ssh login@ipaddress -p22
   ```
   where `login` is your login and `ipaddress` is `84.201.145.249`.

   Input the passphrase for the key to authorize.
