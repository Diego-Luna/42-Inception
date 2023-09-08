#!/bin/sh

if [ -d "/var/run/mysqld/" ];
then
	echo "mysqld already, skipping creation"
else
	echo "mysqld creating...."

	mkdir -p /var/run/mysqld
	chown -R mysql:mysql /var/run/mysqld
	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql --skip-test-db
	echo "USE mysql;" >> config
	echo "FLUSH PRIVILEGES;" >> config
	echo "DELETE FROM mysql.db WHERE User='' AND Host='%';" >> config
	echo "GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" >> config
	echo "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('$MYSQL_ROOT_PASSWORD');" >> config
	echo "DROP DATABASE IF EXISTS test;" >> config
	echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;" >> config
	echo "GRANT ALL ON $WORDPRESS_DB_NAME.* to $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> config
	echo "Done transferring to config..."
	mysqld --bootstrap < config
	echo "Done configuring mysqld..."
fi

echo "Starting mysqld_safe..."
exec $@

# #!/bin/bash

# # Iniciar el servicio MySQL
# service mysql start

# # Esperar unos segundos para que el servicio se inicie correctamente
# sleep 5

# # Ejecutar comandos SQL
# mysql -e "CREATE DATABASE IF NOT EXISTS \`DATA\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`USER\`@'localhost' IDENTIFIED BY '1234';"
# mysql -e "GRANT ALL PRIVILEGES ON \`DATA\`.* TO \`USER\`@'%' IDENTIFIED BY '1234';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '5678';"
# mysql -e "FLUSH PRIVILEGES;"

# # Apagar el servidor MySQL para luego iniciarlo en modo seguro
# mysqladmin -u root -p 5678 shutdown

# # Iniciar el servidor MySQL en modo seguro
# exec mysqld_safe


# -> original

# mysql -e

# service mysql start;

# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
# exec mysqld_safe