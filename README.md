# Tortuga

[![contributions](https://img.shields.io/badge/environment-dev-brightgreen.svg?style=flat-square)](https://github.com/svishnevskii/deploy-kubernetes-nodejs-server/issues)

## Stack:
* MySQL
* Nginx
* PHP
* Redis
* Clickhouse


## Quick Start

Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
Install `sudo brew install unison` for twice sync between your local volume and the app container volume

> 1. Clone remote repository to `./app/src/` folder

> 2. Make volume for twice sync and build container in docker-compose.yml \
>`docker volume create --name=appcode-unison-sync` \
>`docker-compose -f docker-compose.yml -f docker-compose-dev.yml up -d`

> 3. Run your application at full speed while syncing your code for development \
> `docker-sync-stack start`
>> If have work containers and you need to rebuild one or all container after config docker-compose.yml 
`docker-compose up -d` \
>> If you want to stop any containers `docker-sync-stack stop`

> 4. Install Dependencies with Composer of your project \
> `docker exec -it app composer install`

> 5. Run Migrate of project \
> `docker exec -it app yii migrate`


### Containers after build:
* app (Nginx, PHP)
* mysql (Mysql)
* redis (Redis)
* clickhouse (Clickhouse)


## Bug Reports and Improvements
If you experience any bugs or see anything that can be improved or added, please feel free to [open an issue](https://github.com/svishnevskii/todo/issues) here or simply contact me through any of the methods below. Thanks in advance!


