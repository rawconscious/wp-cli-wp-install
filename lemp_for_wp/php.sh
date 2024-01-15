#!/bin/bash
sudo add-apt-repository ppa:ondrej/php 
echo "Enter a comma seperared list of PHP versions you want to install in the orderer of priority
( example -> 8.2,7.4 ) : "; read -r php_version
# Set the delimiter to comma (,)
IFS=',' read -ra php_version_array <<< "$php_version"
for selected_php_version in "${php_version_array[@]}"; do
    echo "instaling php version $selected_php_version and the dependecies"
    sudo apt install php$selected_php_version-fpm php$selected_php_version-mysql php$selected_php_version-curl php$selected_php_version-zip php$selected_php_version-gd php$selected_php_version-intl php$selected_php_version-mbstring php$selected_php_version-soap php$selected_php_version-xml php$selected_php_version-xmlrpc
done