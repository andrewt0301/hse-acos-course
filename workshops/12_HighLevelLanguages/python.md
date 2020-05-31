System Programming in Python
---

The goal of this seminar is to practice in using Python modules that manage
facilities provided by the operation system. 

1. Using the [os](https://docs.python.org/3/library/os.html) and
   [sys](https://docs.python.org/3/library/sys.html) modules to run programs from Python scripts.

   Read documentation on the `os.path.realpath(path)`, `os.system(command)`,
   `sys.executable`, and `sys.argv` methods.

   Study the Python program below.

   __15-57_dorun.py__:

   ```python
   #!/usr/bin/env python3
   '''
   ''' 
   import sys
   import os

   Python = sys.executable
   f = os.path.realpath(sys.argv[1])
    
   os.system(f'{Python} {f} {" ".join(sys.argv[2:])}')
   ```

   This program launches a program specified as command-line argument and passes it the
   rest of the arguments. The program to be run can look as follows.

   __15-58_torun.py__:

   ```python
   #!/usr/bin/env python3
   '''
   '''
   import sys
   print(":", "-".join(sys.argv[1:]))
   ```

   Run the program with python3 and see the result:

       python3 15-57_dorun.py 15-58_torun.py qwe ert ert

   Run the program and pass it an invalid program to run. See the output:

       python3 15-57_dorun.py nothing_torun.py qwe ert ert

2. __Task 01:__

   Modify the __15-57_dorun.py__ program so that it checks whether the program to run exists
   before trying to run it.

   Use the [os.path.exists](https://docs.python.org/3/library/os.path.html#os.path.exists)
   method to check whether the program exists.

   If the file does not exist, print the "No _filename_" message to
   [sys.stderr](https://docs.python.org/3/library/sys.html?sys.stderr).

   Save the modified code to the __16-12_dochkrun.py__ file.

3. __Task 02:__

   Study documentation on the [subprocess](https://docs.python.org/3/library/subprocess.html) module.

   Rewrite the __16-12_dochkrun.py__ file to run the program using the
   [subprocess.run](https://docs.python.org/3/library/subprocess.html#subprocess.run) function.

   Save the resulting program to the __16-21_dosubrun.py__ file.

4. Using pipes to [replace shell pipelines](
   https://docs.python.org/3.8/library/subprocess.html?highlight=subprocess#replacing-shell-pipeline).

   The following shell command:
   
       output=$(dmesg | grep sda)

   can be implemented in Python as follows:

   ```python
   import subprocess as proc
   p1 = proc.Popen(["dmesg"], stdout=proc.PIPE)
   p2 = proc.Popen(["grep", "sda"], stdin=p1.stdout, stdout=proc.PIPE)
   p1.stdout.close()  # Allow p1 to receive a SIGPIPE if p2 exits.
   output = p2.communicate()[0]
   ```

   Execute shell and Python and see the results.

5. __Task 03:__

   On the basis of the previous example, write a Python program that pipelines two commands
   specified in the command line.

   Both commands can have any number of arguments.

   Save the program to the __16-43_pipecmd.py__ file.

   _Hint_: You need to separate one program with arguments from another program with a
   special separator character. For example, it can be `@`.

   The command line can look like this:  

       andrewt@comp-core-i7-3615qm-0dbf32 ~ $ python3 16-43_pipecmd.py date -u @ hexdump -C
       00000000  d0 92 d1 81 20 d0 bc d0  b0 d1 8f 20 33 31 20 32  |.... ...... 31 2|
       00000010  31 3a 31 33 3a 30 38 20  55 54 43 20 32 30 32 30  |1:13:08 UTC 2020|
       00000020  0a                                                |.|
       00000021

6. Using the [multiprocessing](https://docs.python.org/3/library/multiprocessing.html) module
   to run processes in Python.
   
   The example below runs a process using the [Process](
   https://docs.python.org/3/library/multiprocessing.html#multiprocessing.Process) class.
   
   __16-50_multiex.py__:

   ```python
   from multiprocessing import Process
   import os

   def info(title):
       print(title)
       print('module name:', __name__)
       print('parent process:', os.getppid())
       print('process id:', os.getpid())

   def f(name):
       info('function f')
       print('hello', name)

   if __name__ == '__main__':
       info('main line')
       p = Process(target=f, args=('bob',))
       p.start()
       p.join()
    ```

## Homework

1. Finish all unfinished programs.
   Create the '12_HighLevelLanguages' folder at the 'sugon' server.
   Put all programs there.

