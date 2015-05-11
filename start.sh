#!/bin/bash

rm -rf ~/docker/.m2/repository
docker-compose up -d
docker-compose logs
