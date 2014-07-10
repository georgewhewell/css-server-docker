# Imagem para servidor de CS Source.

FROM debian:wheezy

MAINTAINER Flaudísio Tolentino <flaudisio@gmail.com>

# Sistema
RUN apt-get -q update && \
    apt-get -q -y --no-install-recommends install lib32gcc1

# SteamCMD
ADD http://media.steampowered.com/installer/steamcmd_linux.tar.gz /tmp/steamcmd.tgz

RUN mkdir -p /steamcmd && \
    tar xzf /tmp/steamcmd.tgz -C /steamcmd

# Ambiente
ENV STEAMUSER steamcmd
ENV STEAMCMDDIR /steamcmd
ENV STEAMCMD /steamcmd/steamcmd.sh
ENV SERVERDIR /css-server

# Configurações e scripts
ADD cfg/ /cfg
ADD scripts/manage-server.sh /usr/bin/manage-server
ADD scripts/setup-server.sh /usr/bin/setup-server
ADD scripts/css.sh /usr/sbin/css

# Bootstrap
RUN setup-server

# Limpeza
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


EXPOSE 27015
EXPOSE 27000/udp 27001/udp 27002/udp 27003/udp 27004/udp 27005/udp 27006/udp 27007/udp
EXPOSE 27008/udp 27009/udp 27010/udp 27011/udp 27012/udp 27013/udp 27014/udp 27015/udp

CMD ["css", "start"]
