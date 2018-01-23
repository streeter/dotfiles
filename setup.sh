#!/bin/bash

SCRIPT_DIR=`dirname $0`
SCRIPT_DIR=`pwd`"/${SCRIPT_DIR}"

PATH="${SCRIPT_DIR}/bin:${PATH}"

echo "Linking virtualenv hooks to the virtualenv directory:"

if [ ! -d "${HOME}/.virtualenvs" ]; then
    mkdir "${HOME}/.virtualenvs"
fi

for f in `ls ${SCRIPT_DIR}/virtualenvs`; do
    if [ -e "${HOME}/.virtualenvs/${f}" ]; then
        rm "${HOME}/.virtualenvs/${f}"
    fi
    ln -s "${SCRIPT_DIR}/virtualenvs/$f" "${HOME}/.virtualenvs/${f}"
done

# Install the vim bundles
echo "Installing vim bundles with vundle..."
vim -c "BundleInstall" -c "q" -c "q"

# Setup some system defaults
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
    source ${SCRIPT_DIR}/deploy/osx.sh
fi
