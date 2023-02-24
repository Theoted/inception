NAME		= inception

USER		= tdeville

COMPOSE = docker-compose -f srcs/docker-compose.yml -p $(NAME)

all:		up

re:			fclean all

up:			build
				$(COMPOSE) up --detach

down:
				$(COMPOSE) down

build:	volumes
				$(COMPOSE) build --parallel

ps:
			  $(COMPOSE) ps --all

exec-mariadb:
	docker exec -it mariadb-container bash

exec-wp:
	docker exec -it wp-container bash

exec-nginx:
	docker exec -it nginx-container bash

stop:
			  $(COMPOSE) stop
clean:
			  docker-compose --project-directory=srcs down --rmi all
fclean:
			  docker-compose --project-directory=srcs down --rmi all --volumes
			  sudo rm -rf /home/$(USER)/data/*
volumes:
			  @mkdir -p /home/$(USER)/data/wordpress
			  @mkdir -p /home/$(USER)/data/database

.PHONY: all re up down build create ps exec start restart stop clean fclean
