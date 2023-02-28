FROM debian:buster

WORKDIR /var/www/html/

# Basic init
RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install wget -y \
&&  apt-get install -y curl

# Install Php
RUN apt-get install php php-mysql php-fpm php-curl php-gd php-intl php-mbstring \
    php-soap php-xml php-xmlrpc php-zip -y 

# Install WP cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar \
&&  mv wp-cli.phar /usr/local/bin/wp

RUN apt-get install -y mariadb-client

COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/entrypoint.sh ./
RUN chmod 777 ./entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["sh", "./entrypoint.sh"]
