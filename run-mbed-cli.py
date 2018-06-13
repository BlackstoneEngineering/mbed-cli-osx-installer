import subprocess
import os

cwd = os.getcwd();
print "Printing from run-mbed-cli.py\r\n MBED_CLI_APP_DIR="+cwd
os.environ["MBED_CLI_APP_DIR"] = str(cwd); # maybe this will work, maybe it wont.


#just in case lets write it to a file
home = os.environ["HOME"]
print "$HOME= "+home
# Create directory if needed, then file
filename = home+'/.mbed/.mbed-cli-app'
if not os.path.exists(os.path.dirname(filename)):
    try:
        os.makedirs(os.path.dirname(filename))
    except OSError as exc: # Guard against race condition
        if exc.errno != errno.EEXIST:
            raise

with open(filename, "w+") as f:
    f.write("MBED_CLI_APP_DIR="+str(cwd))
    f.close()


# f = open(home+'/.mbed/.mbed-cli-app','w+')
# f.write("MBED_CLI_APP_DIR="+str(cwd))
# f.close()

# open Terminal and call run-mbed-cli.sh, use Popen instead of subprocess.call to pass in environment variables
subprocess.Popen(
    ["/usr/bin/open", "--fresh", "-a", "/Applications/Utilities/Terminal.app", "source/run-mbed-cli.sh"]
    )

# # call shell script that calls terminal
# subprocess.call(
#     ["/bin/sh","/Users/ausbla01/mbed/mbed-cli-osx-installer/run-mbed-cli.sh"]
#     )
