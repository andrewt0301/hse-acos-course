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

2. Modify the __15-57_dorun.py__ program so that it checks whether the program to run exists
   before trying to run it.
    
   Use the [os.path.exists](https://docs.python.org/3/library/os.path.html#os.path.exists)
   method to check whether the program exists.
    
   If the file does not exist print the "No __filename__" message to
   [sys.stderr](https://docs.python.org/3/library/sys.html?sys.stderr).
    
   Save the modified code to the __16-12_dochkrun.py__ file.

3.  

## Homework

1. Finish all unfinished programs.
   Create the '12_HighLevelLanguages' folder at the 'sugon' server.
   Put all programs there.

