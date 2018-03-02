#!/bin/bash
set -euo pipefail


### plasma desktop
localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
localectl set-locale LANG=ja_JP.UTF-8
source /etc/locale.conf

yum groupinstall "KDE Plasma Workspaces" -y
yum -y install kde-l10n-Japanese notify-python
yum install ibus-kkc ipa-gothic-fonts ipa-mincho-fonts ipa-pgothic-fonts ipa-pmincho-fonts -y


cat << EOT >> /root/.xinitrc
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

exec startkde
EOT

#### mate
#yum -y groupinstall "X Window System" "Japanese Support" mate-desktop"Input Methods"
#yum install -y fcitx fcitx-configtool fcitx-anthy im-chooser
#### startx && im-chooser, set fcitx.
#
#cat << EOT >> ~/.xinitrc
#export GTK_IM_MODULE=fcitx
#export XMODIFIERS=@im=fcitx
#export QT_IM_MODULE=fcitx
#
#exec mate-session
#EOT


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
