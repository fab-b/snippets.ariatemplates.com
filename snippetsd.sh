#!/bin/bash

PID_FILE="/tmp/snippetsd.pid"
SERVER_PATH="$PWD/server.js"
LOG_FILE="$PWD/snippets.log"

if [ "$1" = "start" ]; then
    if [ -e $PID_FILE ]; then
        echo "~ snippets-at daemon is already running."
    else
        echo "~ starting snippets-at daemon."
        nohup node $SERVER_PATH > $LOG_FILE 2>&1 &
    fi
elif [ "$1" = "stop" ]; then
    if [ ! -e $PID_FILE ]; then
        echo "~ snippets-at daemon is not running."
    else
        echo "~ stopping snippets-at daemon."
        kill `cat $PID_FILE`
        rm -f $PID_FILE
    fi
elif [ "$1" = "status" ]; then
    if [ -e $PID_FILE ]; then
        echo "~ snippets-at daemon is running as process "`cat $PID_FILE`
    else
        echo "~ snippets-at daemon is not running."
    fi
fi