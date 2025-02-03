FROM php:7.4-apache
LABEL maintainer.name="Bernd Robertz"
LABEL maintainer.email="brobertz.net@gmail.com"
LABEL version="1.4"
LABEL description="Basic PHP web development image with Apache 2.4 and PHP 7.4 with the most needed extensions and Composer with Git."
ENV DEBIAN_FRONTEND noninteractive

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

RUN apt-get update && \
	apt-get -y install libonig-dev libcurl4-openssl-dev libsodium-dev libssl-dev libbz2-dev libzip-dev zlib1g-dev libpng-dev libxslt1-dev libmemcached-dev wget git unzip libicu-dev && \
	rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install zip && \
	docker-php-ext-install curl && \
	docker-php-ext-install mysqli && \
	docker-php-ext-install mbstring && \
	docker-php-ext-install gd && \
	docker-php-ext-install bz2 && \
	docker-php-ext-install xsl && \
	docker-php-ext-install pdo && \
	docker-php-ext-install pdo_mysql && \
	docker-php-ext-install phar && \
	docker-php-ext-install simplexml && \
	docker-php-ext-install xml && \
	docker-php-ext-install sodium && \
	docker-php-ext-install intl && \
	docker-php-ext-install iconv && \
	docker-php-ext-install fileinfo && \
	docker-php-ext-install dom

RUN docker-php-ext-configure pcntl --enable-pcntl && docker-php-ext-install pcntl

RUN pecl install redis && docker-php-ext-enable redis && pecl install memcached && docker-php-ext-enable memcached

RUN pecl install xdebug; \
	docker-php-ext-enable xdebug; \
	echo xdebug.mode=debug >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.start_with_request=yes >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.client_host=host.docker.internal >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	#echo xdebug.client_port=9003 >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.log=/tmp/php-xdebug.log >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;
	#echo xdebug.idekey="PHPSTORM" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;

#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
#	php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
#	php composer-setup.php && \
#	mv composer.phar /usr/bin/composer && \
#	php -r "unlink('composer-setup.php');"

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#RUN echo '<?php phpinfo(); ?>' >> /var/www/html/phpinfo.php

#VOLUME /var/www/html
