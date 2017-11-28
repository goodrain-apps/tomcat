FROM goodrainapps/ubuntu:14.04.20170613
MAINTAINER zhouyq@goodrain.com

ENV TOMCAT_VER 7.0.82
ENV JDK_VER 6u45-linux-x64

RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN wget https://pkg.goodrain.com/jdk/jdk-${JDK_VER}.bin -O /tmp/jdk-${JDK_VER}.bin \
    && wget https://pkg.goodrain.com/tomcat/apache-tomcat-${TOMCAT_VER}.tar.gz -O /tmp/apache-tomcat-${TOMCAT_VER}.tar.gz \
    && chmod +x /tmp/jdk-${JDK_VER}.bin \
    && cd /tmp/ \
    && ./jdk-${JDK_VER}.bin \
    && mv /tmp/jdk1.* /usr/local/jdk-${JDK_VER} \
    && tar xvzf /tmp/apache-tomcat-${TOMCAT_VER}.tar.gz -C /usr/local/ \
    && ln -s /usr/local/apache-tomcat-${TOMCAT_VER}/ /usr/local/tomcat \
    && rm -rf /tmp/jdk-${JDK_VER}.bin /tmp/apache-tomcat-${TOMCAT_VER}.tar.gz


ENV JAVA_HOME /usr/local/jdk-${JDK_VER}
ENV JAVA_OPTS -Duser.timezone=Asia/Shanghai
ENV LANG C.UTF-8