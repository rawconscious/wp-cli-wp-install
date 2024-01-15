#!/bin/bash
echo "Do you want to install rsync? ( y/n ): "; read rsync_yn
if [ "$certbot_yn" == "y" ]
    then
        sudo apt-get install rsync
fi