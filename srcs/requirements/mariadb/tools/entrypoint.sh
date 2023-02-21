#!/bin/bash
if [ -d /var/lib/mysql/$DB_DATABASE ] ; then 
    service mysql start
    sleep 3

    mysql -e "CREATE DATABASE $DB_DATABASE;"
    mysql -e "GRANT ALL ON $DB_DATABASE.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_USER_PASSWORD!' WITH GRANT OPTION;"
    mysql -e "FLUSH PRIVILEGES;"
fi

tail -f /dev/null