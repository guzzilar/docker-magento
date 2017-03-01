FROM php:5.6-apache
LABEL maintainer "Guzzilar"

RUN usermod -u 1000 www-data

RUN apt-get update && apt-get install -y --force-yes \
    unzip \
    libmcrypt-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    libxml2-dev

# Install GD library.
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

RUN docker-php-ext-install mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install soap \
    && docker-php-ext-install pdo pdo_mysql

# WAIT-FOR-IT.sh.
ADD ./bin/wait-for-it /var/www/bin/wait-for-it
RUN chmod +x /var/www/bin/wait-for-it

# INSTALL.sh.
ADD ./bin/install /var/www/bin/install
RUN chmod +x /var/www/bin/install

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

COPY ./tmp /tmp/building/

EXPOSE 80
