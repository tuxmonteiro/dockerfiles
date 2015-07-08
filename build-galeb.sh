#!/bin/bash

curdir=$PWD

for i in galeb-api galeb-healthchecker galeb-router
do
    cd $i
    docker build -t galeb/$i .
    cd $curdir
done
