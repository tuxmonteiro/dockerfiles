#!/bin/bash
docker inspect galeb_router_1 | grep IPAddress | cut -d'"' -f4
