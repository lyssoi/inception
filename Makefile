COMPOSE_FILE = ./srcs/docker-compose.yml
DATA_DIR = /home/soljeong/data

all :
	mkdir -p $(DATA_DIR)/wordpress
	mkdir -p $(DATA_DIR)/mariadb
	docker compose -f $(COMPOSE_FILE) up -d --build

down :
	docker compose -f $(COMPOSE_FILE) down

clean :
	down

fclean : 
	docker compose -f $(COMPOSE_FILE) down --volumes --rmi all
	rm -rf $(DATA_DIR)

re:
	docker compose -f $(COMPOSE_FILE) up -d --build
ps:
	docker compose -f $(COMPOSE_FILE) ps

.PHONY: all re down clean ps