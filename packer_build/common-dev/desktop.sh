#!/bin/bash
set -euo pipefail

CURDIR=$(cd $(dirname $0); pwd)


localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
localectl set-locale LANG=ja_JP.UTF-8
source /etc/locale.conf



#### mate
yum -y groupinstall "mate-desktop"


## custom freetype
yum localinstall http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/nux-dextop.repo
yum --enablerepo=nux-dextop install fontconfig-infinality cairo libXft freetype-infinality

cat << EOF > /etc/fonts/local.conf
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
     <match target="font">
      <edit mode="assign" name="hinting" >
       <bool>true</bool>
      </edit>
     </match>
     <match target="font" >
      <edit mode="assign" name="autohint" >
       <bool>true</bool>
      </edit>
     </match>
     <match target="font">
      <edit mode="assign" name="hintstyle" >
      <const>hintslight</const>
      </edit>
     </match>
     <match target="font">
      <edit mode="assign" name="rgba" >
       <const>rgb</const>
      </edit>
     </match>
     <match target="font">
      <edit mode="assign" name="antialias" >
       <bool>true</bool>
      </edit>
     </match>
     <match target="font">
       <edit mode="assign" name="lcdfilter">
       <const>lcddefault</const>
       </edit>
     </match>
    </fontconfig>
EOF


## For enable startx by general user.
sed -i.bk -e 's/auth.*required.*pam_console\.so/auth       required     pam_permit.so/' /etc/pam.d/xserver


## fcitx & mozc
yum remove -y ibus
yum -y install fcitx fcitx-configtool protobuf

pushd /tmp
wget http://download.opensuse.org/repositories/openSUSE:/Leap:/42.2/standard/x86_64/mozc-2.17.2313.102-1.1.x86_64.rpm
wget http://download.opensuse.org/repositories/openSUSE:/Leap:/42.2/standard/x86_64/mozc-gui-tools-2.17.2313.102-1.1.x86_64.rpm
wget http://download.opensuse.org/repositories/openSUSE:/Leap:/42.3/standard/x86_64/fcitx-mozc-2.17.2313.102-4.2.x86_64.rpm
wget http://download.opensuse.org/repositories/openSUSE:/Factory/standard/noarch/zinnia-tomoe-0.6.0-7.5.noarch.rpm

yum localinstall -y mozc-2.17.2313.102-1.1.x86_64.rpm
yum localinstall -y zinnia-tomoe-0.6.0-7.5.noarch.rpm
yum localinstall -y mozc-gui-tools-2.17.2313.102-1.1.x86_64.rpm
yum localinstall -y fcitx-mozc-2.17.2313.102-4.2.x86_64.rpm
popd

### plasma desktop
#yum groupinstall "KDE Plasma Workspaces" -y
#yum -y install kde-l10n-Japanese notify-python
#yum install ibus-kkc ipa-gothic-fonts ipa-mincho-fonts ipa-pgothic-fonts ipa-pmincho-fonts -y

#cat << EOT >> /root/.xinitrc
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
#ibus-daemon -drx
#
#exec startkde
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
