#!/usr/bin/env python

import os

def getpackage(x):
	os.system("pip download -d ./"+x+" "+x+" -vv");

packages = ['mbed-cli','mbed-ls','mbed-greentea','mercurial']

for package in packages:
	getpackage(package);

	