#!/bin/bash
if [ -z "$1" ]
then
	echo "Invalid arguments. Run createNewSugarContainer.sh <instance name> <port number>"
	exit
fi
if [ -z "$2" ]
then
	echo "Invalid arguments. Run createNewSugarContainer.sh <instance name> <port number>"
	exit
fi
if [ ! -d "/app/docker-config/$1" ]; then
	echo "Process of creating a container started"
	cp -r /app/docker-config/template/webserver /app/docker-config/$1
	echo "New container created from the template"
	sed -i "s/webserver/$1/" /app/docker-config/$1/start.sh
	echo "Changed the name of the container to '$1'"
	sed -i "s/apache/$1/" /app/docker-config/$1/start.sh
	echo "Changed build name of the container to '$1'"
	db_name="sugarcrm_$1"

	#Change DB name of config_si.php
	sed -i "s/sugarcrm_db/$db_name/" /app/docker-config/$1/config_si.php


	cd /app/sugarcrm
	mkdir $1
	echo "Created a new folder and located at /app/sugarcrm"
	sed -i "s/html/$1/" /app/docker-config/$1/start.sh
	echo "Changed the location of the installation file to '/app/sugarcrm/$1'"
	sed -i "s/80:\s*/$2:/" /app/docker-config/$1/start.sh
	if ! grep -qs $1 /app/dockerremove.sh
	then
		echo  >> /app/dockerremove.sh
		echo "#Removing $1" >> /app/dockerremove.sh
		echo "docker stop $1" >> /app/dockerremove.sh
		echo "docker rm $1" >> /app/dockerremove.sh
		echo "Creating an entry in dockerremove.sh"
	else
		echo "dockerremove.sh has same entry already"
	fi

	if ! grep -qs $1 /app/dockerload.sh
	then
		echo  >> /app/dockerload.sh
		echo "echo '————————$1-----------------'"  >> /app/dockerload.sh
		echo "cd /app/docker-config/$1" >> /app/dockerload.sh
		echo "bash start.sh" >> /app/dockerload.sh
		echo "Creating an entry in dockerload.sh"
	else
		echo "dockerload.sh has same entry already"
	fi
else
echo "Script can't create a container: Directory exist"
fi
