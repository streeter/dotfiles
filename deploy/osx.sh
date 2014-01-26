#!/bin/sh

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "$0 : Will only run on Darwin"
  exit 1
fi

###############################################################################
# Setup Homebrew Packages                                                     #
###############################################################################

brew bundle $SCRIPT_DIR/Brewfile


###############################################################################
# Setup Defaults                                                              #
###############################################################################

test -e "$SCRIPT_DIR/deploy/defaults/osx.sh" &&
source "$SCRIPT_DIR/deploy/defaults/osx.sh"
