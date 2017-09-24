FROM alpine:3.6

ARG VER=0.28.0

RUN \
    apk add --no-cache --virtual .build-deps curl \
    && mkdir -p /opt/gsnova \
    && cd /opt/gsnova \
    && curl -fSL https://github.com/yinqiwen/gsnova/releases/download/v0.28.0/gsnova_server_linux_amd64-v0.28.0.tar.bz2 | tar xj  \
    && cd ~ \
    && apk del .build-deps 
    
ENV  CERT_PEM=none KEY_PEM=none

ADD entrypoint.sh /entrypoint.sh

RUN chgrp -R 0 /opt/gsnova \
    && chmod -R g+rwX /opt/gsnova \
    && chmod +x /entrypoint.sh

ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8080


