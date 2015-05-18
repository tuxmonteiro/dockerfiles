#!/bin/bash

curdir=$PWD

for i in galeb-api galeb-healthchecker galeb-router galeb-metrics
do
    cd $i
    docker build -t tuxmonteiro/$i .
    cd $curdir
done
