# Using Git and GitHub

Reference on Git is available [here](https://git-scm.com/book/en/v2).

## Creating a Repository

1. Log in to [GitHub](https://github.com) or create an account.

2. [Add](https://github.com/settings/keys) your public SSH key to your account. To generate an SSH key (if you don't have one), use the following command:  
   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```  
   Copy the contents of your public key (`~/.ssh/id_rsa.pub`) and add it to your GitHub account.

3. Create a new private repository.

4. Add the lecturer, the workshop instructor, and the teaching assistant as collaborators to the project.  
   Example link for managing access:  
   `https://github.com/<your_account>/<your_project>/settings/access`

## Working with the Repository

1. Clone the created repository to your machine:  
   ```bash
   git clone https://github.com/<your_account>/<your_project>.git
   ```

2. The repository will be cloned into a folder named after the repository. Change your current directory to the repository folder:  
   ```bash
   cd <your_project>
   ```

3. View Git's built-in help:  
   ```bash
   git help
   ```

4. Set your user name and email for this repository:  
   ```bash
   git config user.name "Your Name"
   git config user.email "your_email@example.com"
   ```

5. Create or copy your `hello.c` program into this folder.

6. Check the status of files in the Git repository:  
   ```bash
   git status
   ```

7. Add the `hello.c` file to the staging area:  
   ```bash
   git add hello.c
   ```

8. Commit the file with a message:  
   ```bash
   git commit -s -m "Add hello.c"
   ```

9. Push the commit to the remote repository on GitHub:  
   ```bash
   git push origin main
   ```

10. Pull changes from the remote repository (GitHub):  
   ```bash
   git pull
   ```
