FROM php:7.4-apache
LABEL maintainer.name="Bernd Robertz"
LABEL maintainer.email="brobertz.net@gmail.com"
LABEL version="1.0"
LABEL description="Basic PHP web development image with Apache 2.4 and PHP 7.4 with the most needed extensions and Composer with Git."
ENV DEBIAN_FRONTEND noninteractive

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

RUN apt-get update && apt-get -y install libonig-dev libcurl4-openssl-dev libsodium-dev libssl-dev libbz2-dev libzip-dev zlib1g-dev libpng-dev libxslt1-dev libmemcached-dev wget git unzip libicu-dev

RUN docker-php-ext-install zip
RUN docker-php-ext-install curl
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install gd
RUN docker-php-ext-install bz2
RUN docker-php-ext-install xsl
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install phar
RUN docker-php-ext-install simplexml
RUN docker-php-ext-install xml
RUN docker-php-ext-install sodium
RUN docker-php-ext-install intl
RUN docker-php-ext-install iconv
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install dom

RUN pecl install redis && docker-php-ext-enable redis;

RUN pecl install memcached && docker-php-ext-enable memcached

RUN pecl install xdebug; \
	docker-php-ext-enable xdebug; \
	echo xdebug.mode=debug >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.start_with_request=yes >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.discover_client_host=true >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.client_port=9003 >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.log=/tmp/php7-xdebug.log >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;
	#echo xdebug.idekey="PHPSTORM" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN mv composer.phar /usr/bin/composer
RUN php -r "unlink('composer-setup.php');"

RUN mkdir -p /opt/project

#RUN echo '<?php phpinfo(); ?>' >> /var/www/html/phpinfo.php

#VOLUME /var/www/html
