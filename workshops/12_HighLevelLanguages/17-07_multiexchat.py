#!/usr/bin/env python3
'''
'''

from multiprocessing import Process, Pipe
import time
import random

def f(conn):
    name, wait = conn.recv()
    print(name, wait)
    time.sleep(wait)
    conn.send(f"Hello, {name}!")
    conn.close()

if __name__ == '__main__':
    parent_conn, child_conn = Pipe()
    p = Process(target=f, args=(child_conn,))
    p.start()
    parent_conn.send(("bob", 4))
    res = parent_conn.recv()
    print(res)
    p.join()
