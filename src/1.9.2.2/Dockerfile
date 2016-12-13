FROM php:5.6-apache

RUN usermod -u 1000 www-data

RUN apt-get update && apt-get install -y --force-yes \
    unzip \
    libmcrypt-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    libxml2-dev \
    git \

    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \

    && docker-php-ext-install mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install gd \
    && docker-php-ext-install soap \
    && docker-php-ext-install pdo pdo_mysql

# WAIT-FOR-IT.sh
ADD ./wait-for-it.sh ./wait-for-it.sh
RUN chmod +x ./wait-for-it.sh

# INSTALL.sh
ADD ./install.sh ./install.sh
RUN chmod +x ./install.sh

# COMPOSER
# RUN curl --tlsv1 -o composer-setup.php https://getcomposer.org/installer
# RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '92102166af5abdb03f49ce52a40591073a7b859a86e8ff13338cf7db58a19f7844fbc0bb79b2773bf30791e935dbd938') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
# RUN php composer-setup.php
# RUN mv composer.phar /usr/local/bin/composer
# RUN php -r "unlink('composer-setup.php');"

ADD . ./magento-1.9.2.2

EXPOSE 80