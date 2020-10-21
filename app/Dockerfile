FROM ubuntu:18.04
WORKDIR /var/www/app/

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y software-properties-common

RUN apt-get install -y git
RUN git config --global user.email "vsa@tatmedia.com"
RUN git config --global user.name "Vishnevskii"

# SSH Keys
ADD .ssh/id_rsa /root/.ssh/id_rsa
ADD .ssh/id_rsa.pub /root/.ssh/id_rsa.pub

RUN chmod 600 /root/.ssh/id_rsa &&\
    chmod 600 /root/.ssh/id_rsa.pub

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update


RUN apt-get install -y nginx php7.4 php7.4-fpm php7.4-intl php7.4-cli php7.4-common php7.4-gd php7.4-zip php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-zip php7.4-xml php7.4-tidy php7.4-imagick php7.4-curl curl

COPY ./hosts/hosts /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/hosts /etc/nginx/sites-enabled/

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
        echo "alias composer='composer'" >> /root/.bashrc && \
        composer

CMD service php7.4-fpm start && nginx -g "daemon off;"

COPY ./php_conf/php.ini /etc/php/7.4/fpm/php.ini
RUN service php7.4-fpm restart

EXPOSE 80
