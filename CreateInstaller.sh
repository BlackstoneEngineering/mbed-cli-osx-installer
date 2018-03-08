# This script creates the installer, do not try to create it manually. If any packages need to be changed then change them here

#Config Section
MBED_CLI_VERSION="1.4.0"
MBED_LS_VERSION="1.3.7"
MBED_GREENTEA_VERSION="1.3.3"
MBED_HOST_TEST_VERSION="1.3.1"
MBED_GIT_URL="TODO"
MBED_HG_URL="https://www.mercurial-scm.org/mac/binaries/Mercurial-4.5-macosx10.12.pkg"
# ------ DO NOT MODIFY BELOW HERE -----------

# Download and extract git
# pkgutil --expand <git package>
# tar xvf Payload
# mv git git #copy the .git directory

# # create Virtual Environment
# python -m virtualenv ./venv
# # Make the links relative instead of sym linked
# python -m virtualenv --relocatable ./venv
# #Enter Virtual Environment
# source ./venv/bin/activate

#Install Packages
pip install -U mbed-cli==MBED_CLI_VERSION
pip install -U mbed-ls==MBED_LS_VERSION
pip install -U mbed-greentea==MBED_GREENTEA_VERSION
pip install -U mbed-host-tests==MBED_HOST_TEST_VERSION
pip install -U pyserial
pip install -U fuzzywuzzy
pip install -U mercurial
pip install -U bs4
pip install pyelftools
pip install Jinja2


# #exit Virtual Env
#  deactivate

# build .APP
chmod 777 ./run-mbed-cli.sh
python setup.py py2app


# Create DMG from .app 
# hdiutil create -fs HFS+ -srcfolder ./dist/MBED_CLI_v0.0.1.app -volname MBED_CLI_v0.0.1 mbed-cli-v0.0.1.dmg 
