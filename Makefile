LOGIN =		dluna-lo
# DATA_PATH = /home/${LOGIN}/data
DATA_PATH = /Users/diegofranciscolunalopez/Documents/data


build: up

all: config up start

up:
	@echo "Building containers..."
	@cd ./srcs/ && pwd && docker-compose -f docker-compose.yml up -d --build

start:
	@cd ./srcs/ && docker-compose -f docker-compose.yml start

stop:
	@cd ./srcs/ && docker-compose -f docker-compose.yml stop

down:
	@cd srcs/requirements/
	docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@cd srcs/requirements/
	docker volume prune -f
	sudo rm -rf ${DATA_PATH}

config:
	sudo mkdir -p ${DATA_PATH}
	sudo mkdir -p ${DATA_PATH}/mariadb-data
	sudo mkdir -p ${DATA_PATH}/wordpress-data
	sudo chown -R ${USER}: ${DATA_PATH}

fclean: clean
	docker system prune -f -a --volumes
	docker volume rm srcs_mariadb-data srcs_wordpress-data


container:
	docker ps -a

img:
	docker images

.PHONY: build up down clean down config
