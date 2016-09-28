#!/bin/bash

#Fix to import issue - starts
cd /usr/local/include

if [ ! -d upload ]; then
        mkdir upload
        chown apache:apache upload
fi

#Change to sugar directory.
cd /var/www

#Checking upload dir exist
mv upload upload_bkup
mv upload: upload:_bkup

#Creating a symbolic link
ln -s /usr/local/include/upload .

#Fix to import issue - ends

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

	#sugar is insatlled already, so proceed with rest of the step
	#Applying config_override
	if [ -s config_override.php ]
	then
		# do something as file has data
		#Checking config_override has already the settings. if not, add
		if ! grep -qs DEFAULT_SETTINGS_SUGAR config_override.php
		then
			cat /usr/local/include/config_override.php >> config_override.php
		fi
	else
		# do something as file has no data. Add config_override default settings
		echo "<?php" >> config_override.php
		echo >> config_override.php
		cat /usr/local/include/config_override.php >> config_override.php
	fi

fi

#If sugar is not installed, then do silentInstall
#Checking config.php is empty or not, if it is empty that means not yet installed
if ! grep -qs sugar_config config.php
then

	#Copying config of silent install
	cp /usr/local/include/config_si.php config_si.php

	#Change settings
	db_host="$(printenv MYSQLSERVER_PORT_3306_TCP_ADDR)"
	elastic_host="$(printenv ELASTICSERVER_PORT_9200_TCP_ADDR)"

	#Change the config
	sed -i "s/localhost_db/$db_host/" config_si.php
	sed -i "s/localhost_elastic/$elastic_host/" config_si.php

	#Run the silent installation
	php-cgi -f install.php goto=SilentInstall cli=true

fi
