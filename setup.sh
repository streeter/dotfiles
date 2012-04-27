#!/bin/sh

SCRIPT_DIR=`dirname $0`
SCRIPT_DIR=`pwd`"/${SCRIPT_DIR}"

PATH="${SCRIPT_DIR}/bin:${PATH}"

echo "Linking bin to home directory:"
if [ -h $HOME/bin ]; then
    rm $HOME/bin
fi
lns $SCRIPT_DIR/bin $HOME/bin

echo "Linking sshconfig to .ssh directory"
if [ ! -d $HOME/.ssh ]; then
    mkdir $HOME/.ssh
fi
lns $SCRIPT_DIR/sshconfig $HOME/.ssh/config

echo "Linking dotfiles to the home directory:"
for f in `ls $SCRIPT_DIR/dots`; do
    if [ -h "${HOME}/.${f}" ]; then
        rm "${HOME}/.${f}"
    fi
    lns "${SCRIPT_DIR}/dots/$f" "${HOME}/.${f}"
done

# Setup some system defaults
if [[ Darwin == $(uname) ]]; then
    source $SCRIPT_DIR/defaults/osx.sh
fi
