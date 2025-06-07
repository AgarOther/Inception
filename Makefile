all:
	@mkdir -p /home/scraeyme/data/mariadb
	@mkdir -p /home/scraeyme/data/nginx
	@mkdir -p /home/scraeyme/data/wordpress
	@docker compose -f srcs/docker-compose.yml up -d

stop:
	@docker compose -f srcs/docker-compose.yml down

clean: stop
	@rm -rf /home/scraeyme/data

fclean: clean
	@docker system prune -a -f

re: fclean all

.PHONY: all fclean clean re
