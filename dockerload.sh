#!/bin/bash
#order is important. Always web conianer should run after mysql and elastcsearch containers.
#Similarly, mysql container should run before dataonly container
echo "-----------------Removing existing dockers-----------------"
bash /app/dockerremove.sh

echo "-----------------Elastic server-----------------"
cd /app/docker-config/elasticsearch
bash start.sh

echo "-----------------Data only container to hold mysql data-----------------"
cd /app/docker-config/dataonly
bash start.sh

echo "-----------------MYSQL server-----------------"
cd /app/docker-config/database
bash start.sh

echo "-----------------Web server-----------------"
cd /app/docker-config/webserver
bash start.sh

