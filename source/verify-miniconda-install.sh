#! /usr/bin/sh
# Check miniconda is installed

# This should grab the MBED_CLI_APP_DIR variable set by the installer. Done as a workaround for OSX Sandboxes
source ~/.mbed/.mbed-cli-app

CWD=$MBED_CLI_APP_DIR
cd $CWD
echo "verifying miniconda installed at $CWD/miniconda"
if [ ! -d "$CWD/miniconda" ]; then
  	# Control will enter here if $DIRECTORY doesn't exist.
  	echo "    miniconda folder not found, installing it"
  	mkdir "$CWD/miniconda"
  	chmod 777 "$CWD/miniconda"
  	sh "$CWD"/Miniconda2-latest-MacOSX-x86_64.sh -b -p "$CWD"/miniconda -f
  	source "$CWD/miniconda/bin/activate"
  	pip install -U mbed-cli
  	pip install -r "$CWD/requirements.txt"
  	pip install -U mercurial
  	pip install -U mbed-greentea
  	source deactivate
elif source "$CWD/miniconda/bin/activate"; then
	# check miniconda works
	echo "   miniconda works just fine, deactivate it now"
	source deactivate
else
	# miniconda doesnt work, but it does exist. Likely .app has been moved to new location
	echo "    Miniconda is installed, but not working, re-installing now to $CWD"
	sh "$CWD"/Miniconda2-latest-MacOSX-x86_64.sh -b -p "$CWD"/miniconda -f
	source "$CWD/miniconda/bin/activate"
  	pip install -U mbed-cli
  	pip install -r "$CWD/requirements.txt"
  	pip install -U mercurial
  	pip install -U mbed-greentea
  	source deactivate
fi
cd -