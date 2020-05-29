#!/usr/bin/env python3
'''
'''

import subprocess as proc
import sys

d = sys.argv.index("@")

p1 = proc.Popen(sys.argv[1:d], stdout=proc.PIPE)
p2 = proc.Popen(sys.argv[d+1:], stdin=p1.stdout, stdout=proc.PIPE)
p1.stdout.close()  # Allow p1 to receive a SIGPIPE if p2 exits.
output = p2.communicate()[0]

#print(output.decode())
