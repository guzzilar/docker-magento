#!/bin/sh

target_version=""

while test $# -gt 0; do
    case "$1" in
        --version-support*)
            echo "1.9.2.2"
            echo "1.9.2.4"
            echo "2.1.1"
            shift
            ;;

        --target*)
            target_version=`echo $1 | sed -e 's/^[^=]*=//g'`
            shift
            ;;

        *)
            shift
            ;;
    esac
done

build() {
    docker-compose -f ./src/magento-$target_version/docker-compose.yml stop
    docker-compose -f ./src/magento-$target_version/docker-compose.yml rm -f php
    docker-compose -f ./src/magento-$target_version/docker-compose.yml rm -f mysql

    docker-compose -f ./src/magento-$target_version/docker-compose.yml up --build
}

[[ -n $target_version ]] && { 
    build $target_version
}
