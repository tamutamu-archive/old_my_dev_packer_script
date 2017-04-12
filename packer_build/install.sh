#!/bin/bash -eux

### execute provisoning scripts
BASEDIR=/var/packer_build

### base
(cd $BASEDIR/base && ./base.sh)


### common develop
(cd $BASEDIR/common-dev && ./common-dev.sh)
(cd $BASEDIR/vim && ./vim.sh)
(cd $BASEDIR/sphinx && ./sphinx.sh)
(cd $BASEDIR/aws && ./aws.sh)


### Java(6,7,8), Maven, Gradle
(cd $BASEDIR/java && ./jdk.sh)
(cd $BASEDIR/java && ./maven-3.sh)
(cd $BASEDIR/java && ./gradle-2.sh)


### Apache 
(cd $BASEDIR/apache && ./apache.sh)


### Ruby
(cd $BASEDIR/ruby && ./ruby.sh)
