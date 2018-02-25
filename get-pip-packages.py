#!/usr/bin/env python

import os

def getpackage(x):
	ls = os.popen("ls").read()
	if x in ls:
		#skip it
		print("Package "+x+"already exists, skipping download")
		return;
	else:
		print("Downloading "+x)
		os.system("pip download -d ./"+x+" "+x+" -vv"); #download it

def unpack(package):
	modules = os.popen("ls "+package+"| grep -v .whl").read() # get list of everything that isnt a wheel
	modules = modules.split('\n');
	print("unpacking modules ",modules)
	for  m in modules:
		if '.tar.gz' in m:
			print("untaring "+m+'\r\n')
			# unpack
			os.system("cd "+package+";"+"tar xvzf "+m);
		elif '.zip' in m:
			# unpack
			print("Unzipping ",m,"\r\n")
			os.system("cd "+package+";"+"unzip "+m)


packages = ['mbed-cli','mbed-ls','mbed-greentea','mercurial']

for package in packages:
	print("Getting Package", package)
	getpackage(package);
	print("Unpacking Package ", package)
	unpack(package);

