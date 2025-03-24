## Manual Installation
- Install node locally
- Clone the repo
- Install dependencies (npm install)
- Start the DB locally
    - docker run -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
- Change the .env file and update your DB credentials
- npx prisma migrate
- npx prisma generate
- npm run build 
- npm run start

## Docker Installation
- Install Docker
- Start postgres
    - docker run -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
- Build the image - `docker build -t user-project`

## Docker Compose Installation Steps
- Install docker, docker-compose
- Run `docker-compose up`
