# wait for mariadb to be ready
sleep 10

# create wordpress database
wp config create	--allow-root \
											--dbname=$SQL_DATABASE \
											--dbuser=$SQL_USER \
											--dbpass=$SQL_PASSWORD \
											--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install
wp user create