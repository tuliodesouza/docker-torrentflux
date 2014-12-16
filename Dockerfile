FROM ubuntu:14.04
MAINTAINER github.com/tuliosalvaro

ENV DEBIAN_FRONTEND noninteractive

ADD torrentflux.sql /tmp/torrentflux.sql

# Install HTTPD and GIT && Get latest Lavern Minifield
RUN apt-get update && \
    apt-get install -y torrentflux && \
    ln -s /etc/torrentflux/apache.conf /etc/apache2/sites-enabled/torrentflux.conf && \
    /etc/init.d/mysql start && \
    mysql -u root < /tmp/torrentflux.sql && \
    mysql -u root torrentflux < /usr/share/dbconfig-common/data/torrentflux/install/mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /etc/apache2/sites-enabled/000-default.conf

# add database configuration for torrentflux
ADD config-db.php /etc/torrentflux/config-db.php

# Add the script that will start mysql and apache
ADD run.sh /run.sh

EXPOSE 80

# CMD ["apache2ctl", "-D", "FOREGROUND"]

# the data will be stored under /var/cache/torrentflux
# so, mount it externally to be able to access your files from the host OS

CMD ["/run.sh"]