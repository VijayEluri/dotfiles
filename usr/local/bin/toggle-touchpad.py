#!/usr/bin/python

import subprocess

result = subprocess.check_output("synclient -l | grep TouchpadOff | awk '{ print $3 }'", shell=True)
if (result == b'0\n'):
    subprocess.call("synclient TouchpadOff=1", shell=True)
else:
    subprocess.call("synclient TouchpadOff=0", shell=True)
