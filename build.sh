#!/bin/sh

target_version=""
auto_open_browser=false

while test $# -gt 0; do
    case "$1" in
        --version-support*)
            echo "1.9.2.2"
            echo "1.9.2.4"
            echo "2.1.1"
            echo "2.1.2"
            shift
            ;;

        --target*)
            target_version=`echo $1 | sed -e 's/^[^=]*=//g'`
            shift
            ;;

        --open-browser)
            auto_open_browser=true
            shift
            ;;

        *)
            shift
            ;;
    esac
done

build() {
    docker-compose -f ./src/magento-$1/docker-compose.yml stop
    docker-compose -f ./src/magento-$1/docker-compose.yml rm -f php
    docker-compose -f ./src/magento-$1/docker-compose.yml rm -f mysql

    docker-compose -f ./src/magento-$1/docker-compose.yml up --build

    [ $2 = true ] && {
        open http://$(docker-machine ip)/magento-$1/_build
    }
}

[[ -n $target_version ]] && { 
    build $target_version $auto_open_browser
}
