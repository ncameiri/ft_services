telegraf &

rc-service php-fpm7 start 1>/dev/null

rc-service nginx start 1>/dev/null

sleep 2

while true;
do sleep 2
done
