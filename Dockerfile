FROM alpine:3.6

ENV VER=0.28.0

RUN \
    apk add --no-cache --virtual  curl \
    && mkdir -m 777 /gsnova \
    && cd /gsnova \
    && curl -fSL https://github.com/yinqiwen/gsnova/releases/download/v0.28.0/gsnova_server_linux_amd64-v0.28.0.tar.bz2 | tar xj  \
    && rm server.json \
    && rm gsnova_server_linux_amd64-v0.28.0.tar.bz2 \
    && chgrp -R 0 /gsnova \
    && chmod -R g+rwX /gsnova 
    
CMD ["/gsnova/gsnova_server", "-http", ":8080"]

EXPOSE 8080


