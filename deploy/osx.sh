#!/bin/sh

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "$0 : Will only run on Darwin"
  exit 1
fi

###############################################################################
# Setup Homebrew Packages                                                     #
###############################################################################

PACKAGES="coreutils screen proctools"
brew install $PACKAGES


###############################################################################
# Setup Defaults                                                              #
###############################################################################

test -e "$SCRIPT_DIR/deploy/defaults/osx.sh" &&
source "$SCRIPT_DIR/deploy/defaults/osx.sh"
