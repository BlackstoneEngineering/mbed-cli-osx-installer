# This script creates the installer, do not try to create it manually. If any packages need to be changed then change them here

#Config Section
MBED_CLI_VERSION="1.4.0"
MBED_LS_VERSION="1.3.7"
MBED_GREENTEA_VERSION="1.3.3"
MBED_HOST_TEST_VERSION="1.3.1"
MBED_GIT_URL="TODO"
MBED_INSTALLER_VERSION="v0.0.4"
# ------ DO NOT MODIFY BELOW HERE -----------
echo "\r\n-----Starting Build----- \r\n"
# put version info into a file for later reference
rm -rf ./VERSION.txt
touch ./VERSION.txt
echo "export MBED_INSTALLER_VERSION=\"$MBED_INSTALLER_VERSION\"" > VERSION.txt
echo "Building Installer Version $MBED_INSTALLER_VERSION"

# Download and extract git
echo "\r\n-----Downloading GIT-----\r\n"
# pkgutil --expand <git package>
# tar xvf Payload
# copy git files here : todo : 

# # create Virtual Environment
echo "\r\n-----Creating Virtual Environment----- \r\n"
rm -rf ./venv
mkdir ./venv
virtualenv --download --always-copy --unzip-setuptools --system-site-packages -vv ./venv   
# # Make the links relative instead of sym linked
# python -m virtualenv --relocatable ./venv
# #Enter Virtual Environment
source ./venv/bin/activate

#Install Packages
pip install -I mbed-cli
pip install -I mbed-ls
pip install -I mbed-greentea
pip install -I mbed-host-tests
pip install -I mbed-flasher
pip install -I pyserial
pip install -I mercurial
pip install -I virtualenv
# pip install -U elftools
# pip install -U fuzzywuzzy
# pip install -U mercurial




# #exit Virtual Env
deactivate
virtualenv --relocatable -vv ./venv # make venv portable
# TODO: Manually adjust shebang for virtualenv and hg as virtualenv cannot do this itself


# build .APP
echo "\r\n-----Building APP----- \r\n"
rm -rf ./*.app
chmod 777 ./run-mbed-cli.sh
python setup.py py2app -vv > buildlog.txt # build .app, save log for debug


# Create DMG from .app 
echo "\r\n-----Packaging DMG----- \r\n"
rm -rf ./*.dmg
hdiutil create -fs HFS+ -srcfolder ./dist/MBED_CLI.app -volname MBED_CLI"_$MBED_INSTALLER_VERSION" mbed-cli-"$MBED_INSTALLER_VERSION".dmg 
