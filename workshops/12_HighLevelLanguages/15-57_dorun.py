#!/usr/bin/env python3
'''
'''
import sys
import os

Python = sys.executable
f = os.path.realpath(sys.argv[1])

print(f)

os.system(f'{Python} {f} {" ".join(sys.argv[2:])}')
