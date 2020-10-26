#!/bin/bash

function main() {
    export URL_PACKETTRACER="https://archive.org/download/packet-tracer-731-amd-64/PacketTracer_731_amd64.deb"
    export FILENAME=$(basename $URL_PACKETTRACER)
    alias sum=md5sum ${FILENAME} 
    
    #if [[ -e ${FILENAME} && sum == `md5sum ${FILENAME}` ]]
    #then
    #    echo "done"
    #else
    #	wget ${URL_PACKETTRACER}
    #	echo "done"
    #fi

    apt install ./${FILENAME} -y
    cp /opt/pt/bin/{libQt5WebEngineWidgets,libQt5PrintSupport,libQt5Svg,libQt5Widgets,libQt5WebEngineCore,libQt5Gui,libQt5WebSockets,libQt5WebChannel,libQt5Network,libQt5Xml,libQt5Script,libQt5ScriptTools,libQt5Sql,libQt5Core,libQt5Multimedia,libQt5Quick,libQt5QuickWidgets,libQt5Positioning,libQt5Qml}.so.5 /lib/x86_64-linux-gnu/
    cp /opt/pt/bin/{libicui18n,libicuuc,libicudata}.so.64 /lib/x86_64-linux-gnu/
    mv /opt/pt/bin/libcrypto.so.1.1 /lib/x86_64-linux-gnu/libcrypto.so.1.1
    /bin/bash
}

main
