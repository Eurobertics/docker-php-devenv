FROM php:7.4-cli
LABEL maintainer.name="Bernd Robertz"
LABEL maintainer.email="brobertz.net@gmail.com"
LABEL version="1.0"
LABEL description="Basic PHP web development image for PHP 7.4 CLI with the most needed extensions and Composer with Git."
ENV DEBIAN_FRONTEND noninteractive

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

RUN apt-get update && apt-get -y install libonig-dev libcurl4-openssl-dev libbz2-dev libzip-dev zlib1g-dev libpng-dev libxslt1-dev libmemcached-dev wget git unzip

RUN docker-php-ext-install mysqli mbstring gd bz2 xsl curl zip

RUN pecl install redis && docker-php-ext-enable redis;

RUN pecl install memcached && docker-php-ext-enable memcached

RUN pecl install xdebug; \
	docker-php-ext-enable xdebug; \
	echo xdebug.remote_enable=1 >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.remote_autostart=0 >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.remote_connect_back=1 >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.remote_port=9000 >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.remote_log=/tmp/php7-xdebug.log >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;
	#echo xdebug.idekey="PHPSTORM" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN mv composer.phar /usr/bin/composer
RUN php -r "unlink('composer-setup.php');"

RUN mkdir -p /opt/project
