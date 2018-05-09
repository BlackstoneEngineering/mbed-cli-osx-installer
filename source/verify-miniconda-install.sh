#! /usr/bin/sh
# Check miniconda is installed
echo "verifying miniconda installed at $PWD/miniconda"
if [ ! -d "$PWD/miniconda" ]; then
  	# Control will enter here if $DIRECTORY doesn't exist.
  	echo "    miniconda folder not found, installing it"
  	mkdir "$PWD/miniconda"
  	chmod 777 "$PWD/miniconda"
  	sh "$PWD"/Miniconda2-latest-MacOSX-x86_64.sh -b -p "$CWD"/miniconda -f
  	source "$PWD/miniconda/bin/activate"
  	pip install -U mbed-cli
  	pip install -r "$PWD/requirements.txt"
  	pip install -U mercurial
  	pip install -U mbed-greentea
  	source deactivate
elif source "$PWD/miniconda/bin/activate"; then
	# check miniconda works
	echo "   miniconda works just fine, deactivate it now"
	source deactivate
else
	# miniconda doesnt work, but it does exist. Likely .app has been moved to new location
	echo "    Miniconda is installed, but not working, re-installing now to $PWD"
	sh "$PWD"/Miniconda2-latest-MacOSX-x86_64.sh -b -p "$PWD"/miniconda -f
	source "$PWD/miniconda/bin/activate"
  	pip install -U mbed-cli
  	pip install -r "$PWD/requirements.txt"
  	pip install -U mercurial
  	pip install -U mbed-greentea
  	source deactivate
fi
