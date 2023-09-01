# syntax=docker/dockerfile:1
# FROM nginx
FROM debian:buster

RUN apt-get update && apt-get upgrade -y 

# FOR DEBUGIN
RUN apt install -y iputils-ping vim 

# UDPATE & INSTALLATION
RUN apt-get install -y nginx openssl

# openssl run
RUN openssl req \
            -x509 \
            -nodes \
            -days 365 \
            -newkey rsa:2048 \
            -keyout /etc/ssl/private/nginx-selfsigned.key \
            -out /etc/ssl/certs/nginx-selfsigned.crt \
            -subj '/C=FR/ST=Ile-de-France/L=Paris/O=42/OU=42Paris/CN=TLIOT/UID=TTT'


COPY . /home/dluna-lo/Documents/42-Inception/srcs/requirements/nginx/tools/
# COPY config/nginx.conf /etc/nginx/http.d/default.conf

