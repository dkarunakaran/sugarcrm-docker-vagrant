#!/bin/bash

#Change to sugar directory.
cd /var/www

#Checking config.php is empty or not, if it is empty that means not yet installed
if grep -qs sugar_config config.php
then

	#sugar is insatlled already, so proceed with rest of the step

	#creating a temporary file
	touch db_config.php

	#Adding PHP tag
	echo "<?php" > db_config.php

	#Adding mysql config to the file
	sugar_config_label='$sugar_config'
	echo "$sugar_config_label['dbconfig']['db_host_name'] = '$(printenv MYSQLSERVER_PORT_3306_TCP_ADDR)';" >> db_config.php

	#Adding elastic config to the file
	sugar_config_label='$sugar_config'
	echo "$sugar_config_label['full_text_engine']['Elastic']['host'] = '$(printenv ELASTICSERVER_PORT_9200_TCP_ADDR)';" >> db_config.php

	#Checking for custom config file
	if grep -qs include_once config.php
	then
		#Removing duplicated db_config entry in config_override.php
		sed -i "s/include_once('db_config.php')/include_once('db_config.php')/" config.php
	else
		#Adding custom config to config_override.php
	    echo "include_once('db_config.php');" >> config.php
	fi
fi
