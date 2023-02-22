#!/bin/bash

# Pull the latest changes from the remote repository
sudo -u www-data git pull origin develop

# Check if there are any changes in the composer.json file
if [ "$(sudo -u www-data git diff HEAD^..HEAD -- composer.json)" ]; then
  # If changes are detected, run composer install
  
  # Set the COMPOSER_ALLOW_SUPERUSER environment variable
  export COMPOSER_ALLOW_SUPERUSER=1
  # Move to Application directory
  cd /var/www/html/practiCal-web-Kentico/PractiCal
  # Run composer install to update dependencies
  echo "Installing Dependencies..."
  composer install
  echo "Restarting Apache...."
  # Restart Apache
  sudo systemctl restart apache2

  # Ask the user if they want to run php artisan migrate
  read -p "Do you want to run php artisan migrate (y/n)? " choice
  case "$choice" in
    y|Y ) sudo -u www-data php artisan migrate;;
    n|N ) echo "Skipping php artisan migrate";;
    * ) echo "Invalid input, skipping php artisan migrate";;
  esac
else
  # If no changes are detected, print a message
  echo "No changes detected in composer.json, skipping composer install"
  echo "Restarting Apache...."
  sudo systemctl restart apache2
fi
