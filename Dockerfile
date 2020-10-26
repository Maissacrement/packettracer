FROM ubuntu:20.04

#WORKDIR /app
# ----------- Packet tracer --------------
ENV PACKETTRACER_VERSION 731
ENV PACKETTRACER "https://archive.org/download/packet-tracer-${PACKETTRACER_VERSION}-amd-64/PacketTracer_${PACKETTRACER_VERSION}_amd64.deb"
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install libglib2.0-0 wget qt5-default -y

RUN wget --show-progress http://archive.ubuntu.com/ubuntu/pool/main/g/gtk+3.0/gtk-update-icon-cache_3.22.30-1ubuntu1_amd64.deb &&\
    echo "gtk icon cache done"

RUN wget --show-progress ${PACKETTRACER}

RUN apt-get -f install -y sudo dialog xdg-utils \
	libgl1-mesa-glx libpulse0 libnss3 \ 
        libasound2 libxslt1.1 libxkbcommon-x11-0 

COPY ./Entrypoint.sh .
RUN apt install ./gtk-update-icon-cache_3.22.30-1ubuntu1_amd64.deb -y --allow-downgrades
RUN apt upgrade -y 
CMD ["/bin/bash", "./Entrypoint.sh"]
