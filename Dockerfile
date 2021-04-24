FROM nvidia/cuda:11.2.2-base

LABEL maintainer="mattias.rundqvist@icloud.com"

ENV NVIDIA_DRIVER_CAPABILITIES="compute,video,utility"
ENV TREX_VERSION="0.20.3"
ENV CONFIG_FILE="config_example.json"

RUN apt-get update && apt-get install -y --no-install-recommends wget \
    && wget --no-check-certificate https://github.com/trexminer/T-Rex/releases/download/$TREX_VERSION/t-rex-$TREX_VERSION-linux.tar.gz -O /tmp/trex.tar.gz \
    && tar -xvf /tmp/trex.tar.gz -C /tmp \
    && mv /tmp/t-rex /usr/sbin/ \
    && mv /tmp/config_example /config_example.json \
    && rm -rf /tmp/*

VOLUME ["/config"]
COPY root /
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
