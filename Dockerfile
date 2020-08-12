FROM ubuntu:xenial

RUN apt-get update && \
    apt-get install -y wget lib32gcc1 lib32tinfo5 unzip

RUN useradd -ms /bin/bash steam

WORKDIR /home/steam

USER steam

RUN wget -O /tmp/steamcmd_linux.tar.gz http://media.steampowered.com/installer/steamcmd_linux.tar.gz && \
    tar -xvzf /tmp/steamcmd_linux.tar.gz && \
    rm /tmp/steamcmd_linux.tar.gz

# Install CSGO
RUN ./steamcmd.sh +login anonymous +force_install_dir ./csgo +app_update 740 validate +quit

ENV CSS_HOSTNAME Counter-Strike GO Dedicated Server

ADD ./entrypoint.sh entrypoint.sh
RUN ln -s /home/steam/linux32/ /home/steam/.steam/sdk32
CMD ./entrypoint.sh
