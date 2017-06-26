#!/bin/bash
#
# Setup autoenv
####################

if [[ $(type -t brew) == file ]]; then
    source $(brew --prefix autoenv)/activate.sh
fi
