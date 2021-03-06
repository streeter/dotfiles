#!/bin/sh

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "$0 : Will only run on Darwin"
  exit 1
fi

###############################################################################
# Setup Homebrew Packages                                                     #
###############################################################################

brew update

brew upgrade

brew tap Homebrew/bundle

brew bundle --file=$SCRIPT_DIR/Brewfile

brew cleanup

# Allow htop to see all processes
sudo chown root:wheel `brew --prefix htop`/bin/htop
sudo chmod u+s `brew --prefix htop`/bin/htop


###############################################################################
# Setup Python Packages                                                       #
###############################################################################

mkdir ~/.wheels

pip install -r $SCRIPT_DIR/deploy/requirements.txt


###############################################################################
# Setup Defaults                                                              #
###############################################################################

test -e "$SCRIPT_DIR/deploy/defaults/osx.sh" &&
source "$SCRIPT_DIR/deploy/defaults/osx.sh"


###############################################################################
# Copy other items                                                            #
###############################################################################

echo "There are some other things to set up. Copy:"
echo "~/.atom"
echo "~/.exports.private"
echo "~/.github-hooks-token"
echo "~/.gnupg"
echo "~/.heroku"
echo "~/.secrets"
echo "~/.travis"
echo "~/.ssh"
echo "~/.spotify-ripper"
