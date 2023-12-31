FROM	alpine:3.18

# NGINX
RUN		apk update && apk upgrade

RUN	 apk add nginx

RUN	mkdir -p /var/www/html/

# COPY	./config/nginx.conf /etc/nginx/nginx.conf
COPY	./config/default.conf /etc/nginx/http.d/default.conf

# OPENSSL
RUN		apk add openssl &&\
		openssl req -x509 -nodes -days 365 -newkey rsa:2048\
			-keyout /etc/ssl/private/nginx-selfsigned.key\
			-out /etc/ssl/certs/nginx-selfsigned.crt\
			-subj "/C=FR/ST=IDF/L=Paris/O=42Network/OU=42Paris/CN=dluna-lo.42.fr"


RUN		adduser -D -g 'www' www &&\
		chown -R www:www /run/nginx/ &&\
		chown -R www:www /var/www/html/

EXPOSE	443/tcp

# Run nginx with daemon off, i.e. in the foreground since one container only
# has one service. This is best practice for Docker containers and/or debugging.
ENTRYPOINT	["nginx"]
CMD			["-g", "daemon off;"]
