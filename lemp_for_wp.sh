#!/bin/bash
echo "LEMP stack is being setup...."

current_dir=$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )

cd ~

sudo apt update

sudo apt upgrade

cd $current_dir

source $current_dir/lemp_for_wp/nginx.sh

source $current_dir/lemp_for_wp/sql.sh

source $current_dir/lemp_for_wp/php.sh

#install wp-cli
source $current_dir/lemp_for_wp/wp_cli.sh


#install rsync
source $current_dir/lemp_for_wp/rsync.sh

#install certbot
source $current_dir/lemp_for_wp/certbot.sh



