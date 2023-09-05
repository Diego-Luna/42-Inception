# 42-Inception

Version 0.1

## NGNIX
- sudo groupadd docker
- sudo usermod -aG docker ${USER}
### Run 
- docker build -t my-nginx .
- docker run --name some-nginx -d -p 8080:80 my-nginx
- docker run -it mariadb
- docker stop my-nginx-container
- docker rm -f my-nginx-container


#img
- sudo docker image ls
- sudo  docker image rm 2f9a77f899ea
