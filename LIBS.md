Static and Shared Libraries 
---

### Simple application

The 'hello.c' listing:

```c
﻿#include <stdio.h>
#include <stdlib.h>

int main()
{
  printf("Hello World\n");
  exit(0);
}
```

To compile, execute this:

    gcc hello.c -o hello
    
To run, execute this:

    ./hello

### Static and shared libraries

* Static - `.a` extension
* Shared - `.so` extension

Names of libraries start with the 'lib' prefix.

To see the full list of libs in the system, execute the command:

    ls /usr/lib | less
    

To list of libraries loaded by application, use the `ldd` command. For example:

    ﻿ldd "$(which ls)"
 
#### Static libraries

Use `mcedit` to create the `﻿fred.c` and `﻿bill.c` files.

__fred.c:__

    ﻿mcedit fred.c

```c
#include <stdio.h>

void fred(int arg)
{
   printf("fred: you passed %d\n", arg);
}

```

__bill.c:__

    ﻿mcedit ﻿bill.c

```c
#include <stdio.h>

void bill(char *arg)
{
   printf("bill: you passed %s\n", arg);
}

```

Compile the sources into object files:

    ﻿gcc -c fred.c bill.c

See the object files:

    ls *.o
    bill.o
    fred.o

Make a static library (archive):

    ar crv libfoo.a bill.o fred.o
    r - bill.o
    r - fred.o

Write the header file for the library:

__lib.h:__

    mcedit lib.h 

```c
void bill(char *);
void fred(int);
```

Write a program that uses the library:

__program.c__:

    mcedit program.c
    
```c 
#include <stdlib.h>
#include "lib.h"

int main()
{
  bill("Hello World!");
  exit(0);
}
```

Build the program object file:

    gcc -c program.c

Build a program from object files:

    gcc -o program program.o bill.o  

Build a program that used the static library:

    gcc -o program program.o -L. -lfoo

#### Stared libraries

Compile sources into position-independent code (PIC):


    gcc -c -Wall -fPIC fred.c bill.c


Build shared library from object files:


    gcc -shared -o libfoo.so fred.o bill.o


Build the program that uses the shared library: 


    ﻿gcc -Wall -o program program.c -lfoo -L.

Run the program:

    ﻿export LD_LIBRARY_PATH=.
    ./program
    
See loaded libraries:

    ldd ./program