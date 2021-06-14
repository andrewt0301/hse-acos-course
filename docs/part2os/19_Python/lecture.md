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
    ```pyhon
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
  * do not use `os.system()`, it's platform-dependent and unsafe

## Workshop

[Workshop](python.md).

__TODO__

## Homework

__TODO__

# References

__TODO__
