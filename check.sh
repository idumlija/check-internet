#!/bin/bash

INTERNET_STATUS="UNKNOWN"
TIMESTAMP=`date +%s`
while [ 1 ]
 do
    ping -c 1 -W 0.7 8.8.4.4 > /dev/null 2>&1
    if [ $? -eq 0 ] ; then
        if [ "$INTERNET_STATUS" != "UP" ]; then
            echo "UP   `date +%Y-%m-%dT%H:%M:%S%Z` $((`date +%s`-$TIMESTAMP))";
            INTERNET_STATUS="UP"
        fi
    else
        if [ "$INTERNET_STATUS" = "UP" ]; then
            echo "DOWN `date +%Y-%m-%dT%H:%M:%S%Z` $((`date +%s`-$TIMESTAMP))";
            INTERNET_STATUS="DOWN"
        fi
    fi
    sleep 1
 done;
