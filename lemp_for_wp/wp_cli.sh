#!/bin/bash
echo "Do you want to install WP CLI? ( y/n ): "
read wpcli_yn
if [ "$wpcli_yn" == "y" ]; then

    # cd /tmp && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    # sudo chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp
    # cd ~
    cd /tmp && wget https://github.com/wp-cli/wp-cli/releases/download/v2.7.1/wp-cli-2.7.1.phar
    sudo mv wp-cli-2.7.1.phar wp-cli.phar
    sudo chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp
    cd ~
fi
