FROM hypriot/rpi-alpine-scratch

MAINTAINER Andreas Eiermann <andreas@hypriot.com>
LABEL version="alpine linux version: 3.2\r\nhugo version: 0.14"
ENV HUGO_VERSION=0.15
 
# set alpine to version 3.2 instead of edge
RUN echo "http://nl.alpinelinux.org/alpine/v3.1/main" > /etc/apk/repositories

RUN apk update && \
apk add openssh git && \
rm -rf /var/cache/apk/*
#apk upgrade && \

ADD content/hugo /usr/local/bin/hugo
WORKDIR /www/
ENTRYPOINT ["hugo"]
EXPOSE 1313

#ENTRYPOINT ["/bin/bash","-s","-c"]
#CMD ["hugo"]
