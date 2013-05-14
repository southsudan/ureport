#!/bin/bash

SETTINGS_FILE=$1

if [[ -z "${SETTINGS_FILE}" ]]; then
    echo -e "\nERROR: You must pass in a settings file to run with, e.g. 'ci_settings'\n"
    exit -1
fi


cd ureport_project

echo "Starting celery deamon with ${SETTINGS_FILE}.py running in [`pwd`]"


if [ ! -d "target" ]; then
    mkdir target
fi

echo -e "\nStarting Celery...\n" > target/celery.log

nohup ./manage.py celeryd --settings=${SETTINGS_FILE} --verbosity=3 > target/celery.log &

echo $! > target/celery.pid

cd ..
