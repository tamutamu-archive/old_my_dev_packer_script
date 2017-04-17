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

