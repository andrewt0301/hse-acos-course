#define trace(x) print("Value of " #x, x)

void write_i(int);
void write_s(const char *);

void print(const char *s, int a) {
  write_s(s);
  write_i(a);
}

void foo(int x) {
  trace(x);
  int y, z;
  if (x == 0)
    y = 5;
  trace(y);
  if (!x)
    z = 6;
  trace(z);
}
