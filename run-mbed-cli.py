import subprocess
import os

x = os.getcwd();
print "Printing from run-mbed-cli.py, x="+x
os.environ["MBED_CLI_APP_DIR"] = str(x);
# open Terminal and call run-mbed-cli.sh, use Popen instead of subprocess.call to pass in environment variables
subprocess.Popen(
    ["/usr/bin/open", "--fresh", "-a", "/Applications/Utilities/Terminal.app", "source/run-mbed-cli.sh"]
    )

# # call shell script that calls terminal
# subprocess.call(
#     ["/bin/sh","/Users/ausbla01/mbed/mbed-cli-osx-installer/run-mbed-cli.sh"]
#     )
