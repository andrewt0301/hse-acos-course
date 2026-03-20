#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char *p = malloc(8);
  strcpy(p, "World!");
  printf("Hello %s\n", p); // Allocates 1024 under the hood
  free(p);
  return 0;
}
