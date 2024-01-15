#!/bin/bash
# create nginx config block
sudo touch /etc/nginx/sites-available/$project_nginx_config
sudo cat > /etc/nginx/sites-available/$project_nginx_config << EOF

server {
    listen enter_port_here;
    server_name enter_project_url_here;
    root /var/www/enter_project_name_here;

    index index.html index.htm index.php;

    location / {
        try_files \$uri \$uri/ /index.php\$is_args\$args;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php$php_version-fpm.sock;
     }

    location = /favicon.ico { log_not_found off; access_log off; }
    location = /robots.txt { log_not_found off; access_log off; allow all; }
    location ~* \.(css|gif|ico|jpeg|jpg|js|png)$ {
        expires max;
        log_not_found off;
    }

    location ~ /\.ht {
        deny all;
    }

}

EOF

sudo sed -i "s/enter_port_here/$project_port/g" /etc/nginx/sites-available/$project_nginx_config
sudo sed -i "s/enter_project_url_here/$project_url/g" /etc/nginx/sites-available/$project_nginx_config
sudo sed -i "s/enter_project_name_here/$project_name/g" /etc/nginx/sites-available/$project_nginx_config
sudo ln -s /etc/nginx/sites-available/$project_nginx_config /etc/nginx/sites-enabled

service=$(ps --no-headers -o comm 1)
if [ "$service" == "systemd" ]
then
    sudo systemctl restart nginx
else
    sudo service nginx restart
fi