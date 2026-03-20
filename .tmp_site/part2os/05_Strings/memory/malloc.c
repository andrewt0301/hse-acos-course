#include "malloc.h"

#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>

#include "trace.h"

// Moves a pointer forward/backward by the specified number of bytes.
#define PTR_ADD(p, offset) (((char *) p) + offset)
#define PTR_SUB(p, offset) (((char *) p) - offset)

// Type for storing header/footer
typedef unsigned int word_t;

// Word and header/footer size (bytes)
#define WSIZE sizeof(word_t)
// Double word size (bytes)
#define DSIZE (WSIZE << 1)

// Read and write a word at address p
#define GET(p) (*(word_t *)(p))
#define PUT(p, val) (*(word_t *)(p) = (word_t)(val))

// Read the size and allocated fields from address p
#define GET_SIZE(p) (GET(p) & ~0x7) // Excluding 3 lowest bits (multiple of 8)
#define GET_ALLOC(p) (GET(p) & 0x1) // Lowest bit

// Size aligned by the border of given units (e.g. 8-byte double words).
#define ALIGNED_SIZE(size, unit) (unit * ((size + (unit - 1)) / unit))

// Heap information data structure.
typedef struct {
  // Variable for spinlock.
  int lock;
  // Memory page size.
  size_t pagesize;
  // Start of reserved memory region.
  void *start;
  // End of reserved memory region.
  void *end;
  // Head of implicit block list.
  void *head;
  // Number of currently allocated bytes.
  size_t alloc;
  // Size of all allocated payloads (total malloc).
  size_t payload;
  // Size of all allocated blocks (total blocksize).
  size_t usage;
} heap_t;

// Stores heap information.
static heap_t g_heap = {0};

// Spinlock for syncronizing access to the heap.
#define HEAP_LOCK while(__atomic_test_and_set(&g_heap.lock, __ATOMIC_ACQUIRE)) {}
#define HEAP_UNLOCK __atomic_clear(&g_heap.lock, __ATOMIC_RELEASE);

// Prints information on all heap blocks.
void heap_dump() {
  void *hdr = PTR_SUB(g_heap.head, WSIZE);
  word_t hdata = GET(hdr);
  size_t hsize;
  char buff[64] = {0};
  while ((hsize = (hdata & ~0x7))) {
    void *ptr = PTR_ADD(hdr, WSIZE);
    void *ftr = PTR_ADD(hdr, hsize - WSIZE);
    word_t fdata = GET(ftr);
    size_t fsize = fdata & ~0x7;
    int len = snprintf(
        buff,
        sizeof(buff),
        "%p = [%zu/%d : %zu/%d]\n", ptr, hsize, hdata & 1, fsize, fdata & 1
    );
    write(STDOUT_FILENO, buff, len);
    hdr = PTR_ADD(hdr, hsize);
    hdata = GET(hdr);
  }
}

// Prints statistics on heap usage.
void stat_dump() {
  size_t heapsize = g_heap.end - g_heap.start;
  size_t allocated = g_heap.alloc;
  size_t free = heapsize - allocated;
  long usage = (100 * allocated) / heapsize;
  long payload = (g_heap.payload * 100) / g_heap.usage;
  char buff[256];
  int len = snprintf(
      buff,
      sizeof(buff),
      "Heap    = %zu\nAlloc   = %zu\nFree    = %zu\nUsage   = %ld%%\nPayload = %ld%%\n",
      heapsize,
      allocated,
      free,
      usage,
      payload
  );
  write(STDOUT_FILENO, buff, len);
}

// Initializes the heap: allocates an initial empty block.
static void heap_init() {
  heap_t heap = {0};
  heap.pagesize = sysconf(_SC_PAGESIZE);
  heap.start = sbrk(heap.pagesize);
  heap.end = PTR_ADD(heap.start, heap.pagesize);
  heap.head = PTR_ADD(heap.start, DSIZE);
  size_t bsize = heap.pagesize - DSIZE;
  PUT(heap.start, 1); // Prologue footer (0-size allocated block)
  PUT(PTR_ADD(heap.start, WSIZE), bsize); // Header
  PUT(PTR_SUB(heap.end, DSIZE), bsize); // Footer
  PUT(PTR_SUB(heap.end, WSIZE), 1); // Epilogue header (0-size allocated block)
  g_heap = heap;
  trace("malloc is initialized\nstart=%p\nend=  %p\nhead= %p\n",
      heap.start, heap.end, heap.head);
}

// Extends the heap by adding a new block (chunk-size aligned).
static void *heap_extend(size_t size) {
  size_t asize = ALIGNED_SIZE(size, g_heap.pagesize);
  void *start = sbrk(asize);
  void *end = PTR_ADD(start, asize);
  PUT(PTR_SUB(start, WSIZE), asize); // Header
  PUT(PTR_SUB(end, DSIZE), asize); // Footer
  PUT(PTR_SUB(end, WSIZE), 1); // Epilogue header (0-size allocated block)
  g_heap.end = end;
  return start;
}

