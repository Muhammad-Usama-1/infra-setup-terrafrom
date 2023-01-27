# How to create A RDS in AWS

## Different Deployment Options

## Instance type

## Importing OPtions

## Storage types , IOPS

## Create User and Grant priviliges

You cannot use GRANT ALL for any user with an RDS.

You have to break out the Permissions to the following:

GRANT SELECT,INSERT,UPDATE,DELETE,DROP on

CREATE USER 'jeffrey'@'localhost' IDENTIFIED BY 'somepassword';
GRANT SELECT ON mydatabase.\* TO 'jeffrey'@'localhost';

mysql> GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, PROCESS, REFERENCES, INDEX, ALTER, SHOW DATABASES, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER ON _._ TO 'new_master_user'@'%' WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE, DELETE ON blog.\* TO 'vivek'@'%';

sudo apt install mysql-client
CREATE DATABASE blog
mysql -u {USER_NAME} -h {AWS_RDS_HOST_NAME} -P {MYSQL_PORT} -p

mysql -u masteruser -h mysql–instance1.134342.us-west-1.rds.amazonaws.com -P 3306 -p

CREATE USER 'vivek'@'%' IDENTIFIED BY 'my_Super_Secret_Password';

Any client/server users can connect to AWS RDS when the client hostname part set to ‘%‘. Hence, we can replace ‘%‘ with the actual EC2/Lightsail server’s IP address or VPC subnet for better security. For example:

EC2/Lightsail server IP address/client

mysql> CREATE USER 'vivek'@'172.26.9.11' IDENTIFIED BY 'password';

VPC sub/net client example for 172.26.0.0/20

mysql> CREATE USER 'vivek'@'172.26.0.0/255.255.240.0' IDENTIFIED BY 'passwd';

Data USAGE privileges includes: SELECT, INSERT, UPDATE, DELETE, and FILE
Structure privileges includes: CREATE, ALTER, INDEX, DROP, CREATE TEMPORARY TABLES, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EXECUTE, CREATE VIEW, EVENT, and TRIGGER
Administration privileges includes: GRANT, SUPER, PROCESS, RELOAD, SHUTDOWN, SHOW DATABASES, LOCK TABLES, REFERENCES, REPLICATION CLIENT, REPLICATION SLAVE, and CREATE USER
SSL privileges includes: REQUIRE NONE, REQUIRE SSL, REQUIRE X509
ALL PRIVILEGES: Shortcut to grants all privileges to a mysql user account.

Let us say you need to create a new database named ‘salesstats‘ with user named ‘sai‘ and grant all PRIVILEGES:
mysql> CREATE DATABASE salesstats;
mysql> CREATE USER 'sai'@'%' IDENTIFIED BY 'PASSWORD_HERE';
mysql> GRANT ALL PRIVILEGES ON `salesstats`.\* TO 'sai'@'%';
mysql> SHOW GRANTS for sai;
mysql> SHOW GRANTS for 'sai'@'%';

mysql -u sai -h mysql–instance1.134342.us-west-1.rds.amazonaws.com -P 3306 -p salesstats

https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL.html

wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem

mysql -h mysql–instance1.134342.us-west-1.rds.amazonaws.com \
--ssl-ca=rds-combined-ca-bundle.pem --ssl-mode=VERIFY_IDENTITY \
-u sai -P 3306 -p salesstats

REVOKE INSERT, DELETE ON 'salesstats'.\* FROM 'sai'@'%';

DROP USER 'sai'@'%';

mysql> DROP DATABASE db_name_here;
mysql> DROP DATABASE salesstats;

## Advanced : Create RDS from terrafrom, use ansible for creating user in to it, after RDS status is created
