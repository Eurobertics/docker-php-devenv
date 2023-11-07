FROM php:7.4-cli
LABEL maintainer.name="Bernd Robertz"
LABEL maintainer.email="brobertz.net@gmail.com"
LABEL version="1.3"
LABEL description="Basic PHP web development image for PHP 7.4 CLI with the most needed extensions and Composer with Git."
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

RUN pecl install redis && docker-php-ext-enable redis && pecl install memcached && docker-php-ext-enable memcached

RUN pecl install xdebug; \
	docker-php-ext-enable xdebug; \
	echo xdebug.mode=develop,debug >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.start_with_request=yes >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.discover_client_host=host.docker.internal >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	#echo xdebug.client_port=9003 >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
  	echo xdebug.log=/tmp/php-xdebug.log >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;
	#echo xdebug.idekey="PHPSTORM" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
	php composer-setup.php && \
	mv composer.phar /usr/bin/composer && \
	php -r "unlink('composer-setup.php');"

RUN mkdir -p /opt/project
