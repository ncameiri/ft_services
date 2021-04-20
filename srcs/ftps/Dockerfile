FROM alpine:3.11
RUN		apk update && apk add vsftpd openssl && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache 
RUN apk add --no-cache vsftpd vim openrc openssl

COPY vsftpd.conf /etc/
COPY index.html /var/www/
COPY start.sh .

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ftps-selfsigned-rsa.key -out /etc/ssl/certs/ftps-selfsigned-rsa.crt -subj "/C=LS/L=Portugal/O=42Lisbo/CN=proj_ft_services"

RUN		echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
	&&	apk add telegraf \
	&&	mkdir	/etc/telegraf \
	&&	mv /etc/telegraf.conf /etc/telegraf/telegraf.conf \
	&&	sed -i 's|.*  hostname = "".*|  hostname = "ftps"|' /etc/telegraf/telegraf.conf \
	&&	sed -i 's|.*  # urls = \["http://127.0.0.1:8086"\].*|  urls = \["http://influxdb:8086"\]|' /etc/telegraf/telegraf.conf \
	&&	sed -i 's|^  # database = "telegraf"|  database = "influxdb"|' /etc/telegraf/telegraf.conf

RUN chmod +x start.sh
CMD ./start.sh
