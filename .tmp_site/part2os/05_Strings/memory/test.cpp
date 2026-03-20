#include <iostream>
#include <string>
#include <vector>

int main() {
  std::string s = "Hello World!";
  std::cout << s << std::endl;
  std::vector<int> v(20, 0);
  int *pp = new int[10];
  delete pp;
  std::string text = "This is some random very long text!";
  return 0;
}