// Marks the block as allocated (splits if too large).
static void place(void *ptr, size_t asize) {
  void *hdr = PTR_SUB(ptr, WSIZE);
  size_t bsize = GET_SIZE(hdr); // Block size
  void *ftr = PTR_ADD(hdr, bsize - WSIZE);
  size_t rsize = bsize - asize; // Remaining size
  if (rsize >= DSIZE) { // Split the block
    void *rhdr = PTR_ADD(hdr, asize);
    void *aftr = PTR_SUB(rhdr, WSIZE);
    PUT(hdr, asize | 1);
    PUT(aftr, asize | 1);
    PUT(rhdr, rsize);
    PUT(ftr, rsize);
  } else { // Do not change the block size
    PUT(hdr, bsize | 1);
    PUT(ftr, bsize | 1);
  }
}

// Merges the current block with the previous and next blocks if they are empty.
static void *coalesce(void *ptr) {
  void *hdr = PTR_SUB(ptr, WSIZE);
  size_t size = GET_SIZE(hdr);
  void *prev_ftr = PTR_SUB(hdr, WSIZE);
  void *next_hdr = PTR_ADD(hdr, size);
  word_t prev_alloc = GET_ALLOC(prev_ftr);
  word_t next_alloc = GET_ALLOC(next_hdr);
  if (prev_alloc && next_alloc) { // Case 1
    return ptr;
  }
  void *ftr = PTR_SUB(next_hdr, WSIZE);
  size_t prev_size = GET_SIZE(prev_ftr);
  size_t next_size = GET_SIZE(next_hdr);
  void *prev_hdr = PTR_SUB(hdr, prev_size);
  void *next_ftr = PTR_ADD(ftr, next_size);
  if (prev_alloc && !next_alloc) { // Case 2
    size += next_size;
    PUT(hdr, size);
    PUT(next_ftr, size);
  } else if (!prev_alloc && next_alloc) { // Case 3
    size += prev_size;
    PUT(prev_hdr, size);
    PUT(ftr, size);
    ptr = PTR_ADD(prev_hdr, WSIZE);
  } else { // Case 4
    size += prev_size + next_size;
    PUT(prev_hdr, size);
    PUT(next_ftr, size);
    ptr = PTR_ADD(prev_hdr, WSIZE);
  }
  return ptr;
}

// Finds a suitable empty block (first-fit).
static void *find_fit(size_t size) {
  if (g_heap.head == NULL) {
    heap_init();
  }
  void *hdr = PTR_SUB(g_heap.head, WSIZE);
  word_t bdata = GET(hdr);
  size_t bsize;
  while ((bsize = bdata & ~0x7)) {
    if (!(bdata & 1) && bsize >= size) {
      return PTR_ADD(hdr, WSIZE);
    }
    hdr = PTR_ADD(hdr, bsize);
    bdata = GET(hdr);
  }
  return NULL;
}

void *malloc(size_t size) {
  trace("malloc(%zu)\n", size);
  if (size == 0) {
    return NULL;
  }
  size_t asize = ALIGNED_SIZE(size, DSIZE) + DSIZE;
  HEAP_LOCK
  void *ptr = find_fit(asize);
  if (!ptr) {
    ptr = heap_extend(asize);
    ptr = coalesce(ptr);
  }
  place(ptr, asize);
  g_heap.alloc += asize;
  g_heap.usage += asize;
  g_heap.payload += size;
  HEAP_UNLOCK
  trace("malloc(%zu) = %p\n", size, ptr);
  stat_dump();
  return ptr;
}

void free(void *ptr) {
  trace("free(%p)\n", ptr);
  if (!ptr) {
    return;
  }
  void *hdr = PTR_SUB(ptr, WSIZE);
  HEAP_LOCK
  size_t size = GET_SIZE(hdr);
  void *ftr = PTR_ADD(hdr, size - WSIZE);
  PUT(hdr, size);
  PUT(ftr, size);
  coalesce(ptr);
  g_heap.alloc -= size;
  HEAP_UNLOCK
}

void *calloc(size_t nmemb, size_t size) {
  trace("calloc(%zu, %zu)\n", nmemb, size);
  size_t asize = nmemb * size;
  if (asize / size != nmemb) {
    errno = ENOMEM;
    return NULL; // Overflow!
  }
  void *ptr = malloc(asize);
  if (ptr) {
    memset(ptr, 0, asize);
  }
  return ptr;
}

void *realloc(void *ptr, size_t size) {
  trace("realloc(%p, %zu)\n", ptr, size);
  if (!ptr) {
    return malloc(size);
  }
  size_t bsize = GET_SIZE(PTR_SUB(ptr, WSIZE)) - DSIZE;
  void *newptr = ptr;
  if (bsize < size) {
    if ((newptr = malloc(size))) {
      memcpy(newptr, ptr, bsize);
      free(ptr);
    }
  }
  return newptr;
}

void *reallocarray(void *ptr, size_t nmemb, size_t size) {
  size_t asize = nmemb * size;
  if (asize / size != nmemb) {
    errno = ENOMEM;
    return NULL; // Overflow!
  }
  return realloc(ptr, asize);
}
