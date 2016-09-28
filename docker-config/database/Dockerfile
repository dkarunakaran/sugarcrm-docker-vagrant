FROM dkarunakaran/mysql55
MAINTAINER Dhanoop Karunakaran "dkarunakaran@squiz.net"

#Copy supervisord conf
COPY supervisord.conf /etc/supervisord.conf

COPY previlege.sh /usr/local/include/previlege.sh

#Run supervisord
CMD ["/usr/bin/supervisord"]

