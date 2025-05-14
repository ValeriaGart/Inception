all: up
	@echo "All containers are up and running"
	@echo "You can access the WordPress site at http://localhost:8080"

up:
	mkdir /home/valeria/Code/inception_test/mariadb_data
	mkdir /home/valeria/Code/inception_test/wordpress_data
	docker compose up --build 

down:
	docker compose down -v

status : 
	docker ps

stop : 
	docker-compose -f docker-compose.yml stop

start : 
	docker-compose -f docker-compose.yml start

clean: 
	@echo "🧹 Stopping and removing containers..."
	@docker-compose -f docker-compose.yml down -v

	@echo "🗑️ Deleting MariaDB data..."
	@sudo rm -rf /home/valeria/Code/inception_test/mariadb_data*

	@echo "🗑️ Deleting WordPress data..."
	@sudo rm -rf /home/valeria/Code/inception_test/wordpress_data*

	@echo "🧹 Clean completed!"


re: clean all

dead:
	docker system prune -a --volumes

PHONY: all up down status stop start clean re dead