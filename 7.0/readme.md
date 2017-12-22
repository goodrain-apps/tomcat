# goodrainapps/tomcat:7.0.82-jre7-alpine

## 概述
好雨官方 Tomcat 7 镜像，基于jre7和alpine系统制作而成，集成redis-session-manager。pinpoine-agent组件

## 使用方式
可以作为应用的基础镜像使用

```dockerfile
FROM goodrainapps/tomcat:7.0.82-jre7-alpine
COPY demo.war /usr/local/tomcat/webapps/
```

## 支持的参数

| 参数名 | 默认值 | 说明 |
|----------|----------|-------|
|ENABLE_APM | false |是否启用pinpoint-agent组件|
|AGENT_ID|xxxxxx|agent-id，用来标识APM唯一ID，开启ENABLE_APM后需要设置|
|APP_NAME|HOSTNAME|应用名称，用来标识APM应用名称，开启ENABLE_APM后需要设置|
|REDIS_SESSION|false |是否启用redis-session-manager组件|
