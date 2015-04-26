#!/bin/bash

rootdir=$PWD
rm -rf galeb3* || true

git clone --recursive https://github.com/galeb/galeb3-libraries.git
cd galeb3-libraries
mvn clean install

cd $rootdir

git clone --recursive https://github.com/galeb/galeb3-api.git
cd galeb3-api
mvn clean install
cp /tmp/log4j.xml .

java -server \
     -Xms1024m \
     -Xmx1024m \
     -Dlog4j.configurationFile=log4j.xml \
     -Dio.galeb.api.port=9090 \
     -jar target/galeb-3.0.0-SNAPSHOT-uber.jar
