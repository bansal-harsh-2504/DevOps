# Docker Cheat Sheet

## 1. Installation
- Download **Docker Desktop** (GUI for managing Docker).
- **Docker Daemon** is the actual service running containers.

## 2. Basic Commands
- Check Docker version:  
  ```sh
  docker -v
  ```
- List available Docker commands:  
  ```sh
  docker
  ```
- Run an interactive Ubuntu container:  
  ```sh
  docker run -it ubuntu
  ```
  - `-it` → Interactive mode.
  - If the image isn’t available locally, it’s pulled from **Docker Hub**.
- List running containers:  
  ```sh
  docker container ls
  ```
- List **all** containers (including stopped ones):  
  ```sh
  docker container ls -a
  ```
- Start/Stop a container:  
  ```sh
  docker start <container-name>
  docker stop <container-name>
  ```
- Run a command inside a running container:  
  ```sh
  docker exec <container-name> ls
  ```
- Open an interactive shell inside a container:  
  ```sh
  docker exec -it <container-name> bash
  ```
- List locally available images:  
  ```sh
  docker images
  ```

## 3. Port Mapping
- Expose a container port to the host:  
  ```sh
  docker run -it -p <host-port>:<container-port> <image-name>
  ```
- Example: Running MailHog  
  ```sh
  docker run -it -p 1025:1025 mailhog/mailhog
  ```

## 4. Environment Variables
- Pass environment variables to a container:  
  ```sh
  docker run -it -e key=value -e key2=value <image-name>
  ```

## 5. Containerizing a Node.js App
### Dockerfile
#### Option 1: Installing Node manually on Ubuntu
```Dockerfile
FROM ubuntu

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y && apt-get install -y nodejs

COPY package.json package.json
COPY package-lock.json package-lock.json
COPY main.js main.js

RUN npm install

ENTRYPOINT [ "node", "main.js" ]
```
#### Option 2: Using the official Node.js image (better)
```Dockerfile
FROM node

COPY package.json package.json
COPY package-lock.json package-lock.json
COPY main.js main.js

RUN npm install

ENTRYPOINT [ "node", "main.js" ]
```
- **Build the image:**  
  ```sh
  docker build -t <image-name> .
  ```
- **Layer Caching Optimization:**  
  - Always copy dependencies (`package.json`) **before** application code to cache dependencies.

## 6. Publishing to Docker Hub
1. Sign in to **Docker Hub** and create a repository.
2. Authenticate in the terminal:  
   ```sh
   docker login
   ```
3. Push the image:  
   ```sh
   docker push <image-name>
   ```

## 7. Docker Compose
### docker-compose.yml Example
```yaml
version: '3.8'

services:
  postgres:
    image: postgres
    ports:
      - '5432:5432'
    environment:
      POSTGRES_USER: postgres
      POSTGRES_DB: review
      POSTGRES_PASSWORD: password

  redis:
    image: redis
    ports:
      - '6379:6379'
```
- **Start all services:**  
  ```sh
  docker compose up
  ```
- **Run in detached mode (background):**  
  ```sh
  docker compose up -d
  ```
- **Stop services:**  
  ```sh
  docker compose down
  ```

## 8. Docker Networking
- Check default **bridge network**:  
  ```sh
  docker network inspect bridge
  ```
- List available networks:  
  ```sh
  docker network ls
  ```
- Run a container with **host network**:  
  ```sh
  docker run -it --network=host <image-name>
  ```
- Disable networking in a container:  
  ```sh
  docker run -it --network=none <image-name>
  ```
- Create a **custom network**:  
  ```sh
  docker network create -d bridge my_network
  ```
- Attach containers to the custom network:  
  ```sh
  docker run -it --network=my_network <image-name>
  ```
- Containers on the same network can communicate via **container names**:  
  ```sh
  ping <container-name>
  ```
- Get container IP:  
  ```sh
  docker network inspect my_network
  ```

## 9. Docker Volumes (Persistent Data)
- **By default, container data is lost** when the container stops.  
- To persist data, use **volumes**.

### Types of Volumes
1. **Named Volume** (Managed by Docker)
   ```sh
   docker volume create my_volume
   ```
   - Attach it to a container:
     ```sh
     docker run -it -v my_volume:/app/data <image-name>
     ```
2. **Bind Mount** (Maps a host directory)
   ```sh
   docker run -it -v /host/path:/container/path <image-name>
   ```
   - Example:
     ```sh
     docker run -it -v $(pwd)/data:/app/data <image-name>
     ```
3. **Inspect volumes**  
   ```sh
   docker volume ls
   docker volume inspect my_volume
   ```
4. **Remove volumes**  
   ```sh
   docker volume rm my_volume
   ```

## 10. Multi-Stage Builds (Optimized Dockerfile)
Instead of bloating the final image with unnecessary files, use **multi-stage builds**.

### Example:
```Dockerfile
# Stage 1: Build
FROM node AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Production
FROM node
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules

ENTRYPOINT ["node", "dist/main.js"]
```
### Benefits:
- **Reduces final image size.**
- **Keeps only necessary files** in the final build.
- **Speeds up deployments**.

## Final Notes
- Always **use lightweight images** (e.g., `alpine` versions).
- **Optimize layer caching** by copying dependencies first.
- **Use Docker volumes** to persist important data.
- **Leverage multi-stage builds** to reduce final image size.

---
This refined guide improves structure, readability, and completeness while maintaining all key details. 🚀

