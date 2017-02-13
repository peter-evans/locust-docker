#!/bin/bash

LOCUST_MODE=${LOCUST_MODE:="standalone"}
LOCUST_MASTER=${LOCUST_MASTER:=""}
LOCUST_LOCUSTFILE_PATH=${LOCUST_LOCUSTFILE_PATH:="/locust-tasks/basic.py"}
LOCUST_LOCUSTFILE_URL=${LOCUST_LOCUSTFILE_URL:=""}
LOCUST_TARGET_HOST=${LOCUST_TARGET_HOST:="https://example.com"}

if [ ! -z "$LOCUST_LOCUSTFILE_URL" ]; then
    LOCUST_LOCUSTFILE_PATH="/locust-tasks/locustfile.py"
    curl $LOCUST_LOCUSTFILE_URL -o $LOCUST_LOCUSTFILE_PATH
fi

LOCUST_PATH="/usr/local/bin/locust"
LOCUST_FLAGS="-f $LOCUST_LOCUSTFILE_PATH --host=$LOCUST_TARGET_HOST"

if [[ "$LOCUST_MODE" = "master" ]]; then
    LOCUST_FLAGS="$LOCUST_FLAGS --master"
elif [[ "$LOCUST_MODE" = "slave" ]]; then
    LOCUST_FLAGS="$LOCUST_FLAGS --slave --master-host=$LOCUST_MASTER"
fi

$LOCUST_PATH $LOCUST_FLAGS