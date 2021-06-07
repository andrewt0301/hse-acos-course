#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>

#define BUFSIZE 32
#define ISIZE sizeof(struct sockaddr_in)
#define MAXCONN 3

int main(int argc, char *argv[]) {
    int fd, cfd, sz, i;
    struct sockaddr_in srv;
    char buf[BUFSIZE];

    srv.sin_family = AF_INET;
    srv.sin_port = htons(atoi(argv[2]));
    inet_pton(AF_INET, argv[1], &srv.sin_addr);

    fd = socket(AF_INET, SOCK_STREAM, 0);
    
    bind(fd, (struct sockaddr *)&srv, ISIZE);

    listen(fd, MAXCONN);

    while(1) {
	cfd = accept(fd, NULL, NULL);
	sz = read(cfd, buf, BUFSIZE);
	for(i=0; i<sz; i++)
	    buf[i] = toupper(buf[i]);
	write(cfd, buf, sz);
	close(cfd);
    }

    return 0;
}
