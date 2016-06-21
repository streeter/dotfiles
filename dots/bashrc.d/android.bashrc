#!/bin/bash
#
# Setup ANDROID_HOME
####################

if [[ $(type -t android) == file ]]; then

    export ANDROID_HOME=/usr/local/opt/android-sdk
fi
