#!/usr/bin/env python3
'''
'''
import sys
import os
from subprocess import run

Python = sys.executable
f = os.path.realpath(sys.argv[1])
if os.path.exists(f):
    run([Python, f]+sys.argv[2:])
else:
    print(f"No {f}", file=sys.stderr)
