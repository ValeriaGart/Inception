#!/bin/bash

service mysql start 
service mysql status 

# Create Database
echo "Creating database..."
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_NAME};"

echo "Creating user..."
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

echo "Granting privileges..."
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_NAME}.* TO '${MYSQL_USER}'@'%';"

echo "Alterin root user..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

echo "Flushing privileges..."
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

#if service mysql status > /dev/null; then
#    echo "Shutting down MariaDB service..."
#    mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
#fi

exec "$@"