# 6. Signals + Fork

Write a program `repeater.c`:

* `./repeater Number Seconds command arg1 arg2 …`
* It ignores `SIG_INT` (Ctrl+C) itself.
* It [fork](https://man7.org/linux/man-pages/man2/fork.2.html)s a child that constantly:
   * [sleep](https://man7.org/linux/man-pages/man3/sleep.3.html)s `Seconds` seconds;
   * forks/[execvp](https://man7.org/linux/man-pages/man3/execvp.3.html)s `command arg1 arg2 …`;
   * _can_ be terminated by `SIG_INT`.
* It waits for the child to terminate, and forks another.
* After a `Number` of children are terminated one by one, it stops.

_Hint_: see `SIG_IGN` and `SIG_DFL` constants in [signal](https://man7.org/linux/man-pages/man2/signal.2.html).

E. g.:
```bash
$ ./repeater 5 1 echo qq
qq
qq
^Cqq
qq
^Cqq
^C^Cqq
^C
$ 
```
