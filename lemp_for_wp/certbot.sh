#!/bin/bash
echo "Do you want to install certbot? ( y/n ): "; read certbot_yn
if [ "$certbot_yn" == "y" ]
    then
        sudo apt install certbot python3-certbot-nginx
fi