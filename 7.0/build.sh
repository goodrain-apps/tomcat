#!/bin/bash

VER=$(cat VERSION)
TOMCAT_ENV="jre7-alpine"

docker build -t goodrainapps/tomcat:${VER}-${TOMCAT_ENV} .

docker push goodrainapps/tomcat:${VER}-${TOMCAT_ENV}
