all: up

up:
	mkdir -p /home/valeria/Code/inception_test/mariadb_data
	mkdir -p /home/valeria/Code/inception_test/wordpress_data
	cd srcs && \
	docker-compose up --build -d
	@echo "🟢 Containers are up and running!"

down:
	cd srcs && docker compose down -v

status : 
	docker ps

stop : 
	cd srcs && docker-compose stop

start : 
	cd srcs && docker-compose start

clean: 
	@echo "🧹 Stopping and removing containers..."
	@cd srcs && docker compose down -v

	@echo "🗑️ Deleting MariaDB data..."
	@sudo rm -rf /home/valeria/Code/inception_test/mariadb_data*

	@echo "🗑️ Deleting WordPress data..."
	@sudo rm -rf /home/valeria/Code/inception_test/wordpress_data*

	@echo "🧹 Clean completed!"


re: clean all


PHONY: all up down status stop start clean re