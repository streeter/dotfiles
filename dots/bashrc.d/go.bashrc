#!/bin/bash
#
# Setup go
#######################################################################

devpath="${HOME}/dev"

if [ -d "${devpath}" ]; then
    mkdir -p "${devpath}/go"
    export GOPATH="${devpath}/go"

    export PATH="${devpath}/go/bin:${PATH}"
fi

unset devpath
