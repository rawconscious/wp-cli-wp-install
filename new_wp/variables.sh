#!/bin/bash
echo "Enter the project name:"
read project_name
echo "creating a project directory for $project_name"
sudo mkdir /var/www/$project_name
echo "moving to project directory"
cd /var/www/$project_name
echo "downloading wordpress using wp-cli"
sudo wp core download --allow-root
echo "setting up wordpress"
# include defaults
[[ -f /var/www/wordpress_defaults.sh ]] && . /var/www/wordpress_defaults.sh

if [[ -v wp_db_user_name ]]
then
    echo "database username fetched from defaults"
else
    echo "enter the database username: "; read wp_db_user_name;
fi

if [[ -v wp_db_user_pass ]]
then
    echo "database userpassword fetched from defaults"
else
    echo "enter the database password: "; read wp_db_user_pass;
fi

if [[ -v wp_db_host ]]
then
    echo "database host fetched from defaults"
else
    echo "are you using a remote server as a database host? ( y/n )"; read is_db_host_remote;
    if [ "$is_db_host_remote" == "y" ]
    then
        echo "enter the database host ip: "; read wp_db_host;
    else
        wp_db_host=localhost
    fi
fi

if [[ -v php_version ]]
then
    echo "php version fetched from defaults"
else
    echo "enter php version: "; read php_version;
fi

echo "Enter the site url (example.com):"
read project_url
if [ "$project_url" == "localhost" ]
then
    echo "Enter the project port:"
    read project_port
    project_nginx_config="port-"$project_port"-"$project_name
    project_full_url=$project_url:$project_port
else
    project_port=80
    project_nginx_config=$project_name
    project_full_url=$project_url
fi