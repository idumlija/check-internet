#!/usr/bin/bash

TEST_IP='8.8.8.8'
TEST_PACKETS=5
TEST_INTERVAL=60
TIMEOUT=1

while [ 1 ]
 do
    cmd=`ping $TEST_IP -c $TEST_PACKETS -W $TIMEOUT | grep transmitted | awk '{print int($4*100/$1)}'`
    if [ $cmd -lt 100 ]
    then
        echo "DEGRADED ($cmd): `date -u +%Y-%m-%dT%H:%M:%SZ`"
    fi
    sleep $TEST_INTERVAL
 done;
