FROM alpine:3.6

ARG VER=0.28.0

RUN \
    apk add --no-cache --virtual .build-deps curl \
    && mkdir -p /opt/gsnova \
    && cd /opt/gsnova \
    && curl -fSL https://github.com/yinqiwen/gsnova/releases/download/v$VER/gsnova_linux_amd64-v$VER.tar.bz2 | tar xj  \
    && cd ~ \
    && apk del .build-deps 
    
ENV KEY=809240d3a021449f6e67aa73221d42df942a308a CERT_PEM=none KEY_PEM=none

ADD entrypoint.sh /entrypoint.sh

RUN chgrp -R 0 /opt/gsnova \
    && chmod -R g+rwX /opt/gsnova \
    && chmod +x /entrypoint.sh

ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8080


