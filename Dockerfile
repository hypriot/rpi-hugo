FROM hypriot/rpi-alpine-scratch

MAINTAINER Andreas Eiermann <andreas@hypriot.com>
LABEL version="alpine linux version: 3.6\r\nhugo version: 0.26"
ENV HUGO_VERSION=0.26
 
# set alpine to version 3.6 instead of edge
RUN echo "http://nl.alpinelinux.org/alpine/v3.6/main" > /etc/apk/repositories

RUN apk update && \
apk add openssh git && \
rm -rf /var/cache/apk/*

ADD content/hugo /usr/local/bin/hugo
WORKDIR /www/
ENTRYPOINT ["hugo"]
EXPOSE 1313