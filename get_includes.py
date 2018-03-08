import os
import os.path
import sys
path = '/Users/ausbla01/mbed/mbed-cli-osx-installer/venv/lib/python2.7'

modules = []
skip = ['site-packages']

for root, dirs, files in os.walk(path):
	for item in skip:
		if item in dirs:
			dirs.remove(item)
	for f in files:
		d = root.replace(path, '')
		full_path = os.path.join(d, f)
		if '\\' in full_path:
			full_path = full_path.replace('\\', '.')
		if '/' in full_path:
			full_path = full_path.replace('/', '.')
		if full_path[0] == '.':
			full_path = full_path[1:]
		if full_path.startswith('plat-mac.'):
			full_path = full_path[9:]
		if full_path.startswith('lib-scriptpackages.'):
			full_path = full_path[18:]
		if full_path.startswith('plat-darwin.'):
			full_path = full_path[11:]
		if full_path.startswith('.'):
			continue
		#Ignore .pyc and .pyo files
		if f.endswith('.py') \
		and not f.startswith('_'):
			full_path = full_path[:-3]
#Save each part of the file path as part of the module name:
#foo.foo1.foo2.py has a package foo, a sub-package foo1,
#and a module foo2. Save foo, foo.foo1, and foo.foo1.foo2.py.
		section_total = full_path.count('.')
		start = 0
		for x in range(section_total):
			stop = full_path.find('.', start)
			if stop != -1:
				package = full_path[:stop]
			if package and package not in modules:
				modules.append(package)
				start = stop + 1
			if full_path and full_path not in modules:
				modules.append(full_path)

# modules.remove('anydbm') #This module fails for some reason.

print 'The number of modules is', len(modules)
print 'modules found are ', str(modules)

# mac_file = open('setup.py', 'r')
# lines = mac_file.readlines()
# mac_file.close()

# for x in range(len(lines)):
# 	if lines[x].startswith('includes ='):
# 		lines[x] = 'includes = ' + str(modules)
# 	break
# mac_file = open('setup.py', 'w')
# mac_file.writelines(lines)
# mac_file.close()