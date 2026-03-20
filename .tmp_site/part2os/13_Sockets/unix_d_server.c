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
