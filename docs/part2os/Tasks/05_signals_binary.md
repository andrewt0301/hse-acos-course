# 5. Signals + Binary

Write two programs:

1. `coder.c`
   * `./coder PID "string"`
   * Sends `string` to the process `PID` bit-by-bit
     using the `SIG_USR1` signal as `0` and `SIG_USR2` as `1`:
      * string is terminated by zero byte (`8×0` bits);
      * use [usleep](https://man7.org/linux/man-pages/man3/usleep.3.html)
        between sending signals with _appropriate_ delay,
        otherwise _repetitive `kill(PID, SIGNAL)` will be interpreted once ore reordered_.

1. `decoder.c.`
   * `./decoder`
   * Prints out it's [getpid](https://man7.org/linux/man-pages/man2/getpid.2.html).
   * Catches two signals — `SIG_USR1` and  `SIG_USR2`, decodes and prints the resulting string.
