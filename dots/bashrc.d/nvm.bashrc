#!/bin/bash
#
# Setup NVM
###########

if [ -d /usr/local/opt/nvm -a -e /usr/local/opt/nvm/nvm.sh ]; then
    export NVM_DIR="$HOME/.nvm"
  source "/usr/local/opt/nvm/nvm.sh"
fi
