#!/usr/bin/env bash

# Also you can install Node.js from PLCnext Store:
# https://www.plcnextstore.com/#/225

# Manual offline Node.js installation instructions can be found on the PLCnext Makers Blog:
# https://www.plcnext-community.net/en/hn-makers-blog/418-install-node-red-and-pm2-offline.html

# This example script is based on:
# https://github.com/plcnextusa/PLCnext_AWS_AZURE


# Testing for connection with the internet before execution
echo "Checking PLC internet connection please wait....."
echo -e "GET http://google.com HTTP/1.0|n|n" | nc google.com 80 > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
    echo "Connection established"
else
    echo "PLC offline, please check you network settings.  Aborting."; break;
fi

# Installing dependencies using Optware-ng package manager
# https://www.plcnext-community.net/index.php?option=com_content&view=article&id=295
echo "Installing dependencies using Optware-ng package manager please wait....."
cd /
wget -O - http://ipkg.nslu2-linux.org/optware-ng/bootstrap/buildroot-armeabihf-bootstrap.sh | sh &> /dev/null
cd /opt
export PATH=$PATH:/opt/bin:/opt/sbin
echo "Installing gcc please wait....."
ipkg install gcc &> /dev/null
echo "Installing python2.7 please wait....."
ipkg install python27 &> /dev/null
echo "Installing make please wait....."
ipkg install make &> /dev/null
echo "Installing xz-utils please wait....."
ipkg install xz-utils &> /dev/null

# Checking to see if packages installed.
echo "Checking to ensure packages were installed please wait....."
type gcc >/dev/null 2>&1 || { echo >&2 "I require gcc but it's not installed.  Aborting."; break; }
type python2 >/dev/null 2>&1 || { echo >&2 "I require python27 but it's not installed.  Aborting."; break; }
type make >/dev/null 2>&1 || { echo >&2 "I require make but it's not installed.  Aborting."; break; }
type xz >/dev/null 2>&1 || { echo >&2 "I require xz-utils but it's not installed.  Aborting."; break; }
echo "Packages installed correctly."

# Getting Node.js
echo "Setting up Nodejs please wait....."
cd /opt
wget https://nodejs.org/dist/v12.14.1/node-v12.14.1-linux-armv7l.tar.xz  &> /dev/null
xz -d node-v12.14.1-linux-armv7l.tar.xz &> /dev/null
tar -xf node-v12.14.1-linux-armv7l.tar &> /dev/null
rm -r node-v12.14.1-linux-armv7l.tar &> /dev/null
mv node-v12.14.1-linux-armv7l nodejs &> /dev/null

# Node.js config
cd /opt/nodejs/bin

chmod -c 7 npm &> /dev/null
chmod -c 7 node &> /dev/null
chmod -c 7 npx &> /dev/null
mv npm npm-org &> /dev/null

cd /opt/nodejs/lib/node_modules/npm/bin
chmod -c 7 npm-cli.js &> /dev/null
chmod -c 7 npm.cmd &> /dev/null
chmod -c 7 npx &> /dev/null
chmod -c 7 npx.cmd &> /dev/null
chmod -c 7 npx-cli.js &> /dev/null
chmod -c 7 npm &> /dev/null

cd /opt/nodejs/bin
ln -s /opt/nodejs/lib/node_modules/npm/bin/npm-cli.js npm &> /dev/null

cd /
ln -s /opt/nodejs/bin/node /usr/bin/node &> /dev/null
ln -s /opt/nodejs/bin/npm /usr/bin/npm &> /dev/null

cd /usr/bin
chmod -c 7 node &> /dev/null
chmod -c 7 npm &> /dev/null

# Checking if Node.js installed
echo "Making sure Node.js installed please wait....."
type node >/dev/null 2>&1 || { echo >&2 "Node.js is not installed.  Aborting."; break; }
echo "Nodejs was installed correctly."

# pm2 installation and configuration.
echo "Downloading and installing npm pm2 process manager please wait......."
cd /opt
npm -g install pm2 &> /dev/null
ln -s /opt/nodejs/lib/node_modules/pm2/bin/pm2 /usr/bin/pm2 &> /dev/null
ln -s /opt/nodejs/lib/node_modules/pm2/bin/pm2 /usr/sbin/pm2 &> /dev/null

# Checking if pm2 installed correctly.
type pm2 >/dev/null 2>&1 || { echo >&2 "pm2 process manager is not installed.  Aborting."; break; }
pm2 startup &> /dev/null
echo "pm2 process manager installed"

echo "Done! Node.js and pm2 process manager successfully installed"
