FROM alpine:3.5

ARG GSNOVA_PAAS_VER=0.26.3

RUN \
    apk add --no-cache --virtual .build-deps curl \
    && mkdir -p /opt/gsnova \
    && cd /opt/gsnova \
    && curl -fSL https://github.com/yinqiwen/gsnova/releases/download/v$GSNOVA_PAAS_VER/gsnova_paas_linux_amd64-v$GSNOVA_PAAS_VER.tar.bz2 | tar xj  \
    && cd ~ \
    && apk del .build-deps 
    
ENV KEY=809240d3a021449f6e67aa73221d42df942a308a

ENV CERT_FILE=none

ENV KEY_FILE=none

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8080


