#!/bin/bash

BACKEND="$(docker inspect galeb_backend_1 | grep IPAddress | cut -d'"' -f4)"

sed "s/@BACKEND@/$BACKEND/g" routes.template > routes.sh
chmod +x routes.sh  
./routes.sh

rm -f routes.sh
