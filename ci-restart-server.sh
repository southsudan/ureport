#!/bin/bash

SETTINGS=$1

if [[ -z "${SETTINGS}" ]]; then
    echo -e "\nERROR: You must pass in a settings file to run with, e.g. 'ci_settings'\n"
    exit -1
fi

./ci-stop-server.sh
./ci-start-server.sh ${SETTINGS}
