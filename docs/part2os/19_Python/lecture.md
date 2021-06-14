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

### Python and OS programming ==

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
    
## Workshop

[Workshop](python.md).

__TODO__

## Homework

__TODO__

# References

__TODO__
