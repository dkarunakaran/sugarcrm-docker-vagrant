#!/bin/bash
echo "Elasticserver:"
docker inspect elasticserver |  grep IPAddress | cut -d '"' -f 4
echo "Mysqlsever:"
docker inspect mysqlserver |  grep IPAddress | cut -d '"' -f 4
echo "Websever:"
docker inspect webserver |  grep IPAddress | cut -d '"' -f 4