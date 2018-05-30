import subprocess
import os

x = os.getcwd();
print "Printing from run-mbed-cli.py, x="+x
# open Terminal and call run-mbed-cli.sh
subprocess.call(
    ["/usr/bin/open", "--fresh", "-a", "/Applications/Utilities/Terminal.app", "source/run-mbed-cli.sh"]
    )

# # call shell script that calls terminal
# subprocess.call(
#     ["/bin/sh","/Users/ausbla01/mbed/mbed-cli-osx-installer/run-mbed-cli.sh"]
#     )
