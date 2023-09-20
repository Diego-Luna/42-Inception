# 42-Inception

Version 0.5

## NGNIX
- sudo groupadd docker
- sudo usermod -aG docker ${USER}
### Run 
- docker build -t my-nginx .
- docker run --name some-nginx -d -p 8080:80 my-nginx
- docker run -it mariadb
- docker stop my-nginx-container


## img
- sudo docker image ls
- sudo  docker image rm 2f9a77f899ea


## docker-compose
- docker compose up // run
- docker compose down // Removed
- docker compose build // Reconstruir las imágenes de los contenedores:

## Docker
- docker logs [CONTAINER_NAME_OR_ID]
- docker rm -f my-nginx-container

## mariadb
- docker exec -it [CONTAINER_NAME_OR_ID] sh
- docker exec -it [CONTAINER_NAME_OR_ID] bash

- mysql -u [USERNAME] -p
- SHOW DATABASES;
- USE [DATABASE_NAME];
- SHOW TABLES;
- DESCRIBE [TABLE_NAME];
- EXIT;




## WordPress
1. https://dluna-lo.42.fr/wordpress/wp-login.php


## ip
- sudo nano /etc/hosts
- -	127.0.0.1       dluna-lo.42.fr


## users
- Crear un nuevo usuario:
- - sudo adduser nombre_usuario

- add user
- - sudo usermod -aG nombre_grupo nombre_usuario

- Crear un nuevo grupo:
- - sudo addgroup nombre_grupo

- Eliminar un usuario
- - sudo deluser nombre_usuario

- Eliminar un usuario y su directorio de inicio:
- - sudo deluser --remove-home nombre_usuario

- Eliminar un grupo:
- - sudo delgroup nombre_grupo

- cut -d: -f1 /etc/group


