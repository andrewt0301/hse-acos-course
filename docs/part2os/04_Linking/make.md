Make Files
---

[GNU Make](https://www.gnu.org/software/make/) is a utility that helps build complex projects.
It determines automatically which pieces of a large program need to be recompiled,
and issues the commands to recompile them.
Full official documentation can be found [here](https://www.gnu.org/software/make/manual/make.html).
First of all let us have a look at the process of building a C program.

It includes the following stages:

* Preprocessor: .c → gcc -E  → .c
* Translator: .c → gcc -S → .s
* Assembler: .s → gcc -c → .o
* Linker: .o → gcc or ld → binary executable

If a project consists of many source files (.c), the final binary executable file is linked from many object (.o) files.
So, building of such a project consists of many steps (building all object files and linking then into an executable),
which has to be repeated each time when the project is rebuilt.
In situations when a project is rebuilt after modifying only a single source file, this it is redundant.

The Make utility solves this problem in the following way.
It recompiles only the modified source file and source files that depend on it.
Then the new object files are linked together with other object files produced earlier into an updated executable.
To decide which files need to be recompiled, GNU Make uses the production graph (dependency) and the age graph (actuality).

The source files to be compiled and dependencies between them are described in Make files.
They specify entries that have the following attributes: target, source, and recipe.
A simple Make file for building a “Hello World” program looks like this:

```make
hello:  hello.c
    gcc hello.c -o hello
clean:
    rm hello
```

In this Make file, source is “hello.c”, target is “hello”, and recipe is `gcc hello.c -o hello`.

There special symbols that can be used to simplify Make files and to avoid using duplicated identifiers
(that can be changed in the future):

* `$@` – target
* `$^` – all sources
* `$<` – source that initiated recipe
* `$?` – all new sources

Also, it is possible to define macro variables.
These variables can be referenced in the following way: `$N` (one-letter name) or `$(NAME)`.

Here is an example of a Make file with special symbols and macro variables:

```make
JUNK=*~ *.bak *.old
GENERATES=*.o prog
all:    prog

prog:   f1.o f2.o
        cc $^ -o $@

f1.o:   f1.c
        cc $< -c

f2.o:   f2.c
        cc $< -c

clean:
        rm -f $(JUNK) $(GENERATES)
```

As it can be seen, all recipes are prefixed with tabulations.
The recipe prefix can be customized using the `.RECIPEPREFIX` special variable. For example:

```make
.RECIPEPREFIX = >
all:
> @echo Hello, world
```

Also, it is possible to specify default recipes for example:

```make
%.o:    %.c 
        cc $< -c
```
