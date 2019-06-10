#!/bin/bash

[[ $DEBUG ]] &&  set -x
[[ $PORT ]] && sed -i "s/8080/${PORT}/g" /usr/local/tomcat/conf/server.xml

REDIS_URL=${REDIS_URL:-127.0.0.1:6379}
REDIS_HOST=${REDIS_URL%:*}
REDIS_PORT=${REDIS_URL#*:}

# detect ENABLE_APM env
if [ "$ENABLE_APM" == "true" ];then
    COLLECTOR_TCP_HOST=${COLLECTOR_TCP_HOST:-127.0.0.1}
    COLLECTOR_TCP_PORT=${COLLECTOR_TCP_PORT:-9994}
    COLLECTOR_UDP_SPAN_LISTEN_HOST=${COLLECTOR_UDP_SPAN_LISTEN_HOST:-127.0.0.1}
    COLLECTOR_UDP_SPAN_LISTEN_PORT=${COLLECTOR_UDP_SPAN_LISTEN_PORT:-9996}
    COLLECTOR_UDP_STAT_LISTEN_HOST=${COLLECTOR_UDP_STAT_LISTEN_HOST:-127.0.0.1}
    COLLECTOR_UDP_STAT_LISTEN_PORT=${COLLECTOR_UDP_STAT_LISTEN_PORT:-9995}
    sed -i "2 a. /usr/local/tomcat/bin/pinpoint-agent.sh" /usr/local/tomcat/bin/catalina.sh
    sed -i -r -e "s/(profiler.collector.ip)=.*/\1=${COLLECTOR_TCP_HOST}/" \
              -e "s/(profiler.collector.tcp.port)=.*/\1=${COLLECTOR_TCP_PORT}/" \
              -e "s/(profiler.collector.span.port)=.*/\1=${COLLECTOR_UDP_SPAN_LISTEN_PORT}/" \
              -e "s/(profiler.collector.stat.port)=.*/\1=${COLLECTOR_UDP_STAT_LISTEN_PORT}/" /usr/local/pinpoint-agent/pinpoint.config
    export APP_NAME=${APP_NAME:-${SERVICE_NAME:-${HOSTNAME}}}
    export AGENT_ID=${APP_NAME}-${POD_IP}
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
