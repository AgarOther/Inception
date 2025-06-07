#!/bin/bash

set -eu

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_ADMIN_NAME --dbpass=$DB_ADMIN_PASSWORD --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=$DOMAIN_NAME --title=inception --admin_user=$WP_ADMIN_NAME \
	--admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --allow-root
./wp-cli.phar user create $WP_USER_NAME $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
./wp-cli.phar user set-role 2 editor --allow-root
./wp-cli.phar theme install blogair --activate --allow-root

exec "$@"
