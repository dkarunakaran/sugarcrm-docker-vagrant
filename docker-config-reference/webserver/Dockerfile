FROM centos:7
MAINTAINER Dhanoop Karunakaran "dkarunakaran@squiz.net"

#reference - https://webtatic.com/packages/php54/
# Enable EPEL
RUN \
  su -c 'rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm'
RUN \
  su -c 'rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm'

#installing PHP
RUN yum install -y php54w  php54w-cgi php54w-cli php54w-common php54w-curl php54w-gd php54w-mysql php54w-imap php54w-bcmath php54w-ldap php54w-pdo php54w-mbstring php54w-pecl-apc php54w-process php54w-soap php54w-xml

#installing apache and memecached
RUN yum install -y httpd mod_ssl vim python-setuptools python-pip memcached

#Installing mysql client
RUN yum install -y mysql

#installing supervisor
RUN pip install supervisor

# CONFIGURE APACHE AND PHP
RUN sed -i 's/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
RUN sed -i 's|DocumentRoot "/var/www/html"|DocumentRoot "/var/www"|g' /etc/httpd/conf/httpd.conf

# END RUN

#Installing python based cronjob - https://hub.docker.com/r/hamiltont/docker-cron/~/dockerfile/
RUN yum install -y mercurial

RUN pip install -e hg+https://bitbucket.org/dbenamy/devcron#egg=devcron

# Setup defaults
RUN mkdir /cron && \
    echo "* * * * * cd /var/www; php -f cron.php > /dev/null 2>&1" > /cron/crontab

#Installing APC for PHP caching
RUN yum install -y php54w-pear php54w-devel httpd-devel pcre-devel gcc make
RUN pecl install apc
COPY apc.ini /etc/php.d/apc.ini

#copying basic PHP configs
COPY sugarcrm.ini /etc/php.d/sugarcrm.ini

#Copy supervisord conf
COPY supervisord.conf /etc/supervisord.conf

#Copy shell script to apply the IPs
COPY applyIP.sh /usr/local/include/applyIP.sh

#Copy default sugar_config to config_override
COPY config_override.php /usr/local/include/config_override.php

#Apply default config to config_override.php
COPY applyConfigOverride.sh /usr/local/include/applyConfigOverride.sh

EXPOSE 22 80

#Run supervisord
CMD ["/usr/bin/supervisord"]