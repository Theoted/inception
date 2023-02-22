#!/usr/bin

# if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
# 	wait for mariadb to be configured and ready to use
# 	while ! mariadb --host=$DB_HOST --user=$DB_USER --password=$DB_USER_PASSWORD $DB_DATABASE &> /dev/null; do
# 		echo "Waiting on mariadb config"
# 		sleep 2
# 	done

# fi

sleep 10

if [ ! -d /var/www/html/wordpress/wp-config.php ]; then
	mkdir /var/www/html/wordpress
	cd /var/www/html/wordpress

	wp core download --allow-root

	wp config create --dbname=$DB_DATABASE --dbhost=$DB_HOST --dbuser=$DB_USER --dbpass=$DB_USER_PASSWORD --locale=ro_RO --allow-root

	wp core install --url=localhost --admin_user=$DB_USER --admin_password=$DB_USER_PASSWORD --allow-root

fi

# Have to first initilize php-fpm
/etc/init.d/php7.3-fpm start
/etc/init.d/php7.3-fpm stop

php-fpm7.3 -F
