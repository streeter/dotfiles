#!/bin/bash

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

echo "Linking virtualenv hooks to the virtualenv directory:"
for f in `ls $SCRIPT_DIR/virtualenvs`; do
    if [ -e "${HOME}/.virtualenvs/${f}" ]; then
        rm "${HOME}/.virtualenvs/${f}"
    fi
    lns "${SCRIPT_DIR}/virtualenvs/$f" "${HOME}/.virtualenvs/${f}"
done

# Setup some system defaults
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
    source $SCRIPT_DIR/deploy/osx.sh
fi
