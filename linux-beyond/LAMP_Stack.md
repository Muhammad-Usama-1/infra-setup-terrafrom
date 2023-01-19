# LAMP Stack Configuration in Linux

1. LAMP stands for Linux, Apache, MySQL, and PHP.
1. It is a stack of open-source software that is commonly used to build static and dynamic websites and web applications.

<b>Linux</b>: the operating system
<b></b>

<b>Apache</b> : a web server that is used to serve web content

<b>MySQL</b> : a database management system used to store, retrieve, and manage data

<b>PHP</b> : a programming language used to build dynamic web applications

Please note that we can also user Python , Perl as P alsoe Maria DB for MySQL

<ul>
<b>Install the Apache web server:</b>
Open a terminal and update the package manager's cache by running:

```bash
sudo apt update
```

Install Apache by running:

```bash
sudo apt install apache2
```

use ufw to configure the firewall on your Ubuntu system and allow only two port 80 443

```bash
# install ufw if not already
sudo apt install ufw
# Enable
sudo ufw enable
# allow incoming to http (port 80) https(port 443)
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
#check status
sudo ufw status

```

Please note that you will also need to enable ssh if this is not your local machine

```bash
sudo ufw allow ssh
```

Test that Apache is running by visiting http://ip-address-of-machiine in a web browser. You should see a default Apache web page.

PS : Apache is installed and managed through the apache2 package on Ubuntu, rather than the httpd package, which is used on other Linux distributions such as CentOS.

<b>Install MySQL:</b>
Install MySQL by running:

```bash
sudo apt install mysql-server
```

```bash
#check status of mysql
sudo systemctl status mysql
```

use <i> mysql_secure_installation </i> that is provided with MySQL that can be used to improve the security of a MySQL installation.

To use mysql_secure_installation, you will need to log in to the MySQL server as the root user and password Then, you can run the mysql_secure_installation script and follow the prompts to disable anonymous user accounts, and remove the test database.

This can help to reduce the risk of unauthorized access to your MySQL server.

before running we need to know the password
lets create

```bash
 sudo mysql
```

```mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```

```bash
 mysql_secure_installation
```

You can now also change root password

```yaml
Securing the MySQL server deployment.

Enter password for user root:

VALIDATE PASSWORD COMPONENT can be used to test passwords
and improve security. It checks the strength of password
and allows the users to set only those passwords which are
secure enough. Would you like to setup VALIDATE PASSWORD component?

Press y|Y for Yes, any other key for No: y

There are three levels of password validation policy:

LOW    Length >= 8
MEDIUM Length >= 8, numeric, mixed case, and special characters
STRONG Length >= 8, numeric, mixed case, special characters and dictionary                  file

Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG: 0
Using existing password for root.

Estimated strength of the password: 0
Change the password for root ? ((Press y|Y for Yes, any other key for No) : y

New password:

Re-enter new password:

Estimated strength of the password: 50
Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) : y
By default, a MySQL installation has an anonymous user,
allowing anyone to log into MySQL without having to have
a user account created for them. This is intended only for
testing, and to make the installation go a bit smoother.
You should remove them before moving into a production
environment.

Remove anonymous users? (Press y|Y for Yes, any other key for No) : y
Success.


Normally, root should only be allowed to connect from
'localhost'. This ensures that someone cannot guess at
the root password from the network.

Disallow root login remotely? (Press y|Y for Yes, any other key for No) : y
Success.

By default, MySQL comes with a database named 'test' that
anyone can access. This is also intended only for testing,
and should be removed before moving into a production
environment.


Remove test database and access to it? (Press y|Y for Yes, any other key for No) : y
 - Dropping test database...
Success.

 - Removing privileges on test database...
Success.

Reloading the privilege tables will ensure that all changes
made so far will take effect immediately.

Reload privilege tables now? (Press y|Y for Yes, any other key for No) : y
Success.

All done!

```

```bash
# connect with root password
mysql -u root -p
```

```bash
# go back to using the default authentication method using this command
ALTER USER 'root'@'localhost' IDENTIFIED WITH auth_socket;
```

for creating a database and a user, follow these steps:

1. Connect to the MySQL server as the root user: mysql -u root -p
1. Create a database: CREATE DATABASE example_database;
1. Create a user and grant it privileges on the database:

```bash
# first login to mysql
mysql   -u root -p
```

```mysql
# In mysql
CREATE USER 'sammy'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE example_database;
GRANT ALL PRIVILEGES ON example_database.* TO 'sammy'@'localhost';

CREATE TABLE example_database.todo_list (
	item_id INT AUTO_INCREMENT,
	content VARCHAR(255),
	PRIMARY KEY(item_id)
);


INSERT INTO example_database.todo_list (content) VALUES ("My 1 bucket  item");

INSERT INTO example_database.todo_list (content) VALUES ("My 2 bucket  item");

INSERT INTO example_database.todo_list (content) VALUES ("My 3 bucket  item");

INSERT INTO example_database.todo_list (content) VALUES ("My 4 bucket  item");


# verify the items
SELECT * FROM example_database.todo_list;

```

<b>Install PHP:</b>
Install the PHP module for Apache by running:

```bash
sudo apt install libapache2-mod-php
```

Install additional PHP extensions by running:

```bash
 sudo apt install php-{mysql,curl,gd,intl,mbstring,soap,xml,zip}
```

but wait why there is so many extension

Here is a brief overview of each PHP extension that is installed

php-mysql: allows PHP to communicate with MySQL databases

php-curl: provides functions for making HTTP requests using the cURL library

php-gd: provides image manipulation functions, such as resizing, cropping, and converting images

php-intl: provides internationalization functions, such as localized date and time formatting

php-mbstring: provides multibyte string functions, which are useful for working with languages that use character sets other than ASCII

php-soap: provides functions for using the Simple Object Access Protocol (SOAP) to call web services

php-xml: provides functions for parsing and manipulating XML documents

php-zip: provides functions for creating, reading, and modifying zip archives

Offcourse you dont need all

<b>Configure Apache to use PHP:</b>

Enable the PHP module by running:

```bash
sudo a2enmod php
```

Restart Apache by running:

```bash
sudo systemctl restart apache2
```

<b>Test the LAMP stack: </b>

Create a PHP file by running:

```bash
sudo vim /var/www/html/info.php
```

Add the following lines to the file:

```vim

<?php
phpinfo();
?>
```

<ul>

open the browser and head over to

http://ip-address-of-machine/info.php

so far you are able to see php file serviing you to through appache webserver

you can also connect to databse from

### check databse connection;

create a file name db.php and insert the below content

```php
<?php
$user = "sammy";
$password = "password";
$database = "example_database";
$table = "todo_list";

try {
  $db = new PDO("mysql:host=localhost;dbname=$database", $user, $password);
  echo "<h2>TODO</h2><ol>";
  foreach($db->query("SELECT content FROM $table") as $row) {
    echo "<li>" . $row['content'] . "</li>";
  }
  echo "</ol>";
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
```
