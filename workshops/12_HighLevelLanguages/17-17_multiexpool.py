#!/usr/bin/env python3
'''
'''

from multiprocessing import Process, Pool
import time
import random
import sys

def f(args):
    name, wait = args
    print(name, wait)
    time.sleep(wait)
    return wait*10

if __name__ == '__main__':
    N = int(sys.argv[1]) if len(sys.argv)>1 else 5
    pool = Pool(6)
    pars = [(i, random.randrange(1,5)) for i in range(N)]
    res = pool.map(f, pars)
    print(res)
    pool.close()
