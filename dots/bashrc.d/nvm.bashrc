#!/bin/bash
#
# Setup NVM and AVN
###################

# Setup NVM
if [ -d /usr/local/opt/nvm -a -e /usr/local/opt/nvm/nvm.sh ]; then
    export NVM_DIR="$HOME/.nvm"
    source "/usr/local/opt/nvm/nvm.sh"
fi

# Load AVN
if [ -s "$HOME/.avn/bin/avn.sh" ]; then
    source "$HOME/.avn/bin/avn.sh" # load avn
fi
