#!/bin/sh
WP_PATH=/var/www/html/wordpress

echo "-> (WP) Start WordPress..."

echo "-> (WP) Check MariaDB..."
while ! mariadb -h${DB_HOST} -u${WP_DB_USER} -p${WP_DB_PASS} ${WP_DB_NAME} &>/dev/null;
do
    sleep 3
done
echo "-> (WP) MariaDB accessible."


if [ -f ${WP_PATH}/wp-config.php ]
then
	echo "-> (WP) WordPress already configured."
else
	echo "-> (WP) Setting up WordPress..."
	echo "-> (WP) Updating WP-CLI..."
	wp-cli.phar cli update --yes --allow-root
	echo "-> (WP) Downloading WordPress..."
	wp-cli.phar core download --allow-root
	echo "-> (WP) Creating wp-config.php..."
	wp-cli.phar config create --dbname=${WP_DB_NAME} --dbuser=${WP_DB_USER} --dbpass=${WP_DB_PASS} --dbhost=${DB_HOST} --path=${WP_PATH} --allow-root
	echo "-> (WP) Installing WordPress core..."
	wp-cli.phar core install --url=${NGINX_HOST}/wordpress --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --path=${WP_PATH} --allow-root
	echo "-> (WP) Creating WordPress default user..."
	wp-cli.phar user create $WP_USER ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS} --role=subscriber --display_name=${WP_USER} --porcelain --path=${WP_PATH} --allow-root
	echo "-> (WP) Installing WordPress theme..."
	wp-cli.phar theme install hestia --path=${WP_PATH} --activate --allow-root
	wp-cli.phar theme status hestia --allow-root
fi

echo "-> (WP) Starting WordPress fastCGI on port 9000."
echo "--> (WP) WordPress is ready."
exec /usr/sbin/php-fpm81 -F -R
