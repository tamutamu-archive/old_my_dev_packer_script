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


### Desktop
yum -y install ibus-anthy vlgothic-* ipa-gothic-fonts ipa-mincho-fonts ipa-pgothic-fonts ipa-pmincho-fonts
yum -y remove ibus-kkc

localectl set-locale LANG=ja_JP.UTF-8
source /etc/locale.conf


### mate
yum -y groupinstall "X Window System" "Japanese Support" mate-desktop"Input Methods"

cat << EOT >> ~/.xinitrc
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

ibus-daemon -drx

exec mate-session
EOT


### Xfce4
##yum -y groupinstall "X Window System"
##yum -y groupinstall Xfce
##
##cat << EOT >> ~/.xinitrc
##export GTK_IM_MODULE=xim
##export XMODIFIERS=@im=ibus
##export QT_IM_MODULE=ibus
##
##ibus-daemon -drx
##sleep 2
##
##exec startxfce4
##EOT

#### cinnamon
##yum -y groups install "Server with GUI"
##yum -y install cinnamon
##
##cat << EOT >> ~/.xinitrc
##export GTK_IM_MODULE=xim
##export XMODIFIERS=@im=ibus
##export QT_IM_MODULE=ibus
##
##ibus-daemon -drx
##sleep 2
##
##exec cinnamon-session-cinnamon2d
##EOT
##
##systemctl enable polkit
##systemctl start polkit
