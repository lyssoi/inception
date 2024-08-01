#!/bin/sh

openssl req -newkey rsa:4096 -days 365 -nodes -x509\
 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=soljeong/CN=soljeong" \
 -keyout /etc/nginx/ssl/server.key \
 -out /etc/nginx/ssl/server.crt

 exec nginx -g 'daemon off;'