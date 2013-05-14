#!/bin/bash

echo "Linking local nginx static files to this dir. WARNING - this only works on OSX and if you install nginx with homebrew!!"


if [ -e /usr/local/var/www/ureport ]; then
    unlink /usr/local/var/www/ureport
fi

CURRENT_DIR=`pwd`

echo "Linking ${CURRENT_DIR} to /usr/local/var/www/ureport ..."
ln -s "${CURRENT_DIR}" /usr/local/var/www/ureport

echo "Reloading nginx"

launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
