#!/bin/bash
set -euo pipefail

echo "Install Common DevTools."
CURDIR=$(cd $(dirname $0); pwd)


### Settings
yum -y install wget
wget http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/7/x86_64/e/epel-release-7-9.noarch.rpm -P /tmp/

yum -y localinstall /tmp/epel-release-7-9.noarch.rpm
yum -y update
ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
rm -f /root/.ssh/authorized_keys

echo 'set completion-ignore-case on' >> /etc/inputrc


### Bash Settings
\cp -f ./conf/z_env_bash.sh /etc/profile.d/


### Common Dev tools
yum -y groupinstall "Development Tools"
yum -y install openssl-devel curl-devel expat-devel perl-ExtUtils-MakeMaker ncurses-devel ncurses


### Git
yum -y remove git
wget https://www.kernel.org/pub/software/scm/git/git-2.11.0.tar.gz -P /tmp/
pushd /tmp/
tar zxf git-2.11.0.tar.gz
cd git-2.11.0
make prefix=/usr/local all
make prefix=/usr/local install
popd

pushd /tmp/
git clone https://github.com/jonas/tig.git
cd tig
./autogen.sh
./configure --without-ncurses
make && make install
popd

### clone my_dev_settings.
git clone https://github.com/tamutamu/my_dev_settings.git /root/my_dev_settings

\cp -f /root/my_dev_settings/git/.gitconfig /root/


