# docker-phwoolcon - Docker tooling for Phwoolcon


### Table of Contents

* [Description](#description)
* [Usage](#usage)

Description
===========

docker-compose include services below:

* nginx 1.12.0
* php 7.1.5 (with-ext: redis、phalcon、swoole、curl, json, mcrypt, openssl, PDO, PDO-mysql, mbstring ...)
* mysql 5.7
* redis 3.2.9

Usage
=====

Make sure that `docker-compose` is installed.

> start docker

```bash
docker-compose up -d
```

> stop docker

```bash
docker-compose stop
```

> bash

```bash
docker-compose exec php bash
```
