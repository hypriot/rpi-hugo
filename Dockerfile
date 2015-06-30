FROM registry.hypriot.com/alpine/bash

MAINTAINER Andreas Eiermann <andreas@hypriot.com>
LABEL version="alpine linux version: 3.2\r\nhugo version: 0.14"
ENV HUGO_VERSION=0.14
 
# set alpine to version 3.2 instead of edge
RUN echo "http://nl.alpinelinux.org/alpine/v3.1/main" > /etc/apk/repositories

RUN apk update && \
apk add openssh git && \
rm -rf /var/cache/apk/*
#apk upgrade && \


ADD \
https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux_arm.tar.gz /

RUN tar xzf /hugo_${HUGO_VERSION}_linux_arm.tar.gz && \
rm /hugo_${HUGO_VERSION}_linux_arm.tar.gz && \
mv /hugo_${HUGO_VERSION}_linux_arm/hugo_${HUGO_VERSION}_linux_arm \
/usr/local/bin/hugo

WORKDIR /www/

ENTRYPOINT ["hugo"]
EXPOSE 1313

#ENTRYPOINT ["/bin/bash","-s","-c"]
#CMD ["hugo"]
