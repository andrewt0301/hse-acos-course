Lecture 19
---

# High-level Languages and Operating System.

## Lecture

### OS and Programming Languages

#### Linux:

* Kernel — C
* Core system libraries — C
* Core system utilities — mostly C and shell
  * Can be C++, Python and Perl
* Scripting and integrating
  * Mostly shell, but Perl _was_ popular and Python _is_ now
  * Sometimes C++
* Almost any OS distribution — ''all'' kinds of programming languages

⇒ Is C the only system programming language?

#### Windows:

* Core, kernel and libraries: C++ (seldom C)
* Scripting and integrating:
  * Any .Net-based platform (mostly C#)
  * C++
  * Powershell (was: cmd)
  * JScript, VBScript (Windows Script Host)
* Applications: C++, .Net, almost any 3d-party languages

#### MacOS:

* Kernel — C
* Core system and libraries — [Objective C](
  https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html)
  and C, seldom C++
  * Now: [Swift](https://developer.apple.com/swift)
* Scripting and integration: [AppleScript](
  https://developer.apple.com/mac/library/documentation/AppleScript/Conceptual/AppleScriptX/AppleScriptX.html)
  and Shell
* Applications: Swift, Objective C, maybe C++, almost any 3d-party languages

### Python and OS Programming

* Cross-platformness
  * `+/-`
  * ⇒ own implementation of OS features
* POSIX-oriented (=> Linux)
  * `+/-`
  * ⇒ own implementation of `non-POSIX` OS features
* High-level, but not OS-oriented (unlike shell)
  * `+/-`
  * ⇒ own implementation of OS features
* Has a lot of non-privileged syscalls wrappers
* Incredible amount of modules at _PyPi_
  * Including system-oriented
  * Including service-oriented
* Non «resource scrimp» style
  * If resources do not multiply, use it as a whole, not piece by peice
    * E. g. `.read()` instead of `.readline()`
  * no needs to count CPU circles :)
  * …

#### Modules os ans sys

* Cross-platform path: [os.path](https://docs.python.org/3/library/os.path.html) and
  [pathlib](https://docs.python.org/3/library/pathlib.html)
  * `.is*()`, `.exists()` etc.
* [os](https://docs.python.org/3/library/os.html):
  * `.environ`
  * syscalls wrappers (`.fork`, `.getpid`, `.fstat`, `.popen`, `.wait`, almost any! ...)
* [sys](https://docs.python.org/3/library/sys.html):
  `.executable`, `.argv`, `.stdin`, `.stdout`, `.stderr`, ...
* Raising a level example:
  [time](https://docs.python.org/3/library/time.html) →
  [datetime](https://docs.python.org/3/library/datetime.html) →
  [calendar](https://docs.python.org/3/library/calendar.html)

Also:
 * [platform](https://docs.python.org/3/library/platform.html)
 * …

#### Subprocess

Concept: cross-platform process execution with communication and exit status control.

* Just run and get a result: [run()](https://docs.python.org/3/library/subprocess.html#subprocess.run)
  * `capture_output`/`input=`; `stdin=`/`stdout=`/`stderr=`
  * ...
* High-level [popen](https://man7.org/linux/man-pages/man3/popen.3.html) analog:
  [Popen()](https://docs.python.org/3/library/subprocess.html#subprocess.Popen)
  * [example](https://docs.python.org/3/library/subprocess.html#replacing-shell-pipeline)
    ```python
    from subprocess import *
    # Run first process that outputs to the unnamed pipe
    p1 = Popen(["cal -s"], stdout=PIPE)
    # Run second process that inputs from the other end of the pipe opened
    # and outputs to the second pipe
    p2 = Popen(["hexdump", "-C"], stdin=p1.stdout, stdout=PIPE)
    # Allow p1 to receive a SIGPIPE if p2 exits
    p1.stdout.close()
    # Read from the second pipe (stdout, stderr),
    # but stderr will be empty because no redirection is used
    res = p2.communicate()
    # Note data is bytes, not str
    print(res[0].decode())
    ```
  * do not use `os.system()`, it is platform-dependent and unsafe

#### Multiprocessing

About [[py3doc:threading|multithread]] programming in Python:

* It exists
* It almost _non-parallel_ because of [Global_interpreter_lock](https://en.wikipedia.org/wiki/Global_interpreter_lock)
  * There is no apparent way to eliminate GIL without significant _slowing single-threaded_ code
* You can use [multithread](https://docs.python.org/3/library/threading.html) if:
  1. Only one thread eats CPU, but other ones perform I/O
  1. You have complex code design based on threads and significant amount of permanent
     usage of joint resources
* Unlike C programs, Python ones have no actual difference between
  threaded and _multiprocess_ design
* [Paper about Python GIL](https://realpython.com/python-gil/)

The [multiprocessing](https://docs.python.org/3/library/multiprocessing.html) module:

* Crossplatformness
  * Linux: `fork()` is used
* Child process is running ''a function'' (unlike classic `fork()`, which defines two equal processes)
  * That simplifies data transfer down to the arguments/return in simple cases
* Processes can communicate through special
  [socket-like high-level objects](https://docs.python.org/3/library/multiprocessing.html#exchanging-objects-between-processes)
  or object queue
* Processes can use
  [high-level shared memory-alike](https://docs.python.org/3/library/multiprocessing.html#sharing-state-between-processes)
  objects or object manager (the last is slower, but can work over network!)
* Processes can be orchestered into
  a [pool](https://docs.python.org/3/library/multiprocessing.html#using-a-pool-of-workers)
  running exactly N processs in parallel.
  1. Exact N child processes (called _workers_) are started
  1. Each worker can execute a function given multiple times as pool flows
    * No other start/stop actions is performed
  1. Workers are stopped when pool is empty

## Workshop

[Workshop](python.md).

__TODO__

## Homework

__TODO__

# References

__TODO__
