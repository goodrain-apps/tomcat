FROM goodrainapps/oraclejdk:7u80
MAINTAINER rainbond@goodrain.com

ENV TOMCAT_VER 7.0.82

RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN wget https://pkg.goodrain.com/apps/tomcat/7.0/apache-tomcat-${TOMCAT_VER}.tar.gz -O /tmp/apache-tomcat-${TOMCAT_VER}.tar.gz \
    && cd /tmp/ \
    && tar xvzf /tmp/apache-tomcat-${TOMCAT_VER}.tar.gz -C /usr/local/ \
    && ln -s /usr/local/apache-tomcat-${TOMCAT_VER}/ /usr/local/tomcat \
    && rm -rf /tmp/apache-tomcat-${TOMCAT_VER}.tar.gz
