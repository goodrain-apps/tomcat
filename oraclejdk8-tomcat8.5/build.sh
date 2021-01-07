#!/bin/bash

VER=$(cat VERSION)
TOMCAT_ENV='oracle-8u171-debian'

docker build -t goodrainapps/tomcat:${VER}-${TOMCAT_ENV} .

docker push goodrainapps/tomcat:${VER}-${TOMCAT_ENV}
