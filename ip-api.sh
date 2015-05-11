#!/bin/bash
if [ "x$1" == "xlocal" ]; then
    API="127.0.0.1"
elif [ "$(uname)"  == "Darwin" -a -n "$DOCKER_HOST" ]; then
    API="$(echo $DOCKER_HOST | awk -F'[:/]' '{ print $4 }')"
else
    API="$(docker inspect galeb_api_1 | grep IPAddress | cut -d'"' -f4)"
fi

echo $API
