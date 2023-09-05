mysql -e

service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS \`DATA\`;"
mysql -e "CREATE USER IF NOT EXISTS \`USER\`@'localhost' IDENTIFIED BY '1234';"
mysql -e "GRANT ALL PRIVILEGES ON \`DATA\`.* TO \`USER\`@'%' IDENTIFIED BY '1234';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '5678';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p 5678 shutdown
exec mysqld_safe

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