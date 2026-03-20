#ifdef RUNTIME
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include <unistd.h>

/* malloc wrapper function */
void *malloc(size_t size)
{
    void *(*mallocp)(size_t size);
    char *error;
    mallocp = dlsym(RTLD_NEXT, "malloc"); /* Get addr of libc malloc */
    if ((error = dlerror()) != NULL) {
        fputs(error, stderr);
        exit(1);
    }
    char *ptr = mallocp(size); /* Call libc malloc */
    // printf("malloc(%d) = %p\n", (int)size, ptr); /* must not be used as it calls malloc under the hood */
    char buff[64];
    int len = snprintf(buff, sizeof(buff), "malloc(%d) = %p\n", (int)size, ptr);
    write(STDOUT_FILENO, buff, len);
    return ptr;
}

/* free wrapper function */
void free(void *ptr)
{
    void (*freep)(void *) = NULL;
    char *error;
    if (!ptr) {
        return;
    }
    freep = dlsym(RTLD_NEXT, "free"); /* Get address of libc free */
    if ((error = dlerror()) != NULL) {
        fputs(error, stderr);
        exit(1);
    }
    freep(ptr); /* Call libc free */
    // printf("free(%p)\n", ptr); /* must not be used as it calls malloc under the hood */
    char buff[64];
    int len = sprintf(buff, "free(%p)\n", ptr);
    write(STDOUT_FILENO, buff, len);
}
#endif
