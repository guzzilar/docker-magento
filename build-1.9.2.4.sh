#!/bin/sh

docker-compose -f ./src/magento-1.9.2.4/docker-compose.yml stop

docker-compose -f ./src/magento-1.9.2.4/docker-compose.yml rm -f php
docker-compose -f ./src/magento-1.9.2.4/docker-compose.yml rm -f mysql

docker-compose -f ./src/magento-1.9.2.4/docker-compose.yml up --build