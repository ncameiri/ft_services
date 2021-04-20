telegraf & /etc/init.d/mariadb setup
rc-service mariadb start

rc-update add mariadb default


mysql -u root -e "create user '${MYSQL_ROOT_USERNAME}'@'%' identified by '${MYSQL_ROOT_PASSWORD}'"
mysql -u root -e "CREATE DATABASE wordpress"
mysql -u root < /tmp/wordpress.sql
mysql -u root -e "GRANT ALL ON *.* to '${MYSQL_ROOT_USERNAME}'@'%'"
mysql -u root -e "FLUSH PRIVILEGES"
mysql -u root -e "exit"

sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf

rc-service mariadb restart

sleep 3
while true;
do sleep 2
done