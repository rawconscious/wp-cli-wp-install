#!/bin/bash

current_dir=$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )
new_wp_lemp=$current_dir'/new_wp_lemp.sh'
echo 'running '$new_wp_lemp
source $new_wp_lemp

install_astra=$current_dir'/install_astra.sh'
echo 'running '$install_astra
source $install_astra



