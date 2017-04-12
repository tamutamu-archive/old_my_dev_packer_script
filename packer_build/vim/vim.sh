#!/bin/bash
set -euo pipefail

echo 'Install VIM'
CURDIR=$(cd $(dirname $0); pwd)

yum -y install ncurses-devel
yum -y install gtk2-devel atk-devel libX11-devel libXt-devel

yum -y remove vim

### Install Vim 8.0
pushd /tmp

git clone --branch v8.0.0543 https://github.com/vim/vim
cd ./vim/src
make && make install
ln -s /usr/local/bin/vim /bin/vim

pushd

### Add vim settings.
mkdir -p /root/.vim/.vim.d


### Install dein.
mkdir -p ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh -o /tmp/installer.sh
sh /tmp/installer.sh ~/.cache/dein | awk '/"dein/,/"End/' > /root/.vim/.vim.d/90-dein.vim


### Config
echo 'alias vi=vim' >> /root/.bashrc

\cp -f /root/my_dev_settings/vim/.vimrc /root/
\cp -rf /root/my_dev_settings/vim/.vim/.vim.d/ /root/.vim/

