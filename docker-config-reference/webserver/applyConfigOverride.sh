#!/bin/bash

#Change to sugar directory.
cd /var/www

#Checking config.php is empty or not, if it is empty that means not yet installed
if grep -qs sugar_config config.php
then
	#sugar is insatlled already, so proceed with rest of the step
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
