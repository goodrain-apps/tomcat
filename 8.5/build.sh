#!/bin/bash

VER=$(cat VERSION)
TOMCAT_ENV='jre8-alpine'

docker build -t goodrainapps/tomcat:${VER}-${TOMCAT_ENV} .

docker push goodrainapps/tomcat:${VER}-${TOMCAT_ENV}
