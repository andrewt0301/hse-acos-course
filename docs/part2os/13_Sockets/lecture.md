Lecture 13
---

# Sockets

## Lecture

Slides ([PDF](OS_Lecture_13.pdf), [PPTX](OS_Lecture_13.pptx)).

### Sockets

#### Socket

An abstraction for asynchronous data transfer:
* Has two ends
* Can be bidirectional
* Can be organized over a variety of underlying layers
* network; e. g. TCP, UDP etc. for IPv4 (_internet_ socket)
* special filesystem object; e.g. so-called _unix domain_ socket
* ...
* see [socket](https://man7.org/linux/man-pages/man2/socket.2.html)
  
### Socket Disciplines

#### Stream

An ordered series of packets of reliable data:
* No transfer without connection is established
* Data transferred is reliably equal to data received (including network packets corruption/loss/duplication correction)
* Out-of-band state are eliminated (sender can not send more than reciever can receive)

#### Datagram

A single message:
* No need to establish a connection
* When sending over a network, no need to order and count packets (because there is only one)

### Socket Programming

Probably it will be better to read the following text _in parallel_
with trying the examples below.

#### To initialize a socket

1. Create a
   [socket(domain, type, 0)](https://man7.org/linux/man-pages/man2/socket.2.html)
   * `domain` is underlying layer type (various networks, filesystem etc), aka _address family_
   * `type` is discipline (stream, datagram or others)

#### To run a server

1. Associate the socket with the specific address/location via
   [bind(socket, address, length)](https://man7.org/linux/man-pages/man2/bind.2.html)
   * `socket` is the _descriptor_ of the socket
   * `address` is domain-specific `struct` filled with actual address of the server
   * `length` is the address structure size
   * Because of various address families has different address size, we need to provide it
   * For the same reason, we need to cast actual structure type to `const struct sockaddr *`,
     which is merely a placeholder
1. Start to [listen(socket, queue_length)](https://man7.org/linux/man-pages/man2/listen.2.html)
   * if the number of unreceived streams/datagrams is equal to `queue_length`
   * all other stream connections are refused (sender got an error message)
   * all other datagrams are dropped (sender got nothing)
1. If the socket supports _connections_ (e.g. stream type socket),
   * socket given by `listen()` is _control socket_, used to accept _connections_
   * got a new connection _data socket_ descriptor returned by
     [accept(socket, address, &length)](https://man7.org/linux/man-pages/man2/accept.2.html)
       * `address` and `length` are filled with peer address and its address length
         (if we do not need them, we can use both NULL here)
   * Use _data socket_ to receive data
1. Receive a portion of data from data `socket` to `buffer` via
   [recv(data_socket, buffer, length, 0)](https://man7.org/linux/man-pages/man2/recv.2.html)
   * Datagram transmission has no control sockets, so the information about the sender address
     can be gathered by using [recvfrom(socket, buffer, length, 0, address, &length)](
     https://man7.org/linux/man-pages/man3/recvfrom.3p.html)
   * Stream transmission complies "file as stream" abstraction, so we can just use
     [read(socket, buffer, length)](https://man7.org/linux/man-pages/man2/read.2.html) instead
1. Do not forget to
   [close()](https://man7.org/linux/man-pages/man2/close.2.html) data the sockets after transmission is done
   * Also, close _control socket_ before finishing a service.
     Not closing TCP stream control makes its port unavailable for further use for next couple of minutes.

#### To run a client

1. Associate the socket with the specific _remote server_ address/location via
   [connect(socket, address, length)](
   https://man7.org/linux/man-pages/man2/connect.2.html) (see above for arguments explanation)
1. Send data to this server via [send(socket, buffer, length, 0)](
   https://man7.org/linux/man-pages/man2/send.2.html)
1. Do not forget to [close()](https://man7.org/linux/man-pages/man2/close.2.html) sockets after transmission is done

#### Datagram socket

When using a datagram socket,
we can use [sendto(socket, buffer, length, 0, address, &length)](
https://man7.org/linux/man-pages/man3/sendto.3p.html)
to send a single datagram instead of `connect()` and then `send()`.
No connection is established anyway, and `connect()` here serves only informational purpose.

When using stream socket, we can use [read(socket, buffer, length)](
https://man7.org/linux/man-pages/man2/read.2.html) as well.

## Examples

### Unix domain + datagram

#### Unix domain datagram server

Unix domain datagram server, that receives only one datagram, dumps it in hexadecimal, and exits.
First argument is Unix domain socket name.

__unix_d_send.c__:
```c
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

#define USIZE sizeof(struct sockaddr_un)

int main(int argc, char *argv[]) {
    struct sockaddr_un srv;
    int fd;

    fd = socket(AF_UNIX, SOCK_DGRAM, 0);
    srv.sun_family = AF_UNIX;
    strncpy(srv.sun_path, argv[1], sizeof(srv.sun_path)-1);

    bind(fd, (const struct sockaddr *) &srv, USIZE);
    sendto(fd, argv[2], strlen(argv[2]), 0, (const struct sockaddr *) &srv, USIZE);

    return 0;
}
```

#### Unix domain datagram client

Unix domain datagram sender, first argument is socket, second argument is string to send.

__unix_d_server.c__:
```c
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
 
#define USIZE sizeof(struct sockaddr_un)
#define BLOG 3
#define DSIZE 16

int main(int argc, char *argv[]) {
    struct sockaddr_un srv;
    char dgram[DSIZE];
    int fd, rsz, i;

    fd = socket(AF_UNIX, SOCK_DGRAM, 0);
    srv.sun_family = AF_UNIX;
    strncpy(srv.sun_path, argv[1], sizeof(srv.sun_path)-1);

    remove(argv[1]);
    bind(fd, (const struct sockaddr *) &srv, USIZE);
    listen(fd, BLOG);

    rsz = recv(fd, dgram, DSIZE, 0);
    for(i=0; i<rsz; i++)
        printf("%02x ", dgram[i]);
    putchar('\n');

    remove(argv[1]);
    return 0;
}
```

#### How this works together

```bash
acos@acos-vm:~/unixsocket$ gcc unix_d_send.c -o unix_d_send
acos@acos-vm:~/unixsocket$ gcc unix_d_server.c -o unix_d_server
acos@acos-vm:~/unixsocket$ ./unix_d_server u_socket &
[1] 71717
acos@acos-vm:~/unixsocket$ ls -l
total 48
srwxrwxr-x 1 acos acos     0 июн 11 01:08 u_socket
-rwxrwxr-x 1 acos acos 16928 июн 11 01:08 unix_d_send
-rw-rw-r-- 1 acos acos   492 июн 11 01:07 unix_d_send.c
-rwxrwxr-x 1 acos acos 17064 июн 11 01:08 unix_d_server
-rw-rw-r-- 1 acos acos   652 июн 11 01:07 unix_d_server.c
acos@acos-vm:~/unixsocket$ ./unix_d_send u_socket Message
4d 65 73 73 61 67 65 
[1]+  Done                    ./unix_d_server u_socket
```

### Internet (IPv4) + stream (TCP)

#### Simple TCP server

Internet IPv4 domain stream socket (TCP) server that accepts connections and sends back a number of connection.
First argument is IPv4 address, second one is port to listen to.

__tcp_qq_srver.c__:
```c
#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define ISIZE (sizeof(struct sockaddr_in))
#define MAXCONN 3
#define BUFSIZE 32

int main(int argc, char *argv[]) {
    int fd, connfd, conncount=0;
    struct sockaddr_in srv;
    char buf[32];

    memset(&srv, 0, ISIZE);
    srv.sin_family = AF_INET;
    inet_pton(AF_INET, argv[1], &(srv.sin_addr));
    srv.sin_port = htons(atoi(argv[2]));

    fd = socket(AF_INET, SOCK_STREAM, 0);
    bind(fd, (struct sockaddr*) &srv, ISIZE);
    listen(fd, MAXCONN);

    while(1) {
        connfd = accept(fd, NULL, NULL);
        snprintf(buf, BUFSIZE, "Connection %d!\n", ++conncount);
        write(connfd, buf, strlen(buf));
        close(connfd);
    }
    return 0;
}
```
Some explanation:

* To transmit _non-byte_ data over network is to deal with _byte ordering_ (endianness)
  * Various computer architectures can have _various_ byte ordering
    * [Little-endian](https://en.wikipedia.org/wiki/Endianness#Little-endian) is easy to operate with memory
  * Network transmission protocols must have _unique_ type of byte ordering
    * [Big-endian](https://en.wikipedia.org/wiki/Endianness#Big-endian) is preferred, because sending
      one byte of value, say,`0x56`, is _equivalent_ to sending four bytes `0x56`, `0`, `0` and then `0`.
  * ⇒ While dealing with `address` and `port` part of `AF_INET` address, we shall use
    _convertors_ from current (host) endianness to network one and back. Hence function names:
    * [htons](https://man7.org/linux/man-pages/man3/byteorder.3.html)
      to convert a short number (__s__) from host (__h__) endianness to network (__n__) one
      * [ntohs](https://man7.org/linux/man-pages/man3/byteorder.3.html) to do the reverse
    * [inet_pton](https://man7.org/linux/man-pages/man3/inet_pton.3.html) to convert string address
      from either IPv4 or IPv6 string representation
      to byte array in _network_ order
      * [inet_ntop](https://man7.org/linux/man-pages/man3/inet_ntop.3.html) to do the reverse

__Warning__:

This program _never_ closes its control socket.
After killing the program, we have to wait a pair of minutes, until OS decides to purge unused socket structure down.

#### Simple TCP client

Simple TCP client that connects to a server and repeatedly receives a message from the server
and prints it to standard output then reads a message from standard input and sends it to the server.

__tcp_client.c__:
```c
#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define ISIZE (sizeof(struct sockaddr_in))
#define MAXCONN 3
#define BUFSIZE 32

int main(int argc, char *argv[]) {
    int fd, sz;
    struct sockaddr_in srv;
    char buf[32];

    memset(&srv, 0, ISIZE);
    srv.sin_family = AF_INET;
    inet_pton(AF_INET, argv[1], &(srv.sin_addr));
    srv.sin_port = htons(atoi(argv[2]));

    fd = socket(AF_INET, SOCK_STREAM, 0);
    connect(fd, (struct sockaddr*) &srv, ISIZE);

    do {
        fgets(buf, BUFSIZE, stdin);
        if(buf[0]!='\n')
            write(fd, buf, strlen(buf));
        sz = read(fd, buf, BUFSIZE);
        if(sz>0) printf("%s\n", buf);
    } while(sz);
    return 0;
}
```
Some explanation:
* TCP protocol is _bidirectional_, so both client and server cat transmit data between each other.
* We use [[man2:read]] and [[man2:write]] instead of [[man2:send]] and [[man2:recv]], because we can!
* Being simple, the client program can not decide, if it shall _receive_ or _send_ data first,
  so this is delegated to user: if empty string is entered, no message is sent and the program goes directly to receive part.
  * This can lead to _protocol deadlock_, when both client and server waits for the other side to send something forever.
  * Actual TCP/UDP universal tool, [[https://helpmanual.io/man1/netcat|nectact]] (aka `nc`),
    can act as asynchronous network client or server with lot more functions.

#### How it works

```bash
acos@acos-vm:~/inetsocket$ gcc tcp_client.c -o tcp_client
acos@acos-vm:~/inetsocket$ gcc tcp_qq_srver.c -o tcp_qq_srver
acos@acos-vm:~/inetsocket$ ./tcp_qq_srver 127.0.0.1 1213 &
[1] 71838
acos@acos-vm:~/inetsocket$ ./tcp_client 127.0.0.1 1213

Connection 1!

acos@acos-vm:~/inetsocket$ ./tcp_client 127.0.0.1 1213
dddd
Connection 2!

acos@acos-vm:~/inetsocket$ ./tcp_client 127.0.0.1 1213

Connection 3!
```

<!--
* [tcp_qq_srverS.c](
  https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part2os/13_Sockets/tcp_qq_srverS.c)
* [tcp_server.c](
  https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part2os/13_Sockets/tcp_server.c)
-->

## Workshop

![Socket API](socket_api.png)

### Socket system calls

#### Common
* [socket](https://man7.org/linux/man-pages/man2/socket.2.html)
* [close](https://man7.org/linux/man-pages/man2/close.2.html)

#### Client
* [connect](https://man7.org/linux/man-pages/man2/connect.2.html)

#### Server
* [bind](https://man7.org/linux/man-pages/man2/bind.2.html)
* [listen](https://man7.org/linux/man-pages/man2/listen.2.html)
* [accept](https://man7.org/linux/man-pages/man2/accept.2.html)

#### Send/Receive

* [read](https://man7.org/linux/man-pages/man2/read.2.html)
* [write](https://man7.org/linux/man-pages/man2/write.2.html)
* [send](https://man7.org/linux/man-pages/man2/send.2.html)
* [recv](https://man7.org/linux/man-pages/man2/recv.2.html)

## Homework

__TODO__

# References

* [OSI model](https://en.wikipedia.org/wiki/OSI_model) (Wikipedia)
* [Internet protocol suite](https://en.wikipedia.org/wiki/Internet_protocol_suite) (Wikipedia)
