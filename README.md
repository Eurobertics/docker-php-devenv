# docker-php-devenv
Local development enviroment with Docker (Apache 2.4, PHP 7.4 and PHP 7.4 CLI with extensions). This repo provides Dockerfiles for automated building with Dockerhub.

The images are based on ```php``` image from Dockerhub and featureing more extensions:
- Redis
- Memcached
- GD
- XSLT
- BZip2
- Zip
- XDebug
- and some more

The development images come with different tags:

#### ```php-devenv:74-cli```
The PHP-CLi interpreter for command line development with PHP.

#### ```php-devenv:74-apache24```
The Apache webserver with mod-php for webapplication development.

#### Notice:
The ```.env``` file contains the host directories to map to the Docker volumes.
To use these with **JetBrains PhpStorm** you may want to change the ```.env``` file paths
to ```./``` according to the following blog entries on:  
[New Docker-Compose Support in PhpStorm 2017.2](https://blog.jetbrains.com/phpstorm/2017/07/new-docker-compose-support-in-phpstorm-2017-2/)  
[Quickstart with Docker in PhpStorm](https://blog.jetbrains.com/phpstorm/2018/08/quickstart-with-docker-in-phpstorm/)

See [php-devenv on Dockerhub](https://hub.docker.com/_/php-devenv) fore more information.
