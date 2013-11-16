#!/bin/bash

AWS_HOME="${HOME}/.aws"

if [ -e $AWS_HOME ]; then
    export AWS_HOME
    export AWS_CONFIG_FILE="${AWS_HOME}/config"

    # Grab the last set values in the config file
    export AWS_DEFAULT_OUTPUT=$(grep '^output' ${AWS_CONFIG_FILE} | cut -d= -f2 | tr -d ' ' | tail -1)
    #export AWS_DEFAULT_REGION=$(grep '^region' ${AWS_CONFIG_FILE} | cut -d= -f2 | tr -d ' ' | tail -1)
    #export AWS_ACCESS_KEY_ID=$(grep '^aws_access_key_id' ${AWS_CONFIG_FILE} | cut -d= -f2 | tr -d ' ' | tail -1)
    #export AWS_SECRET_ACCESS_KEY=$(grep '^aws_secret_access_key' ${AWS_CONFIG_FILE} | cut -d= -f2 | tr -d ' ' | tail -1)
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
