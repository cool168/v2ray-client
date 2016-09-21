FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
        curl \
        supervisor \
        unzip \
    && curl -L -s https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/install-release.sh | bash \
    && mv /etc/v2ray/config.json /etc/v2ray/config.json.bak \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /app
RUN chmod +x /app
COPY ./*.sh /app/
COPY ./client-config.json /app/
RUN chmod +x /app/*.sh

WORKDIR /app
#EXPOSE 1080

#ENTRYPOINT ["/init.sh"]
