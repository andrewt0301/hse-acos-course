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

    sendto(fd, argv[2], strlen(argv[2]), 0,
                      (const struct sockaddr *) &srv, USIZE);

    
    return 0;
}
