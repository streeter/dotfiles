#!/bin/bash
#
# Setup iterm
#######################################################################

iterm_integration="${HOME}/.iterm2_shell_integration.bash"

test -e "${iterm_integration}" && source "${iterm_integration}"

unset iterm_integration
