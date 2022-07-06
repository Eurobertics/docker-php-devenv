# docker-php-devenv
Local development enviroment with Docker (Apache 2.4, PHP 7.4/8.1 and PHP 7.4/8.1 CLI with extensions). This repo provides Dockerfiles for automated building with Dockerhub.

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

#### ```php-devenv:74-cli / php-devenv:81-cli```
The PHP-CLi interpreter for command line development with PHP.

#### ```php-devenv:74-apache24 / php-devenv:81-apache24```
The Apache webserver with mod-php for webapplication development.

#### Note:
All images are multiarch images for:

- linux/amd64
- linux/arm64
- linux/arm/v6
- linux/arm/v7

Capable to run on a [Raspberry PI](https://www.raspberrypi.org/).

#### Usage (with apache tag):
If you want to run a single container without `docker-compose` you have to add the
volume and port flag manually:

```
# docker run -p 80:80 -v ${PWD}:/var/www/html --name devenv eurobertics/php-devenv:<tag>
```

#### Usage (with cli tag)
The CLI docker images are intend to do a "single run". This means you can use the
image as a standalone PHP interpreter like the following command:

```
# docker run --rm -v ${PWD}:/opt/project --name devenv eurobertics/php-devenv:<tag> php /opt/project/<phpfile.php>
```

Please note the the `--rm` parameter removes the container after stopping.

#### Notice:
The ```.env``` file contains the host directories to map to the Docker volumes.
To use these with **JetBrains PhpStorm** you may want to change the ```.env``` file paths
to ```./``` according to the following blog entries on:  
[New Docker-Compose Support in PhpStorm 2017.2](https://blog.jetbrains.com/phpstorm/2017/07/new-docker-compose-support-in-phpstorm-2017-2/)  
[Quickstart with Docker in PhpStorm](https://blog.jetbrains.com/phpstorm/2018/08/quickstart-with-docker-in-phpstorm/)

See [php-devenv on Dockerhub](https://hub.docker.com/r/eurobertics/php-devenv) fore more information.
Images also available on [GitHub Packages](https://github.com/users/Eurobertics/packages/container/package/php-devenv)
