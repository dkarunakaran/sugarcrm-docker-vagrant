#!/bin/bash

#Removing Elasticsearch
docker stop elasticserver
docker rm elasticserver

docker build -t "elasticsearch:dockerfile" .
docker run --name elasticserver -d -p 9200:9200 -p 9300:9300 -v /elasticdata:/usr/share/elasticsearch/data elasticsearch:dockerfile