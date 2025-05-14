#!/bin/bash

 mysql_install_db 

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_NAME ;" > init.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> init.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '$MYSQL_USER'@'%' ;" >> init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

cp ./init.sql /etc/mysql/init.sql

exec mysqld