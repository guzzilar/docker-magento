#!/bin/sh

cd ./magento-1.9.2.4
rm -R ./_build

unzip magento-1.9.2.4-2016-02-23-06-03-22.zip
mv magento _build

chown -R www-data:www-data .


apache2 -D FOREGROUND