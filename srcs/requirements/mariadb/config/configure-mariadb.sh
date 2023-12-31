#!/bin/sh

echo "-> (MariaDB) Configuring MariaDB..."

if [ ! -d "/run/mysqld" ]; then
	echo "-> (MariaDB) Granting MariaDB daemon run permissions..."
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ -d "/var/lib/mysql/mysql" ]
then
	echo "-> (MariaDB) MariaDB already configured."
else
	echo "-> (MariaDB) Installing MySQL Data Directory..."
	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null


	echo "-> (MariaDB) Configuring MySQL..."
	TMP=/tmp/.tmpfile

	echo "USE mysql;" > ${TMP}
	echo "FLUSH PRIVILEGES;" >> ${TMP}
	echo "DELETE FROM mysql.user WHERE User='';" >> ${TMP}
	echo "DROP DATABASE IF EXISTS test;" >> ${TMP}
	echo "DELETE FROM mysql.db WHERE Db='test';" >> ${TMP}
	echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" >> ${TMP}
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';" >> ${TMP}
	echo "CREATE DATABASE ${WP_DB_NAME};" >> ${TMP}
	echo "CREATE USER '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASS}';" >> ${TMP}
	echo "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASS}';" >> ${TMP}
	echo "FLUSH PRIVILEGES;" >> ${TMP}

	# Alpine does not come with service or rc-service,
	/usr/bin/mysqld --user=mysql --bootstrap < ${TMP}
	rm -f ${TMP}
	echo "-> (MariaDB) MySQL configuration done."
fi

echo "-> (MariaDB) Allowing remote connections to MariaDB"
sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

echo "-> (MariaDB) Starting MariaDB daemon on port 3306."
exec /usr/bin/mysqld --user=mysql --console
