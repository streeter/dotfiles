#!/bin/bash
#
# Setup autoenv
####################

if [[ $(type -t brew) == file ]]; then
    test -e $(brew --prefix autoenv)/activate.sh &&
    source $(brew --prefix autoenv)/activate.sh
fi
