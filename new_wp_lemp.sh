#!/bin/bash
current_dir=$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )

source $current_dir/new_wp/variables.sh
source $current_dir/new_wp/wp_config.sh
source $current_dir/new_wp/database.sh
source $current_dir/new_wp/nginx.sh
source $current_dir/new_wp/install.sh
