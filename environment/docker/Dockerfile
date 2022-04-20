FROM alpine:latest
MAINTAINER tangjialin <taogarfield@hotmail.com>

# 设置时区为上海
RUN echo "https://mirrors.aliyun.com/alpine/latest-stable/main" > /etc/apk/repositories \
    && apk add -U tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata
CMD ["/opt/glink/glink"]
EXPOSE 8080

COPY . /opt/glink/
WORKDIR /opt/glink