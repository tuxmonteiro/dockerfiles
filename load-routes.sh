#!/bin/bash

if [ "$(uname)"  == "Darwin" -a -n "$DOCKER_HOST" ]; then
    API="$(echo $DOCKER_HOST | awk -F'[:/]' '{ print $4 }')"
    BACKEND=$API
else
    API="$(docker inspect galeb_api_1 | grep IPAddress | cut -d'"' -f4)"
    BACKEND="$(docker inspect galeb_backend_1 | grep IPAddress | cut -d'"' -f4)"
fi

sed -e "s/@BACKEND@/$BACKEND/g" -e "s/@API@/$API/g" routes.template > routes.sh
chmod +x routes.sh
./routes.sh

rm -f routes.sh
