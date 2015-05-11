#!/bin/bash

rm -rf galeb3* || true

git clone --recursive https://github.com/galeb/galeb3-metrics.git
cd galeb3-metrics
mvn clean install
cp /tmp/log4j.xml .
cp /tmp/hazelcast.xml .

sed -i "s/%CLUSTER_ID%/$CLUSTER_ID/" hazelcast.xml

java -server \
     -Xms1024m \
     -Xmx1024m \
     -Dlog4j.configurationFile=log4j.xml \
     -Dhazelcast.config=hazelcast.xml \
     -Dio.galeb.schedulerInterval=$INTERVAL \
     -jar target/galeb-3.0.0-SNAPSHOT-uber.jar
