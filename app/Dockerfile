FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y software-properties-common

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update

RUN apt-get install -y nginx php7.2-fpm php7.2-mysql curl

COPY ./hosts /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/sailx /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/static /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/dynamic /etc/nginx/sites-enabled/

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
        echo "alias composer='composer'" >> /root/.bashrc && \
        composer

CMD service php7.2-fpm start && nginx -g "daemon off;"

EXPOSE 80