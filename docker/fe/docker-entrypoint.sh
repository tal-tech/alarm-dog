#!/bin/bash

cd /opt/www

yarn config set registry https://registry.npm.taobao.org
[ ! -d node_modules ] && yarn install
[ ! -d dist ] && yarn build && ln -s /opt/www/dist /opt/www/dist/admin

#sed -i 's#/var/www#/opt/www/dist#' /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
