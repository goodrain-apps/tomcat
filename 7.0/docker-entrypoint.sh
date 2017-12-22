#!/bin/bash

[[ $DEBUG ]] &&  set -x

# detect ENABLE_APM env
if [ "$ENABLE_APM" == "true" ];then
    sed -i "2 a. /usr/local/tomcat/bin/pinpoint-agent.sh" /usr/local/tomcat/bin/catalina.sh 
fi

exec $@