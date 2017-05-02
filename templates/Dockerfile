FROM php:5.6-apache

LABEL maintainer "Guzzilar"

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections

RUN usermod -u 1000 www-data

RUN apt-get update && apt-get install -y --force-yes \
    vim \
    mysql-client \
    mysql-server

RUN docker-php-ext-install mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo pdo_mysql

# ...
# ... Add the system requirements here.
# ...

# Add INSTALL.sh.
ADD ./bin/install /var/www/bin/install
RUN chmod +x /var/www/bin/install

# Apache configuration
RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR
RUN a2enmod rewrite
RUN chown www-data:www-data -R /var/www/html/

COPY ./tmp /tmp/building/

EXPOSE 80
