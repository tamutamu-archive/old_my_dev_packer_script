#!/bin/bash -eu


pushd /usr/local/src

wget http://dist.modpython.org/dist/mod_python-3.5.0.tgz
tar zxvf mod_python-3.5.0.tgz

sed -i -e "s#git describe --always#git describe --always > /dev/null 2>&1#" /usr/local/src/mod_python-3.5.0/dist/version.sh

pushd mod_python-3.5.0/
./configure --with-python=/usr/bin/python2.7 --with-apxs=/bin/apxs
make && make install
popd


popd
