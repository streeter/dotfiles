#!/bin/bash

if [ -e ~/.ec2 ]; then
    export EC2_HOME=~/.ec2
    #export PATH=$PATH:$EC2_HOME/bin
    export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
    export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
    export AWS_ACCESS_KEY_ID=`cat $EC2_HOME/aws_access_key_id`
    export AWS_SECRET_ACCESS_KEY=`cat $EC2_HOME/aws_secret_access_key`
    export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.2.5/jars"
fi

## Python virtual environment stuff
export WORKON_HOME="${HOME}/.virtualenvs"
#export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME

## RVM
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    source "$HOME/.rvm/scripts/rvm"
fi
