#!/bin/bash
set -euo pipefail

echo "Install Common DevTools."
CURDIR=$(cd $(dirname $0); pwd)


### Settings, etc..
yum -y install wget git
yum -y install epel-release

yum -y update
ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime


# ssh config
rm -f /root/.ssh/authorized_keys
echo 'UseDNS no' >> /etc/ssh/sshd_config


echo 'set completion-ignore-case on' >> /etc/inputrc

# Man page for japanese.
yum -y install man-pages-ja


### Common Dev tools
yum -y groupinstall "Development Tools"
yum -y install openssl-devel curl-devel expat-devel perl-ExtUtils-MakeMaker ncurses-devel ncurses


### For smb share folder.
yum -y install cifs-utils


### Util Scripts
mkdir -p /opt/scripts
\cp -rf ./conf/gpg /opt/scripts/


### Desktop Dev
./desktop.sh
./desktop-dev.sh
