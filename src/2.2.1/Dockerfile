FROM php:7.0.6-apache-jessie

LABEL maintainer "Guzzilar"

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN usermod -u 1000 www-data

RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections

RUN apt-get update && apt-get install -y --force-yes \
    wget

RUN dpkg -i mysql-apt-config_0.8.3-1_all.deb

# Add INSTALL.sh.
ADD ./bin/install /var/www/bin/install
RUN chmod +x /var/www/bin/install

# Apache configuration
RUN a2enmod rewrite
RUN chown www-data:www-data -R /var/www/html/

EXPOSE 80
EXPOSE 3306

