##############################################################################
#######################Database setup#########################################
##############################################################################
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

# image and volume for mariadb
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


##############################################################################
#########################python venv #########################################
##############################################################################
# Creating python venv
python3 -m venv python

# activating python venv 
source python/bin/activate

# upgreating pip version 
python3 -m pip install --upgrade pip

# check out python verson
python --version

##############################################################################
######################## java setup  #########################################
##############################################################################
# java instrallition 
sudo apt update
sudo apt install -y openjdk-17-jdk

# check out java version 
jav -version 

# check out java path readlink -f $(which java)
readlink -f $(which java)

# install java 17.0.10-tem
sdk install java 17.0.10-tem

# check out java list
sdk list java

# switch to java 17 
sdk use java 17.0.10-tem

# set as defualt 
sdk default java 17.0.10-tem

# conform the directory 
echo $JAVA_HOME

##############################################################################
######################## setup python module  ################################
##############################################################################
# unistall it old pyspark are exist 
pip uninstall pyspark -y

# install it again new version 
pip install pyspark

# instralling jupyter lab
pip install jupyterlab

# instralling pandas 
pip install pandas 

# installing numpy 
pip install numpy
