#!/bin/sh

cd ./magento-1.9.2.2
rm -R ./_build

mkdir ./_build
cp magento-1.9.2.2-2015-10-27-03-14-30.zip ./_build
cd ./_build
unzip magento-1.9.2.2-2015-10-27-03-14-30.zip

cd ../
chown -R www-data:www-data .

apache2 -D FOREGROUND