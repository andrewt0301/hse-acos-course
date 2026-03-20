all:	malloc test testcpp

malloc:
	gcc -Wall -g -shared -fpic -o libmalloc.so malloc.c
test:
	gcc -g test.c -o test
testcpp:
	g++ -g test.cpp -o testcpp
run:	malloc test
	LD_PRELOAD="./libmalloc.so" ./test
runcpp:	malloc testcpp
	LD_PRELOAD="./libmalloc.so" ./testcpp
debug:
	gdb -iex "set exec-wrapper env LD_PRELOAD=./libmalloc.so" ./test
clean:
	rm -f test testcpp *.so *.o
