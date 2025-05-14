#!/bin/bash
cd /var/www/html || exit
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
if [ ! -f wp-load.php ]; then
	./wp-cli.phar core download --allow-root
fi

if [ ! -f wp-config.php ]; then
./wp-cli.phar config create --dbname="$MYSQL_NAME" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost="$MYSQL_HOSTNAME" --allow-root
fi

if ! ./wp-cli.phar core is-installed --allow-root; then
	./wp-cli.phar core install --url="$DOMAIN_NAME" --title="Inception" --admin_user="$MYSQL_USER" --admin_password="$MYSQL_ROOT_PASSWORD" --admin_email="$MYSQL_ROOT_EMAIL" --allow-root

	./wp-cli.phar user create "$MYSQL_USER_TWO" "$MYSQL_USER_TWO_MAIL" --user_pass="$MYSQL_PASSWORD_TWO" --role=subscriber --allow-root

fi

exec php-fpm8.2 -F
