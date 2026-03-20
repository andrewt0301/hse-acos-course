Using Git and GitHub
---

__We will use GitHub and Git to submit some homeworks.__

_Full reference on Git is available [here](https://git-scm.com/book/en/v2)._

## Installing Git

1. For Windows users: [download](https://git-scm.com/downloads) and install Git. Run Git Bash.
2. For Linux users: run command `sudo apt install git` in Terminal (typically it is already installed).

# Generating SSH Keys

Run the `ssh-keygen` command in the console, to generate SSH keys.
Specify the passphrase for the keys. The keys will be generated in the following folders.

* MacOS: `/Users/andrew/.ssh`
* Windows: `/c/Users/andrew/.ssh`
* Linux: `/home/andrewt/.ssh`

`id_rsa` is a private key, `id_rsa.pub` is a public key.

## Creating Repository

1. Login into [GitHub](https://github.com) or create an account. 

2. [Add](https://github.com/settings/keys) your public SSH key to your account. 

3. Create a new __private__ repository. Name it `<group>_<surname>`, e.g. `231_tatarnikov`.
   If there is another student with the same surname, add suffix `_<n>` (`n` is the first letter of the name). 

4. Add the workshop instructor and the teaching assistant as collaborators to the project.
   Here is an example of a link to do this (Project > Setting > Manage Access):   
   `https://github.com/<your account>/<your project>/settings/access`.

# Working with Repository

1. Clone the created repository to your machine:
   ```bash
   git clone https://github.com/andrewt0301/test.git
   ```

2. The repository will be cloned in the `test` folder. Change the current directory to it:
   ```bash
   cd test
   ```

3. See help of using Git:
   ```bash
   git help
   ```

4. Set your user name and email for this repository:
   ```bash
   git config user.name Andrei Tatarnikov
   git config user.email andrewt0301@gmail.com
   ```

5. Create or copy the `hello.c` program to this folder.

6. Check the status of files in the Git repository:
   ```bash
   git status
   ```

7. Add the `hello.c` file to the commit:
   ```bash
   git add hello.c
   ```

8. Send the commit to the repository:
   ```bash
   git commit -s -m "hello.c is added"
   ```

9. Update the remote repository (GitHub): 
   ```bash
   git push origin main
   ```

10. Get changes from the remote repository (GitHub): 
   ```bash
   git pull
   ```
