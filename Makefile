all:
	@mkdir -p /home/scraeyme/data/mariadb
	@mkdir -p /home/scraeyme/data/nginx
	@mkdir -p /home/scraeyme/data/wordpress
	@docker compose -f srcs/docker-compose.yml up -d --build

up:
	@docker compose -f srcs/docker-compose.yml up -d

down:
	@docker compose -f srcs/docker-compose.yml down

restart: down up

clean:
	@docker compose -f srcs/docker-compose.yml down -v --remove-orphans
	@rm -rf /home/scraeyme/data

fclean: clean
	@docker system prune -af --volumes

re: fclean all

reclean: clean all

.PHONY: all fclean clean re
