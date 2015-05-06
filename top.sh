#!/bin/bash

docker stats $(docker ps | grep galeb | sed 's/.*galeb_\(\w\+\) .*/galeb_\1/')
