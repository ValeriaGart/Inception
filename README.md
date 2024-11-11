# Inception

Inception is a Docker-based project that sets up a full web stack with Nginx, MariaDB, and WordPress. Using Dockerfiles and Docker Compose, this project creates isolated, containerized environments for each service, providing an easy-to-use, portable development environment.

## Project Overview

This project consists of three main Docker containers:

- **Nginx**: A web server that serves static content and acts as a reverse proxy to forward requests to the WordPress container.
- **MariaDB**: A relational database that stores WordPress content and data.
- **WordPress**: A popular content management system, used to create and manage websites easily.

## Prerequisites

- **Docker**: Ensure Docker is installed on your system. Follow [Docker’s official installation guide](https://docs.docker.com/get-docker/) if needed.
- **Docker Compose**: Docker Compose should also be installed. Installation instructions can be found [here](https://docs.docker.com/compose/install/).

## Project Structure

The repository contains the following key files and directories:

- **nginx/**: Contains the Dockerfile and configuration for the Nginx server.
- **mariadb/**: Contains the Dockerfile and configuration for MariaDB.
- **wordpress/**: Contains the Dockerfile and configuration for WordPress.
- **docker-compose.yml**: The Docker Compose file that defines the services and binds them together.

## Setup and Usage

1. **Clone the Repository**  
   ```bash
   git clone git@github.com:ValeriaGart/Inception.git 
   cd inception
2. **Build the Docker Images**
   ```bash
   docker-compose build
3. **Start the Containers**
   ```bash
   docker-compose up -d
4. **Access the Application**
   - Visit http://localhost in your browser to access the WordPress site.
   - You should see the WordPress setup page if it's your first time running the containers.
5. **Stop the Containers**
   ```bash
   docker-compose down
