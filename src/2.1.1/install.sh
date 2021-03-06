#!/bin/sh

set -x

# cd ./magento-2.1.1
# rm -R ./_build

# unzip Magento-CE-2.1.1-2016-08-29-05-30-40.zip
# mv Magento-CE-2.1.1-2016-08-29-05-30-40 _build

cd ./magento-2.1.1

php ./_build/bin/magento setup:install \
    --cleanup-database \
    --db-host=mysql \
    --db-name=www \
    --db-user=root \
    --db-password=root \
    --admin-firstname=Developer \
    --admin-lastname=Omise \
    --admin-email=nam@omise.co \
    --admin-user=admin1234 \
    --admin-password=admin1234 \
    --backend-frontname=admin \
    --currency=THB \
    --use-rewrites=1

php ./_build/bin/magento cron:run
php ./_build/bin/magento cron:run

# Deploy static view assets to make the start up phase faster.
php ./_build/bin/magento setup:static-content:deploy

# Set developer mode
php ./_build/bin/magento deploy:mode:set developer

# Above commands result in 'localhost' being in cached files - clear
# the cache to lose that setting.
rm -rf var/cache

# chown -R www-data:www-data .

apache2 -D FOREGROUND
