#!/bin/bash

[[ $DEBUG ]] &&  set -x

REDIS_URL=${REDIS_URL:-127.0.0.1:6379}
REDIS_HOST=${REDIS_URL%:*}
REDIS_PORT=${REDIS_URL#*:}

# detect ENABLE_APM env
if [ "$ENABLE_APM" == "true" ];then
    COLLECTOR_IP=${COLLECTOR_IP:-127.0.0.1}
    sed -i "2 a. /usr/local/tomcat/bin/pinpoint-agent.sh" /usr/local/tomcat/bin/catalina.sh
    sed -i -r "s/(profiler.collector.ip)=.*/\1=${COLLECTOR_IP}/" /usr/local/pinpoint-agent/pinpoint.config
fi

# redis sersion
if [ "$REDIS_SESSION" == "true" ];then
sed -i 's#</Context>##' /usr/local/tomcat/conf/context.xml

cat >>  /usr/local/tomcat/conf/context.xml << END
<Manager className="com.crimsonhexagon.rsm.redisson.SingleServerSessionManager"
	endpoint="redis://$REDIS_HOST:$REDIS_PORT"
	sessionKeyPrefix="_rsm_"
	saveOnChange="false"
	forceSaveAfterRequest="false"
	dirtyOnMutation="false"
	ignorePattern=".*\\.(ico|png|gif|jpg|jpeg|swf|css|js)$"
	maxSessionAttributeSize="-1"
	maxSessionSize="-1"
	allowOversizedSessions="false"
	connectionPoolSize="100"
	database="0"
	timeout="60000"
	pingTimeout="1000"
	retryAttempts="20"
	retryInterval="1000"
/>
</Context>

END

fi

sleep ${PSUSE:-0}

exec $@
