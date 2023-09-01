# 42-Inception

Version 0.1

## NGNIX
- sudo groupadd docker
- sudo usermod -aG docker ${USER}
### Run 
- docker build -t my-nginx .
- docker run -d -p 80:80 --name my-nginx-container my-nginx