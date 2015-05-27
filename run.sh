#!/bin/bash

set -eu
set -o pipefail


#LFS_LISTEN      # The address:port the server listens on, default: "tcp://:8080"
#LFS_HOST        # The host used when the server generates URLs, default: "localhost:8080"
#LFS_METADB      # The database file the server uses to store meta information, default: "lfs.db"
#LFS_CONTENTPATH # The path where LFS files are store, default: "lfs-content"
#LFS_ADMINUSER   # An administrator username, default: unset
#LFS_ADMINPASS   # An administrator password, default: unset
#LFS_CERT        # Certificate file for tls
#LFS_KEY         # tls key
#LFS_SCHEME      # set to 'https' to override default http


: ${LFS_LISTEN:="tcp://:9999"}
: ${LFS_HOST:="localhost:9999"}
: ${LFS_METADB:=""}
: ${LFS_CONTENTPATH:=content}
: ${LFS_ADMINUSER:="admin"}
: ${LFS_ADMINPASS:="admin"}
: ${LFS_CERT:=""}
: ${LFS_KEY:=""}
: ${LFS_SCHEME:="https"}

[ "$REGENERATE_SSL_CERT" = true ] && LFS_CERT=/root/ssl/server.crt; LFS_KEY=/root/ssl/server.key; bash /etc/httpd/conf/genSSLKey.sh

export LFS_LISTEN LFS_HOST LFS_CONTENTPATH LFS_ADMINUSER LFS_ADMINPASS LFS_CERT LFS_KEY LFS_SCHEME

lfs-test-server
