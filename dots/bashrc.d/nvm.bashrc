#!/bin/bash
#
# Setup NVM and AVN
###################

# Setup NVM
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
fi

if [ -s "$NVM_DIR/bash_completion" ]; then
    source "$NVM_DIR/bash_completion"
fi

# Load AVN
if [ -s "$HOME/.avn/bin/avn.sh" ]; then
    source "$HOME/.avn/bin/avn.sh" # load avn
fi
