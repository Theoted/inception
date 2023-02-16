FROM debian:buster

# Basic init
RUN apt-get update \
&&  apt-get upgrade

# Install MariaDB
RUN apt-get install mariadb-server -y \
&&  mysql_secure_installation -y
