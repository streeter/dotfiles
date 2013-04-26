#!/bin/bash

if [ -e ~/.ec2 ]; then
    export EC2_HOME=~/.ec2
    export JAVA_HOME="$(/usr/libexec/java_home)"
    export AWS_ACCESS_KEY_ID=`cat $EC2_HOME/aws_access_key_id`
    export AWS_SECRET_ACCESS_KEY=`cat $EC2_HOME/aws_secret_access_key`
    export AWS_ACCESS_KEY=$AWS_ACCESS_KEY_ID
    export AWS_SECRET_KEY=$AWS_SECRET_ACCESS_KEY
    export AWS_CREDENTIAL_FILE="$EC2_HOME/aws_credential_file"
    export AWS_IAM_HOME="$(brew --prefix aws-iam-tools)/jars"
    export EC2_HOME="$(brew --prefix ec2-api-tools)/jars"
fi

## Python virtual environment stuff
export WORKON_HOME="${HOME}/.virtualenvs"
export PROJECT_HOME="${HOME}/dev"
#export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME

# Python de-optimization
export PYTHONDONTWRITEBYTECODE="true"

## RVM
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    source "$HOME/.rvm/scripts/rvm"
fi
