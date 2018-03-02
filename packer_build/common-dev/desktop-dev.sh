#!/bin/bash
set -euo pipefail


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
pushd /tmp
wget http://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/oxygen/2/eclipse-java-oxygen-2-linux-gtk-x86_64.tar.gz
tar zxf eclipse-java-oxygen-2-linux-gtk-x86_64.tar.gz
mv ./eclipse /var/
sed -i:bk -e 's/--launcher.appendVmargs/--launcher.GTK_version\n2\n--launcher.appendVmargs/' /var/eclipse/eclipse.ini
popd
