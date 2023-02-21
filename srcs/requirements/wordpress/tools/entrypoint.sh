#!/usr/bin

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	# wait for mariadb to be configured and ready to use
	while ! mariadb --host=$DB_HOST --user=$DB_USER --password=$DB_USER_PASSWORD $DB_DATABASE &> /dev/null; do
		echo "Waiting on mariadb config"
		sleep 2
	done

fi


# Have to first initilize php-fpm
/etc/init.d/php7.3-fpm start
/etc/init.d/php7.3-fpm stop

php-fpm7.3 -F

