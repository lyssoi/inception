#!/bin/sh
if [ ! -d "/var/lib/mysql/$MARIADB_DB" ]; then
  mysql_install_db --datadir=/var/lib/mysql --user=mysql
  service mariadb start
  sleep 5

mysql -u root <<EOF
create database $MARIADB_DB;
create user '$MARIADB_ID'@'%' identified by '$MARIADB_PW';
grant all privileges on $MARIADB_DB.* to '$MARIADB_ID'@'%';
flush privileges;
EOF

mysqladmin -u root --password=${MARIADB_PW} shutdown;

else
	echo "Database is already created"
fi
mkdir -p /run/mysqld
chown -R mysql:root /run/mysqld/
touch /run/mysqld/mysqld.sock

exec mysqld --datadir=/var/lib/mysql