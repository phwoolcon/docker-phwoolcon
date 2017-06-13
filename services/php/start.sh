#!/bin/sh

service supervisor start
service php-fpm start
cron -f
