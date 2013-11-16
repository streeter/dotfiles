#!/bin/bash

AWS_HOME="${HOME}/.aws"

if [ -e $AWS_HOME ]; then
    export AWS_HOME
    export AWS_ACCESS_KEY_ID=`cat $AWS_HOME/aws_access_key_id`
    export AWS_SECRET_ACCESS_KEY=`cat $AWS_HOME/aws_secret_access_key`
    export AWS_CREDENTIAL_FILE="$AWS_HOME/aws_credential_file"
fi

## Python virtual environment stuff
export WORKON_HOME="${HOME}/.virtualenvs"
export PROJECT_HOME="${HOME}/dev"
#export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME

# Python de-optimization
#export PYTHONDONTWRITEBYTECODE="true"

## RVM
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    source "$HOME/.rvm/scripts/rvm"
fi
