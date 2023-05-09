#!/bin/sh

#
# DO_FETCH
#
# Список пакетов для offline установки

PACKAGES="mc" 

WORK_DIR=$(pwd)
CACHE_DIR=./nocloud

apt-get update -y

mkdir -p $CACHE_DIR

cd $CACHE_DIR
apt-get download -o Dir::Cache="${CACHE_DIR}"  \
    $(apt-cache depends \
    --recurse \
    --no-recommends \
    --no-suggests \
    --no-conflicts \
    --no-breaks \
    --no-replaces \
    --no-enhances \
    ${PACKAGES} | grep "^\w")

# Получаем индексы для пакетов
dpkg-scanpackages . | gzip -9c > Packages.gz

cd $WORK_DIR
