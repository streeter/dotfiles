#!/bin/bash
#
# Setup Fastlane autocompletions
################################

if [ -d "$HOME/.fastlane/completions" ]; then
    source $HOME/.fastlane/completions/completion.sh
fi
