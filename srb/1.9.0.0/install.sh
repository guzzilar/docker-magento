#!/bin/sh

###
# Magento 1.9.0.0 directory: /var/www/html/magento-1.9.0.0
# Build directory:           /var/www/html/magento-1.9.0.0/_build
###
cd ./magento-1.9.0.0
rm -R ./_build
mkdir ./_build

# DEPLOY

chown -R www-data:www-data .

apache2 -D FOREGROUND
