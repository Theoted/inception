FROM debian:buster

WORKDIR /var/www/html/

# Basic init
RUN apt-get update \
&&  apt-get upgrade \
&&  apt-get install wget -y

# Install Php
RUN apt-get install -y php7.3 php7.3-fpm \
&&  wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb

# Install WordPress
RUN wget https://wordpress.org/latest.tar.gz \
&&  tar -xzvf latest.tar.gz 

# Clean up
RUN apt-get clear
