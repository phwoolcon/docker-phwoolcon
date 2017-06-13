FROM php:7.1.5-fpm

COPY ./sources.list /etc/apt/sources.list
RUN apt-get update

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

RUN apt-get install  -y --force-yes vim git wget

# add php sources
RUN apt-get install apt-transport-https lsb-release --force-yes -y && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg --no-check-certificate && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

# add phalcon source
RUN curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | bash

RUN apt-get install php7.1-phalcon php7.1-mcrypt php7.1-mysql php-redis php7.1-xml php7.1-zip --force-yes -y

RUN pecl install swoole && \
    echo "extension=swoole.so" > /usr/local/etc/php/conf.d/swoole.ini

COPY ./.bashrc /root/.bashrc

# install supervisor
RUN apt-get install --force-yes -y supervisor
COPY ./supervisor/ /etc/supervisor/conf.d/
RUN service supervisor start

# configure cron
RUN apt-get install --force-yes -y cron
COPY ./cron/*.cron /cron.d/
WORKDIR /cron.d
RUN find *.cron -type f -exec cat {} \;>>/etc/crontab

WORKDIR /home/wwwroot
