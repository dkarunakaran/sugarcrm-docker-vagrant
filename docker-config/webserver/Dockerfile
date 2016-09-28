FROM dkarunakaran/sugarcrm76
MAINTAINER Dhanoop Karunakaran "dkarunakaran@squiz.net"

#Copy apc.ini
COPY apc.ini /etc/php.d/apc.ini

#Copy supervisord config
COPY supervisord.conf /etc/supervisord.conf

#copying basic PHP configs
COPY sugarcrm.ini /etc/php.d/sugarcrm.ini

#Copy default sugar_config to config_override
COPY config_override.php /usr/local/include/config_override.php

#Copy config_si.php
COPY config_si.php /usr/local/include/config_si.php

#Copy Shell script
COPY runShellScript.sh /usr/local/include/runShellScript.sh

#Run supervisord
CMD ["/usr/bin/supervisord"]
