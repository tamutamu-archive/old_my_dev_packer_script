#!/bin/bash
set -euo pipefail

echo 'Install gradle2'
CURDIR=$(cd $(dirname $0); pwd)


pushd /tmp
wget --no-check-certificate https://services.gradle.org/distributions/gradle-2.2.1-all.zip
unzip -q gradle-2.2.1-all.zip
mv gradle-2.2.1 /opt/gradle
ln -s /opt/gradle/bin/gradle /usr/bin/gradle
printf "" > /etc/profile.d/gradle.sh

cat << 'EOT' >> /etc/profile.d/gradle.sh
export GRADLE_HOME=/opt/gradle/latest
EOT

. /etc/profile.d/gradle.sh
popd

set +eu
if [ ! -z "$http_proxy" ]; then
   proxy_host=$(echo $http_proxy | awk '{sub("^http.*://","");sub(":[0-9]*","");print $0}')
   proxy_port=$(echo $http_proxy | awk '{sub("^http.*:","");print $0}')

   mkdir -p /root/.gradle/

   cat << EOT >> /root/.gradle/gradle.properties
systemProp.http.proxyHost=${proxy_host}
systemProp.http.proxyPort=${proxy_port}
systemProp.https.proxyHost=${proxy_host}
systemProp.https.proxyPort=${proxy_port}
EOT
fi
set -eu