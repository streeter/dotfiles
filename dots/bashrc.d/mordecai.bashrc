#!/bin/bash

# Python virtual environment stuff
export WORKON_HOME="${HOME}/.virtualenvs"
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME


## --------------------------------------------------------
## Stuff to build android

test -d "$HOME/dev/android/android-sdk-mac_x86" &&
export PATH="$HOME/dev/android/android-sdk-mac_x86/tools:$PATH"

# mount the android file image
function mountAndroid { hdiutil attach ~/dev/android/android.sparseimage -mountpoint /Volumes/android; }

# set the number of open files to be 1024
ulimit -S -n 1024

## RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
