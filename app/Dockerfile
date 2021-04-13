FROM ubuntu:18.04
WORKDIR /var/www/app/tortuga

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y software-properties-common

RUN apt-get install -y vim nginx curl

# SSH Keys
ADD .ssh/id_rsa /root/.ssh/id_rsa
ADD .ssh/id_rsa.pub /root/.ssh/id_rsa.pub

RUN chmod 600 /root/.ssh/id_rsa &&\
    chmod 600 /root/.ssh/id_rsa.pub

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update

RUN apt-get update && apt-get install -yq --fix-missing \
    php7.2 \
    php7.2-bcmath \
    php7.2-bz2  \
    php7.2-cli \
    php7.2-common \
    php7.2-curl \
    php7.2-fpm \
    php7.2-gd \
    php7.2-gmp \
    php7.2-imap \
    php7.2-interbase \
    php7.2-intl \
    php7.2-json \
    php7.2-ldap \
    php7.2-imagick \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-opcache \
    php7.2-pgsql \
    php7.2-phpdbg \
    php7.2-pspell \
    php7.2-readline \
    php7.2-recode \
    php7.2-snmp \
    php7.2-soap \
    php7.2-sqlite3 \
    php7.2-sybase \
    php7.2-xdebug \
    php7.2-tidy \
    php7.2-xml \
    php7.2-xmlrpc \
    php7.2-zip \
    php7.2-xsl \
    imagemagick


COPY ./hosts/hosts /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/hosts /etc/nginx/sites-enabled/

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer --version=1.10.21 \
        --install-dir=/usr/local/bin && \
        echo "alias composer='composer'" >> /root/.bashrc

CMD service php7.2-fpm start && nginx -g "daemon off;"

COPY ./php_conf/php.ini /etc/php/7.2/fpm/php.ini

COPY ./xdebug.ini /etc/php/7.2/mods-available/xdebug.ini
RUN service php7.2-fpm restart

EXPOSE 80
