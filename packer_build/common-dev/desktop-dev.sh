#!/bin/bash
set -euo pipefail


CURDIR=$(cd $(dirname $0); pwd)

### gtkparasite
yum -y install gnome-common gtk3* gtksourceview3*
git clone https://github.com/chipx86/gtkparasite
pushd gtkparasite
./autogen.sh --with-gtk=3.0 --libdir=/usr/lib64
make && make install
popd


### Terminal
yum -y install terminator


### eclipse
yum -y install libwebkitgtk*

pushd /tmp
wget http://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/oxygen/2/eclipse-java-oxygen-2-linux-gtk-x86_64.tar.gz
tar zxf eclipse-java-oxygen-2-linux-gtk-x86_64.tar.gz
mv ./eclipse /var/
sed -i:bk -e 's/--launcher.appendVmargs/--launcher.GTK_version\n2\n--launcher.appendVmargs/' /var/eclipse/eclipse.ini
popd


### CopyQ
yum -y install gcc-c++ git cmake qt5-qtbase-devel qt5-qtsvg-devel qt5-qttools-devel qt5-qtscript-devel

pushd /tmp
git clone https://github.com/hluk/CopyQ.git
pushd CopyQ
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local .
make
make install
popd
popd

ln -s ${CURDIR}/conf/copyq /root/.config/copyq
