# Deploy Laravel Application in EC2 instance

Steps :

1. Launch a instance eg (t3.medium)
1. Create a RDS with your choice deployment options
1. create a new user in DB, give priviliges for laravel app
1. Setup appache , php , require php extension
1. setup laravel, with RDS mysql connection
1. Copy db file , incase developers have.

# Create A RDS MySQL

sudo apt install mysql-client

## Connecting to DB

mysql -u admin -h host.io -p

## Create a DB

CREATE DATABASE katra;

## Create a User

CREATE USER 'db_user'@'%' IDENTIFIED BY 'password';

## Grant Priviliges to db_user (Least priviliges require for Laravel Application)

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, ALTER, INDEX ON katra.\* TO 'db_user'@'%';

FLUSH PRIVILEGES;

## Importing (we will see importing in case developer have some data in their machine)

we are importing file.sql from our machine to sql database name katra
sudo mysql -h host.io -u db_user -p katra <file.sql

mysqldump -u [username] -p [database name] > [file name].sql

## What All permission will look like

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, PROCESS, REFERENCES, INDEX, ALTER, SHOW DATABASES, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER ON _._ TO `db_user`@`%` WITH GRANT OPTION

# Prepare our EC2 for Application

Launch an ec2 instance

## Installing php 7

sudo apt-get update
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt -y install php7.4
php -v

## it will require , for composer install command etc

sudo apt-get install -y php7.4-cli php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath

<!-- apt-get install php-zip -->

### Installing Appache

sudo apt install apache2

##

Installing composer for laravel project creation or installing dependencies for existing application

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

sudo chmod +x /usr/local/bin/composer

## Create a project

cd /var/www/html

<!-- Clone the project here -->
<!-- Asuuming this application have some required DB records which must be imported to RDS -->

git clone projecturl

compser install

verify with php artisian
php artisan serve --host=0.0.0.0

composer create-project --prefer-dist laravel/laravel [project_name]

## Serving through Appache

sudo chown -R www-data:www-data /var/www/html/katra/
sudo chmod -R 775 /var/www/html/katra/storage/

sudo vim l/etc/apache2/sites-available/katra.conf

```yaml
VirtualHost *:80>
ServerName 192.168.0.164
ServerAdmin admin@example.com
DocumentRoot  /var/www/html/katra/public
<Directory /var/www/html/katra>
AllowOverride All
</Directory>
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

After that, disable the default configuration file of the virtual hosts in Apache with this command:

sudo a2dissite 000-default.conf

<!-- enable the new virtual hos -->

sudo a2ensite katra.conf

<!-- Enable the Apache rewrite module, and : -->

sudo a2enmod rewrite

<!-- finally, restart the Apache service -->

sudo systemctl restart apache2

# How to get update ?

git pull, composer install (not sure weather we should or not) , restart appache2
