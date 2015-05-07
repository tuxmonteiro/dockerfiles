#!/bin/bash
docker inspect galeb_api_1 | grep IPAddress | cut -d'"' -f4
