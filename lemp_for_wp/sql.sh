#!/bin/bash
echo "Which database do you prefer? 
1. Mysql 
2. MariaDB
Please enter the id: "; read db_type

if [ "$db_type" == "1" ]
    then
        sudo apt install mysql-server mysql-client
    else 
        sudo apt install mariadb-server mariadb-client
fi

# sudo mysql_secure_installation
# echo "save mysql root password in a secure file"
echo "username for global wp sql user:"; read wp_sql_user
echo "password for global wp sql user:"; read wp_sql_pass

echo "creating a wordpress sql user"

sudo mysql --execute="CREATE USER '$wp_sql_user'@'localhost' IDENTIFIED BY '$wp_sql_pass'"