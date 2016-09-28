#!/bin/bash

#Removing MYSQL server
docker stop mysqlserver
docker rm mysqlserver

docker build -t "mysql:dockerfile" .
docker run --name mysqlserver -d -t -p 3306:3306 --volumes-from dataonlycontainer mysql:dockerfile
