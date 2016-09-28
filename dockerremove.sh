#Removing Elasticsearch
docker stop elasticserver
docker rm elasticserver

#Removing MYSQL server
docker stop mysqlserver
docker rm mysqlserver

#Removing Web server
docker stop webserver
docker rm webserver

