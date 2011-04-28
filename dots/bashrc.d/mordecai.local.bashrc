#!/bin/bash

# Python virtual environment stuff
export WORKON_HOME="${HOME}/dev/python-environments"
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME


## --------------------------------------------------------
## Stuff to build android

# mount the android file image
function mountAndroid { hdiutil attach ~/dev/android/android.sparseimage -mountpoint /Volumes/android; }

# set the number of open files to be 1024
ulimit -S -n 1024
