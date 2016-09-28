FROM dkarunakaran/elasticsearch14
MAINTAINER Dhanoop Karunakaran "dkarunakaran@squiz.net"

#Copy entrypoint file
COPY docker-entrypoint.sh /

#Copy supervisord conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY config/elasticsearch.yml /usr/share/elasticsearch/config/

#Run supervisord
CMD ["/usr/bin/supervisord"]

