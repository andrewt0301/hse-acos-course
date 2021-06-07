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
	int fd;
	struct sockaddr_in srv;
	char buf[32];

	memset(&srv, 0, ISIZE);
	srv.sin_family = AF_INET;
	inet_pton(AF_INET, argv[1], &(srv.sin_addr));
	srv.sin_port = htons(atoi(argv[2]));

	fd = socket(AF_INET, SOCK_STREAM, 0);

        while(1) {
	        connect(fd, (struct sockaddr*) &srv, ISIZE);
 
		fgets(buf, BUFSIZE, stdin);
		if(buf[0]!='\n')
			write(fd, buf, strlen(buf));
		read(fd, buf, BUFSIZE);
		printf(">%s<\n", buf);
	}
	return 0;
}
