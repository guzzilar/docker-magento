#!/bin/sh

docker-compose -f ./src/magento-2.1.1/docker-compose.yml stop

docker-compose -f ./src/magento-2.1.1/docker-compose.yml rm -f php
docker-compose -f ./src/magento-2.1.1/docker-compose.yml rm -f mysql

docker-compose -f ./src/magento-2.1.1/docker-compose.yml up --build