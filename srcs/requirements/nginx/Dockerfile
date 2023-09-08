# syntax=docker/dockerfile:1
#FROM nginx:latest

FROM debian:buster

RUN apt-get update && apt-get upgrade -y 

# FOR DEBUGIN
RUN apt install -y vim curl

# UDPATE & INSTALLATION
RUN apt install nginx -y
RUN apt install openssl -y
RUN apt install git -y

RUN git clone https://github.com/vishnubob/wait-for-it.git /opt/wait-for-it


# openssl run
RUN mkdir -p /etc/nginx/ssl
RUN openssl req \
            -x509 \
            -nodes \
            -days 365 \
            -newkey rsa:2048 \
            -keyout /etc/nginx/ssl/inception.key \
            -out /etc/nginx/ssl/inception.crt \
            -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=dluna-lo.42.fr/UID=dluna-lo"


RUN mkdir -p /var/run/nginx

COPY config/nginx.conf /etc/nginx/nginx.conf
# COPY . /home/dluna-lo/Documents/42-Inception/srcs/requirements/nginx/tools/
#COPY config/ /usr/share/nginx/html

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]
# CMD ["/opt/wait-for-it/wait-for-it.sh", "wordpress:9000", "--", "nginx", "-g", "daemon off;"]
