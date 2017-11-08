#!/bin/sh -e

# =============================================================================
#  Use this script build hipay images and run Hipay's containers
# ==============================================================================

if [ "$1" = '' ] || [ "$1" = '--help' ];then
    printf "\n                                                                                  "
    printf "\n ================================================================================ "
    printf "\n                                  HiPay'S HELPER                                 "
    printf "\n                                                                                  "
    printf "\n ================================================================================ "
    printf "\n                                                                                  "
    printf "\n                                                                                  "
    printf "\n      - init      : Build images and run containers (Delete existing volumes)     "
    printf "\n      - restart   : Run all containers if they already exist                      "
    printf "\n      - up        : Up containters                                                "
    printf "\n      - log       : Log.                                               "
    printf "\n                                                                                  "
fi


if [ "$1" = 'init' ];then
     docker-compose -f docker-compose.yml -f docker-compose.dev.yml stop
     docker-compose -f docker-compose.yml -f docker-compose.dev.yml rm -fv
     rm -Rf example/public/lib/vendor
     rm -Rf example/public/lib/node_modules
     docker-compose -f docker-compose.yml -f docker-compose.dev.yml build --no-cache
     docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
fi

if [ "$1" = 'init-production' ] && [ "$2" = '' ];then
     docker-compose -f docker-compose.yml -f docker-compose.production.yml stop
     docker-compose -f docker-compose.yml -f docker-compose.production.yml rm -fv
     rm -Rf example/public/lib/vendor
     rm -Rf example/public/lib/node_modules
     docker-compose -f docker-compose.yml -f docker-compose.production.yml build --no-cache
     docker-compose -f docker-compose.yml -f docker-compose.production.yml up -d
fi

if [ "$1" = 'init-stage' ] && [ "$2" = '' ];then
     docker-compose -f docker-compose.yml -f docker-compose.stage.yml stop
     docker-compose -f docker-compose.yml -f docker-compose.stage.yml rm -fv
     rm -Rf example/public/lib/vendor
     rm -Rf example/public/lib/node_modules
     docker-compose -f docker-compose.yml -f docker-compose.stage.yml build --no-cache
     docker-compose -f docker-compose.yml -f docker-compose.stage.yml up -d
fi

if [ "$1" = 'restart' ];then
     docker-compose -f docker-compose.yml stop
     docker-compose -f docker-compose.yml up -d
fi

if [ "$1" = 'kill' ];then
     docker-compose -f docker-compose.yml stop
     docker-compose -f docker-compose.yml rm -fv
     rm -Rf example/public/lib/vendor
     rm -Rf example/public/lib/node_modules
fi