#!/bin/bash
set -euo pipefail

echo 'Install JDK 6,7,8'
CURDIR=$(cd $(dirname $0); pwd)


## Oracle JDK6
pushd ./install-file
chmod +x jdk-6u45-linux-x64-rpm.bin
./jdk-6u45-linux-x64-rpm.bin
popd


## Oracle JDK7
pushd ./install-file
tar -zxf  jdk-7u80-linux-x64.tar.gz
mv jdk1.7.0_80/ /usr/java/
popd


## Oracle JDK8
pushd ./install-file
tar -zxf  jdk-8u144-linux-x64.tar.gz
mv jdk1.8.0_144 /usr/java/
popd


## Setting alternatives
set +e
alternatives --install /usr/java/latest java /usr/java/jdk1.6.0_45 6
alternatives --install /usr/java/latest java /usr/java/jdk1.7.0_80 7
alternatives --install /usr/java/latest java /usr/java/jdk1.8.0_144 8
set -e


## Setting JAVA_HOME
cat << 'EOT' > /etc/profile.d/jdk.sh
export JAVA_HOME=/usr/java/latest
EOT

. /etc/profile.d/jdk.sh


## Copy change Java version script
mkdir -p /opt/scripts/java
cp $CURDIR/conf/ch_java.sh /opt/scripts/java/
chmod a+x /opt/scripts/java/ch_java.sh
