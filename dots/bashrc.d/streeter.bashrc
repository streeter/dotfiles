#!/bin/bash

if [ -e ~/.ec2 ]; then
    export EC2_HOME=~/.ec2
    export PATH=$PATH:$EC2_HOME/bin
    export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
    export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
fi