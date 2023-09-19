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