#Tortuga Dev Environment

[![contributions](https://img.shields.io/badge/version_0.1-sber-brightgreen.svg?style=flat-square)](https://github.com/svishnevskii/deploy-kubernetes-nodejs-server/issues)

### Stack:
* MySQL
* Nginx
* PHP
* Redis
* Clickhouse

## Quick Start

> 1. Clone access remote repository in ./app/src/

Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
Install `sudo brew install unison` for twice sync between your local volume and the app container volume


> 1. Make volume for twice sync and build container in docker-compose.yml \
>`docker volume create --name=appcode-unison-sync` \
>`docker-compose -f docker-compose.yml -f docker-compose-dev.yml up -d`

> 2. Run your application at full speed while syncing your code for development \
> `docker-sync-stack start`
>> If have work containers and you need to rebuild one or all container after config docker-compose.yml 
`docker-compose up -d` \
>> If you want to stop any containers `docker-sync-stack stop`

> 3. Install Dependencies with Composer of your project \
> `docker exec -it app composer install`

> 4. Run Migrate of project \
> `docker exec -it app yii migrate`


### Containers before build:
* app (Nginx, PHP)
* mysql (Mysql)
* redis (Redis)
* clickhouse (Clickhouse)


### Install project dependency

docker exec -it app bash

- `docker app composer install`
- `docker app migrate`  
- `composer self-update --1`
