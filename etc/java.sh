#!/bin/sh
# /etc/profile.d/java.sh

if [ `uname` != "Darwin" ]
then
    export PATH=${APP_DIR}/java/current/bin:${PATH}
    export JAVA_HOME=${APP_DIR}/java/current
else
    export PATH=/opt/homebrew/opt/openjdk/bin:${PATH}
    export JAVA_HOME=/opt/homebrew/opt/openjdk
fi
