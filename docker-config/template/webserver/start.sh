#!/bin/bash

#Removing Web server
docker stop webserver
docker rm webserver

docker build -t "apache:dockerfile" .
docker run --name webserver --link mysqlserver:mysqlserver --link elasticserver:elasticserver -d -p 80:80 -v /app/sugarcrm/html:/var/www -t -i apache:dockerfile
