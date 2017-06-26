#!/bin/bash
#
# Setup Travis
####################

if [[ $(type -t brew) == file ]]; then
    test -e "${HOME}/.travis/travis.sh" &&
    source "${HOME}/.travis/travis.sh"
fi
