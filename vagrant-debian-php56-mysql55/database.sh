#!/bin/bash
sudo -i

# MYSQL ===========================================================
export DEBIAN_FRONTEND=noninteractive

MYSQL_USER_ADMIN='vagrant'
MYSQL_PASSWORD='123456789'

echo "mysql-server-5.5 mysql-server/root_password password $MYSQL_PASSWORD" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password $MYSQL_PASSWORD" | debconf-set-selections

apt-get install -y mysql-server mysql-client

QUERY=<<EOF
CREATE USER '$MYSQL_USER_ADMIN'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER_ADMIN'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

mysql -u root -p$MYSQL_PASSWORD -e "$QUERY"
