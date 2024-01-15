#!/bin/bash
if [[ -v default_wp_db_user_name ]]
then
    echo ".."
else
    current_dir=$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )
fi

sudo wp theme install astra --activate --allow-root

install_astra_addon=$( php $current_dir/get_download_url.php --plugin=astra-addon)

sudo wp plugin install $install_astra_addon --activate --allow-root

install_premium_templates=$( php $current_dir/get_download_url.php --plugin=astra-premium-sites)

sudo wp plugin install $install_premium_templates --activate  --allow-root

sudo wp brainstormforce license activate astra-addon 8002e608899e8d5c843b1238673a2ff1 --allow-root

sudo wp brainstormforce license activate astra-pro-sites e0c78a38822275f774166ee7d00198f1 --allow-root