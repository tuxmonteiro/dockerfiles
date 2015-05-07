#!/bin/bash

export LOGLEVEL=DEBUG
export DEBUG=true

rm -rf galeb3* || true

git clone --recursive https://github.com/galeb/galeb3-router.git
cd galeb3-router
mvn clean install
cp /tmp/log4j.xml .
cp /tmp/hazelcast.xml .

sed -i "s/%CLUSTER_ID%/$CLUSTER_ID/" hazelcast.xml

java -server \
     -Xms1024m \
     -Xmx1024m \
     -Xdebug \
     -Dlog4j.configurationFile=log4j.xml \
     -Dhazelcast.config=hazelcast.xml \
     -Dio.galeb.router.port=$PORT \
     -Dio.galeb.router.enableMetrics=false \
     -Dio.galeb.router.maxConn=$MAXCONN \
     -Dio.galeb.core.services.schedulerInterval=$INTERVAL \
     -jar target/galeb-3.0.0-SNAPSHOT-uber.jar
