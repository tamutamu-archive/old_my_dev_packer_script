#!/bin/bash -eu


pushd /usr/local/src

git clone https://github.com/grisha/mod_python.git

pushd mod_python
###sed -i -e "s#git describe --always#git describe --always > /dev/null 2>&1#" /usr/local/src/mod_python-3.5.0/dist/version.sh

./configure --with-python=/usr/bin/python2.7 --with-apxs=/bin/apxs
make && make install
popd

echo 'PYTHONPATH=/usr/lib64/python2.7/site-packages/' >> /etc/sysconfig/httpd

popd
