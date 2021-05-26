FROM ubuntu:18.04
WORKDIR /var/www/app/tortuga

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y software-properties-common

# SSH Keys if exists
ADD .ssh/id_rsa /root/.ssh/id_rsa
ADD .ssh/id_rsa.pub /root/.ssh/id_rsa.pub

RUN chmod 600 /root/.ssh/id_rsa &&\
    chmod 600 /root/.ssh/id_rsa.pub

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update && apt-get install -yq --fix-missing \
    php7.4 \
    php7.4-bcmath \
    php7.4-bz2  \
    php7.4-cli \
    php7.4-common \
    php7.4-curl \
    php7.4-fpm \
    php7.4-gd \
    php7.4-gmp \
    php7.4-imap \
    php7.4-interbase \
    php7.4-intl \
    php7.4-json \
    php7.4-ldap \
    php7.4-imagick \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-opcache \
    php7.4-pgsql \
    php7.4-phpdbg \
    php7.4-pspell \
    php7.4-readline \
    php7.4-recode \
    php7.4-snmp \
    php7.4-soap \
    php7.4-sqlite3 \
    php7.4-sybase \
    php7.4-xdebug \
    php7.4-tidy \
    php7.4-xml \
    php7.4-xmlrpc \
    php7.4-zip \
    php7.4-xsl \
    imagemagick unzip nginx curl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer --version=1.10.21 \
        --install-dir=/usr/local/bin && \
        echo "alias composer='composer'" >> /root/.bashrc

# Import containers config
COPY ./php_conf/php.ini /etc/php/7.2/fpm/php.ini
COPY ./xdebug.ini /etc/php/7.2/mods-available/xdebug.ini

COPY ./hosts/hosts /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/hosts /etc/nginx/sites-enabled/

# Set acces for static files
RUN chmod -R 777 /var/www/app/tortuga/web/assets/

CMD service php7.4-fpm start && nginx -g "daemon off;"

EXPOSE 80
