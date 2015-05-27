#!/usr/bin/env bash
# generates server.key, server.csr and server.crt in /etc/httpd/conf/

: ${SUBJECT:='/C=US/ST=CA/L=CITY/O=ORGANIZATION/OU=UNIT/CN=localhost'}
: ${OUT_DIR:=/root/ssl}

mkdir -p "${OUT_DIR}"

openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out "${OUT_DIR}"/server.key
chmod 600 "${OUT_DIR}"/server.key
openssl req -new -key "${OUT_DIR}"/server.key -out "${OUT_DIR}"/server.csr -subj $SUBJECT
openssl x509 -req -days 3650 -in "${OUT_DIR}"/server.csr -signkey "${OUT_DIR}"/server.key -out "${OUT_DIR}"/server.crt
