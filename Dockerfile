FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y \
        curl \
        wget \
        tar \
        ca-certificates \
        libc6:i386 \
        libstdc++6:i386 \
        libgcc-s1:i386 \
        libcurl4:i386 \
        lib32gcc-s1 \
        lib32stdc++6 && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/container/steamcmd && \
    cd /home/container/steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xzf steamcmd_linux.tar.gz && \
    chmod +x steamcmd.sh

RUN rm -f /home/container/steamcmd/linux32/libcurl.so* && \
    rm -f /home/container/steamcmd/linux32/libstdc++.so.6

WORKDIR /home/container

CMD ["/bin/bash"]
