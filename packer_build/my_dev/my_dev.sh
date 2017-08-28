#!/bin/bash
set -euo pipefail

echo 'Install My develop settings.'
CURDIR=$(cd $(dirname $0); pwd)


### Clone my_dev_settings.
if [ -e /opt/scripts/my_dev/my_dev_settings ]; then
  (cd /opt/scripts/my_dev/my_dev_settings && git pull)
else
  git clone https://github.com/tamutamu/my_dev_settings.git /opt/scripts/my_dev/my_dev_settings
fi

chmod +x /opt/scripts/my_dev/my_dev_settings/dev_install.sh
/opt/scripts/my_dev/my_dev_settings/dev_install.sh



### My Shell Scripts
if [ -e /opt/scripts/shell_scripts ]; then
  (cd /opt/scripts/shell_scripts && git pull)
else
  git clone https://github.com/tamutamu/shell_scripts.git /opt/scripts/shell_scripts
fi