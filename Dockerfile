FROM library/debian:stretch
MAINTAINER juanfrancisco.benito@zitrogames.com

RUN	apt-get update && \
	apt-get install -y libapache2-mod-php7.0 apache2 && \
	rm -rf /var/lib/dpkg /var/lib/apt /var/cache/apt /var/www/html/index.html /var/log/apache2/access.log /var/log/apache2/error.log && \
	ln -s /dev/stdout /var/log/apache2/access.log && \
	ln -s /dev/stderr /var/log/apache2/error.log

COPY 	index.html /var/www/html/
#ADD	mi_web-tgz /var/www/html/
ENTRYPOINT [ "/usr/sbin/apache2ctl","-D","FOREGROUND" ]
#CMD [ "8.8.8.8" ]
#EXPOSE 80

