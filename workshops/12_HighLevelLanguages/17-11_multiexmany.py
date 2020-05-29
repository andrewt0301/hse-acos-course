#!/usr/bin/env python3
'''
'''

from multiprocessing import Process
import time
import random
import sys

def f(name, wait):
    print(name, wait)
    time.sleep(wait)
    print('hello', name, wait)

if __name__ == '__main__':
    N = int(sys.argv[1]) if len(sys.argv)>1 else 5
    P = [Process(target=f, args=(i, random.randrange(1,5))) for i in range(N)]
    res = [p.start() for p in P]
    res = [p.join() for p in P]
