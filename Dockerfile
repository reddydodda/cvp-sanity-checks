FROM ubuntu:16.04

USER root

WORKDIR /var/lib/

RUN mkdir -p cvp-sanity/

COPY . cvp-sanity/

RUN apt-get update && \
    apt-get install -y python-pip git curl wget vim inetutils-ping libsasl2-dev python-dev libldap2-dev libssl-dev && \
    python -m pip install --upgrade pip && \
    pip install -r cvp-sanity/requirements.txt && \
    apt-get -y autoremove; apt-get -y clean

RUN rm -rf /root/.cache && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

ENTRYPOINT ["/bin/bash"]
