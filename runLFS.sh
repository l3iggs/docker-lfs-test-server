#!/bin/bash

LOCAL_LFS_DIR=~/storge/lfs

# to reset the whole thing:
# rm -rf $LOCAL_LFS_DIR
# mkdir -p $LOCAL_LFS_DIR
# touch $LOCAL_LFS_DIR/lfs.db
# chmod 777 $LOCAL_LFS_DIR/lfs.db

HOSTNAME=example.com
ADMINUSER=admin
ADMINPASS=admin

docker stop lfs
docker rm lfs
docker pull l3iggs/lfs-test-server

docker run --restart='always' -e REGENERATE_SSL_CERT=true -e LFS_SCHEME=https -v ${LOCAL_LFS_DIR}/lfs.db:/home/docker/lfs.db -v ${LOCAL_LFS_DIR}:/content -e LFS_CONTENTPATH=/content --name lfs -e LFS_HOST=$HOSTNAME:9999 -e LFS_ADMINUSER=$ADMINUSER -e LFS_ADMINPASS=$ADMINPASS -p 9999:9999 -d l3iggs/lfs-test-server
