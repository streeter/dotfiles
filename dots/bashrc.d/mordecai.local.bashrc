#!/bin/bash


## --------------------------------------------------------
## Stuff to build android

test -d "$HOME/dev/android/android-sdk-mac_x86" &&
export PATH="$HOME/dev/android/android-sdk-mac_x86/tools:$PATH"

# mount the android file image
function mountAndroid { hdiutil attach ~/dev/android/android.sparseimage -mountpoint /Volumes/android; }

# set the number of open files to be 1024
ulimit -S -n 1024
