FROM debian:buster

WORKDIR /var/www/html/

RUN apt-get update \
&& apt-get install -y php-fpm \
&& apt-get install wget \
&& wget https://wordpress.org/latest.tar.gz \
&& tar -xzvf latest.tar.gz \
&& apt-get clear
