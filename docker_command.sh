# docker pull postgres
docker pull postgres:alpine

# docker pull mariadb
docker pull mariadb:10.6

# image and volume for postgres 
docker run --name postgres_db \
  -e POSTGRES_USER=Ritik \
  -e POSTGRES_PASSWORD=Ritik@843313 \
  -e POSTGRES_DB=testdb \
  -p 5432:5432 \
  -v postgres_data:/var/lib/postgresql/data \
  -d postgres:alpine


# 

# image for mariadb
docker run --name maria_db \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=testdb \
  -e MYSQL_USER=Ritik \
  -e MYSQL_PASSWORD=Ritik@843313 \
  -p 3306:3306 \
  -v mariadb_data:/var/lib/mysql \
  -d mariadb:10.6


# check active image 
docker ps

# check all image 
docker ps -a

# connect to db

# for postgres 
docker exec -it postgres_db psql -U Ritik -d testdb
psql -h localhost -U user -d testdb

#mariadb
docker exec -it maria_db mysql -u Ritik -p testdb
mysql -h localhost -u user -p testdb
