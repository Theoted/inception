#!/bin/bash

if [ ! -d /var/lib/mysql/$DB_DATABASE ] ; then
    service mysql start
    sleep 3

    mysql -e "CREATE DATABASE $DB_DATABASE;"
    mysql -e "CREATE USER $DB_USER@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
    mysql -e "GRANT ALL ON $DB_DATABASE.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_USER_PASSWORD' WITH GRANT OPTION;"
    mysql -e "FLUSH PRIVILEGES;"

    service mysql stop
fi

service mysql stop
mysqld_safe --datadir=/var/lib/mysql
