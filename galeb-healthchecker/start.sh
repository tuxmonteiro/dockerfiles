#!/bin/bash

rootdir=$PWD
rm -rf galeb3* || true

git clone --recursive https://github.com/galeb/galeb3-libraries.git
cd galeb3-libraries
mvn clean install

cd $rootdir

git clone --recursive https://github.com/galeb/galeb3-healthchecker.git
cd galeb3-healthchecker
mvn clean install
cp /tmp/log4j.xml .
cp /tmp/hazelcast.xml .

sed -i "s/%CLUSTER_ID%/$CLUSTER_ID/" hazelcast.xml

java -server \
     -Xms1024m \
     -Xmx1024m \
     -Dlog4j.configurationFile=log4j.xml \
     -Dhazelcast.config=hazelcast.xml \
     -jar target/galeb-3.0.0-SNAPSHOT-uber.jar
