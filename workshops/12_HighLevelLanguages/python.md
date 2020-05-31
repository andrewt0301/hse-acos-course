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
    
   print(f)
    
   os.system(f'{Python} {f} {" ".join(sys.argv[2:])}')
   ```

   This program launches a program specified as command-line argument and passes it the
   rest of the arguments. The program to be run can looks as follows.
   
   ___15-58_torun.py__:
   
    ```python
    #!/usr/bin/env python3
    '''
    '''
    import sys
    print(":", "-".join(sys.argv[1:]))
    ```

   [this](15-57_dorun.py) example script that runs
   [another](15-58_torun.py) program and launch with python3:

       python3 15-57_dorun.py 15-58_torun.py qwe ert ert

2.



See the programs in Python [here](.).

## Homework

1. Create the '12_HighLevelLanguages' folder at the 'sugon' server.

2. Run every program. Understand what it does. If necessary fix it.
   Save the program output to the 'sugon' server.

