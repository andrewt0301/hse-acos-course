#!/usr/bin/env python3
'''
'''
import sys
import os

Python = sys.executable
f = os.path.realpath(sys.argv[1])
if os.path.exists(f):
    os.system(f'{Python} {f} {" ".join(sys.argv[2:])}')
else:
    print(f"No {f}", file=sys.stderr)
