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
    int fd, connfd, qcounter=0;
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
        snprintf(buf, BUFSIZE, "QQ %d!\n", ++qcounter);
        //write(connfd, buf, strlen(buf));
        send(connfd, buf, strlen(buf), 0);
        close(connfd);
    }
    return 0;
}
