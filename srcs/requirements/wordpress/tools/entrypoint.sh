#!/usr/bin

if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then

while ! mariadb --host=$DB_HOST --user=$DB_USER --password=$DB_USER_PASSWORD -e "SHOW DATABASES" | grep $DB_DATABASE; do
		echo "Waiting on mariadb config"
		sleep 2
	done

	mkdir /var/www/html/wordpress
	cd /var/www/html/wordpress

	wp core download --allow-root

	wp config create --dbname=$DB_DATABASE --dbhost=$DB_HOST --dbuser=$DB_USER --dbpass=$DB_USER_PASSWORD --locale=ro_RO --allow-root

	wp core install --url=localhost --admin_user=$DB_USER --admin_password=$DB_USER_PASSWORD --title=inception --admin_email=$WP_ADMIN_EMAIL --allow-root

	chown -R www-data:www-data *
	chmod -R 755 *

fi

# Have to first initilize php-fpm
/etc/init.d/php7.3-fpm start
/etc/init.d/php7.3-fpm stop

php-fpm7.3 -F
