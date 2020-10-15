# 3. Regex + Messages

Write two programs:

1. `searcher.c`:
   * `./searcher /queue_name file_name`
   * Opens arbitrary `file_name` given
   * receives [POSIX messages](https://man7.org/linux/man-pages/man7/mq_overview.7.html)
     on `queue_name` given
   * treats message contents as [regex](https://man7.org/linux/man-pages/man7/regex.7.html)
     and prints out all strings from file that match regex received
1. `sender.c`
   * `./sender /queue_name "string"`
   * sends message containing "string" to the `/queue_name` queue
