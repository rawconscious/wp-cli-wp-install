#!/bin/bash

# create wp config

# if [[ -v wp_db_user_name ]]
# then
#     echo "database username fetched from defaults"
# else
#     echo "enter the database username: "; read wp_db_user_name;
# fi

cp wp-config-sample.php wp-config.php
# set database details with perl find and replace
sudo sed -i "s/database_name_here/$project_name/g" wp-config.php
sudo sed -i "s/username_here/$wp_db_user_name/g" wp-config.php
sudo sed -i "s/password_here/$wp_db_user_pass/g" wp-config.php
sudo sed -i "s/localhost/$wp_db_host/g" wp-config.php