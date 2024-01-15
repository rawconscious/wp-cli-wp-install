#!/bin/bash

# creare database and grant access
# if [[ -v wp_db_user_name ]]
# then
#     echo "database username fetched from defaults"
# else
#     echo "enter the database username: "; read wp_db_user_name;
# fi
echo "creating database for wordpress"
if [ "$is_db_host_remote" == "y" ]
then
    sudo mysql -u $wp_db_user_name -h $wp_db_host -p$wp_db_user_pass --execute="CREATE DATABASE $project_name DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
    sudo mysql -u $wp_db_user_name -h $wp_db_host -p$wp_db_user_pass --execute="GRANT ALL ON $project_name.* TO '$wp_db_user_name'@'$wp_db_host';"
else    
    sudo mysql --execute="CREATE DATABASE $project_name DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
    sudo mysql --execute="GRANT ALL ON $project_name.* TO '$wp_db_user_name'@'localhost';"
fi