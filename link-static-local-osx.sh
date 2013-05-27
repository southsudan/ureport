#!/bin/bash

echo "Linking local nginx static files to this dir. WARNING - this only works on OSX and if you install nginx with homebrew!!"


if [ -e /usr/local/var/www/ureport ]; then
    unlink /usr/local/var/www/ureport
fi

CURRENT_DIR=`pwd`

echo "Linking ${CURRENT_DIR} to /usr/local/var/www/ureport ..."
ln -s "${CURRENT_DIR}" /usr/local/var/www/ureport

#Link django-admin files
ln -s "${UREPORT_VIRTUAL_ENV_HOME}/lib/python2.7/site-packages/django/contrib/admin/media" "${CURRENT_DIR}/ureport_project/media" 

echo "Reloading nginx"

launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
