FROM php:7.0-apache

RUN usermod -u 1000 www-data

RUN apt-get update && apt-get install -y --force-yes \
    unzip \
    libmcrypt-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    libxml2-dev \
    libxslt-dev \
    libicu-dev \
    zlib1g-dev

# Install GD library.
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

# Install INTL library.
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

RUN docker-php-ext-install mysqli \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install soap \
    && docker-php-ext-install xsl \
    && docker-php-ext-install zip

RUN a2enmod rewrite

# WAIT-FOR-IT.sh.
ADD ./bin/wait-for-it ./bin/wait-for-it
RUN chmod +x ./bin/wait-for-it

# INSTALL.sh.
ADD ./bin/install ./bin/install
RUN chmod +x ./bin/install

# Move PHP.ini config to server.
COPY ./config/php.ini /usr/local/etc/php/

# Add project to directory.
ADD . ./

EXPOSE 80
