telegraf &

rc-update add nginx default && rc-update add php-fpm7 default
rc-service nginx restart 
rc-service php-fpm7 restart

sleep 3
while true;
do sleep 2
done