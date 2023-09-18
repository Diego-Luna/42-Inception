
# Edit login before launching !
LOGIN =		dluna-lo
DOMAIN =	${LOGIN}.42.fr
# DATA_PATH = /home/${LOGIN}/data
DATA_PATH = /Users/diegofranciscolunalopez/Documents/data-3
ENV =		LOGIN=${LOGIN} DATA_PATH=${DATA_PATH} DOMAIN=${LOGIN}.42.fr


build: up

up:
	@${ENV};
	@echo "Building containers..."
	@cd ./srcs/ && pwd && docker-compose -f docker-compose.yml up -d --build

start:
	@${ENV};
	@cd ./srcs/ && docker-compose -f docker-compose.yml start

down:
	@cd srcs/requirements/
	docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@cd srcs/requirements/
	docker volume prune -f
	sudo rm -rf ${DATA_PATH}

config:
	sudo mkdir -p ${DATA_PATH}/mariadb
	sudo mkdir -p ${DATA_PATH}/wordpress

.PHONY: build up down clean down config
