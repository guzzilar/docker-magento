FROM php:7.0-apache
MAINTAINER Guzzilar

RUN usermod -u 1000 www-data
RUN echo "APACHE_RUN_USER=www-data" >> /etc/apache2/envvars

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

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '61069fe8c6436a4468d0371454cf38a812e451a14ab1691543f25a9627b97ff96d8753d92a00654c21e2212a5ae1ff36') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# WAIT-FOR-IT.sh.
ADD ./bin/wait-for-it /var/www/bin/wait-for-it
RUN chmod +x /var/www/bin/wait-for-it

# INSTALL.sh.
ADD ./bin/install /var/www/bin/install
RUN chmod +x /var/www/bin/install

# Move PHP.ini config to server.
COPY ./config/php.ini /usr/local/etc/php/

# Add project to directory.
# ADD . ./

EXPOSE 80
