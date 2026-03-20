#include <stddef.h>

void *malloc(size_t size);
void free(void *ptr);

void *calloc(size_t nmemb, size_t size);
void *realloc(void *ptr, size_t size);

void *reallocarray(void *ptr, size_t nmemb, size_t size);

void heap_dump();
void stat_dump();
