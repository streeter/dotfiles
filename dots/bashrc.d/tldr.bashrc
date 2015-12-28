#!/bin/bash
#
# Setup tldr as an alias of man if tldr exists
#######################################################################

if [[ $(type -t tldr) == file ]]; then

    alias man=tldr
fi
