#!/bin/bash
echo "installing wordpress"
echo "Enter the admin user name:"
read admin_user
echo "Enter the admin password:"
read admin_password
echo "Enter the admin email:"
read admin_email
sudo wp core install --url="$project_full_url" --title=$project_name --admin_user=$admin_user --admin_password=$admin_password --admin_email=$admin_email --allow-root
sudo chown -R www-data:www-data .
sudo chmod -R u=rwx,g=rwx,o=rx .