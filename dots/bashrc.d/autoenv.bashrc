#!/bin/bash
#
# Setup autoenv
####################

if [ -d /usr/local/opt/autoenv -a -e /usr/local/opt/autoenv/activate.sh ]; then
    source /usr/local/opt/autoenv/activate.sh
fi
