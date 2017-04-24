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


### Update Git settings.
\cp -f /opt/scripts/my_dev/my_dev_settings/git/.gitconfig /root/


### Update Vim settings.
# Config
echo 'alias vi=vim' >> /root/.bashrc

pushd /opt/scripts/my_dev/my_dev_settings/vim/
\cp -rf . /root/
popd


# Install dein.
if [ -e ~/.cache/dein ]; then
  rm -rf ~/.cache/dein
fi

mkdir -p ~/.cache/dein

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh -o /tmp/installer.sh
sh /tmp/installer.sh ~/.cache/dein | awk '/"dein/,/"End/' > /root/.vim/my_dein.vim

### dein plugin install.
set +e
yes | vim -c ":silent! call dein#install() | :q"
set -e

