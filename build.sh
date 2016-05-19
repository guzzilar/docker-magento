#!/bin/sh

docker-compose -f ./src/magento-1.9.0.0/docker-compose.yml stop

docker-compose -f ./src/magento-1.9.0.0/docker-compose.yml rm -f opencart2011
docker-compose -f ./src/magento-1.9.0.0/docker-compose.yml rm -f opencart2011_db

docker-compose -f ./src/magento-1.9.0.0/docker-compose.yml up --build