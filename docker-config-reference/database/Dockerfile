FROM centos:7
MAINTAINER Dhanoop Karunakaran "dkarunakaran@squiz.net"

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r mysql && useradd -r -g mysql mysql

VOLUME /var/lib/mysql

RUN \
  su -c 'rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm'

RUN yum install -y mysql55w mysql55w-server

#installing python and pip for supervisor
RUN yum install -y python-setuptools

#installing supervisor
RUN easy_install supervisor

#Copy supervisord conf
COPY supervisord.conf /etc/supervisord.conf

COPY previlege.sh /usr/local/include/previlege.sh

EXPOSE 3306

#Run supervisord
CMD ["/usr/bin/supervisord"]
