FROM alpine:3.5

ARG GSNOVA_PAAS_VER=0.26.3
ENV KEY=809240d3a021449f6e67aa73221d42df942a308a
ENV CERT_FILE=none
ENV KEY_FILE=none

RUN \
    apk add --no-cache --virtual .build-deps curl \
    && mkdir -p /opt/gsnova \
    && cd /opt/gsnova \
    && curl -fSL https://github.com/yinqiwen/gsnova/releases/download/v$GSNOVA_PAAS_VER/gsnova_paas_linux_amd64-v$GSNOVA_PAAS_VER.tar.bz2 | tar xj  \
    && curl -o cert.pem $CERT_FILE \
    && curl -o key.pem $KEY_FILE \
    && cd ~ \
    && apk del .build-deps 
    
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8080


