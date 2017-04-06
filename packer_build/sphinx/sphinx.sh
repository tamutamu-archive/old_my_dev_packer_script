#!/bin/bash
set -euo pipefail

echo 'Install Sphinx'
CURDIR=$(cd $(dirname $0); pwd)
. ./var.conf

yum -y install python-pip

pip install Sphinx==${SPHINX_VER}
pip install javasphinx
