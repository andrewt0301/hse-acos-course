#!/usr/bin/env python3
'''
'''

from multiprocessing import Process
import time
import random

def f(name, wait):
    print(name, wait)
    time.sleep(wait)
    print('hello', name)

if __name__ == '__main__':
    p = Process(target=f, args=('bob',random.randrange(1,5)))
    p.start()
    p.join()
