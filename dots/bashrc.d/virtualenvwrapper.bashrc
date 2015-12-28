#!/bin/bash
#
# Load virtualenv wrapper from one of it's many locations
#
# Copyright 2012 Aron Griffis <aron@arongriffis.com>
# Released under the GNU GPL v3
#######################################################################

if [[ $(type -t workon) != function ]]; then

    SCRIPT_NAME='virtualenvwrapper.sh'

    # Python virtualenvwrapper can load really slowly, so load it on demand.
    SCRIPT_NAME='virtualenvwrapper_lazy.sh'

    _try_source() { [[ -f $1 ]] || return; source "$1"; return 0; }

    _try_source /usr/local/share/python/$SCRIPT_NAME || \
    _try_source /usr/local/bin/$SCRIPT_NAME || \
    _try_source /etc/bash_completion.d/virtualenvwrapper || \
    _try_source /usr/bin/$SCRIPT_NAME

    unset -f _try_source
    unset SCRIPT_NAME
fi
