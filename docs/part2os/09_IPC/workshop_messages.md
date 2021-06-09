Bonus Tasks: Inter-Process Communication. Message Queue.
---

## Tasks

Make the `09_IPC2` directory and store code there.
Use examples on message queues from the [lecture](lecture.md).

1. Write a program `sendmq.c` that sends a message with priority `1` through the specified queue:
   1. `./sendmq /queue Message` should send a message `"Message"` to queue `"/queue"` with priority 1;
   1. you may also copy+paste and test other lecture examples:
      * queue creation;
      * message receiving;
      * queue unlinking.

1. Write a "messaging server" `mqserver.c` that constantly waits on message queue and prints every message received:
   1. create a queue;
   1. wait for the message and receive it;
   1. if this message is __not__ equal to string `"QUIT"`
      (i.e. 5 bytes: 'Q', 'U', 'I', 'T', and 0), then print it and return to the previous step;
   1. stop receiving and unlink the queue if message __is__ string `"QUIT"`.

1. Modify server to catch `SIGINT`. Name resulting program `mqsignal.c`:
   1. so when pressing `Control+C` the program should stop reading messages, unlink the queue and stop;
   1. check every function called for possible errors.
