#!/bin/bash

if [ ! -d /var/lib/mysql/$DB_DATABASE ] ; then
    service mysql start
    sleep 3

    mysql -uroot -e "CREATE DATABASE $DB_DATABASE;"
    mysql -uroot -e "CREATE USER $DB_USER@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_USER_PASSWORD' WITH GRANT OPTION;"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD' WITH GRANT OPTION;"
    mysql -uroot -e "FLUSH PRIVILEGES;"

    mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"

    service mysql stop
fi

service mysql stop
mysqld_safe --datadir=/var/lib/mysql
