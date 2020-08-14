FROM ubuntu:xenial

RUN apt-get update && \
    apt-get install -y wget lib32gcc1 lib32tinfo5 unzip

RUN useradd -ms /bin/bash steam


#Steamcmd installation
RUN mkdir -p /server/steamcmd
RUN mkdir -p /server/csgo
WORKDIR /server/steamcmd
RUN wget http://media.steampowered.com/client/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz

#Server Start
WORKDIR /server/csgo
ADD start.sh /server/csgo/start.sh
RUN chmod 755 /server/csgo/start.sh

CMD ["/server/csgo/start.sh"]
