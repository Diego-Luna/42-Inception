# run containers?

run:

clean:

all:

re:

build-db:
	@cd srcs/requirements/mariadb
	@docker build -t my-mariadb .

build-nginx:
	@cd srcs/requirements/nginx
	@docker build -t my-nginx .

build-wordpress:
	@cd srcs/requirements/wordpress
	@docker build -t my-wordpress .

run-db:
	@cd srcs/requirements/mariadb
	@docker run -it my-mariadb .

run-nginx:
	@cd srcs/requirements/nginx
	@docker run --name some-nginx -d -p 8080:80 my-nginx

run-wordpress:
	@cd srcs/requirements/wordpress
	@docker run -it my-wordpress .

	all: build up

build:
	@cd srcs/requirements/
	docker-compose build

up:
	@cd srcs/requirements/
	docker-compose up -d

down:
	@cd srcs/requirements/
	docker-compose down

clean: down
	@cd srcs/requirements/
	docker volume prune -f

.PHONY: all build up down clean
