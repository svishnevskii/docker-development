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

### 1. Clone this dev environment
Clone this dev environment repository into your local path <br>
```git clone https://github.com/svishnevskii/docker-development```<br>
and after switch branch on ```git checkout master/rsync-sync```


### 2. Download project
Clone remote repository of project to `./app/src/` folder <br><br>
Rename default folder <br>
`mv docker-development sber` <br><br>
Switch to there </br>
`cd sber/app/src/` <br><br>
Clone a private project <br>
`git clone tortuga` <br><br>

### 2. Make volume for twice sync and build container in docker-compose.yml
`docker volume create --name=appcode-unison-sync` <br>
`docker-compose -f docker-compose.yml -f docker-compose-dev.yml up -d`

### 3. Run your application at full speed while syncing your code for development \
`docker-sync-stack start` <br><br>

If have work containers and you need to rebuild one or all container after config docker-compose.yml
`docker-compose up -d` 
<br>
If you want to stop any containers `docker-sync-stack stop` or `docker-sync-stack clean`

### 4. Install Dependencies with Composer of your project
`docker exec -it app composer install`

### 5. Run Migrate of project
`docker exec -it app yii migrate`

### There containers after build:
* app (Nginx, PHP)
* mysql (Mysql)
* redis (Redis)
* clickhouse (Clickhouse)

## Bug Reports and Improvements
If you experience any bugs or see anything that can be improved or added, please feel free to [open an issue](https://github.com/svishnevskii/todo/issues) here or simply contact me through any of the methods below. Thanks in advance!
