#!/bin/bash
notify-send "Starting AlpineTerminal update"
if [ $(distrobox list | grep AlpineTerminal | wc -l) = '1' ]; then
distrobox stop --yes AlpineTerminal 
distrobox rm -f AlpineTerminal
fi
podman pull ghcr.io/insufferablyuseful/boxkit:latest
distrobox create --image ghcr.io/insufferablyuseful/boxkit:latest --name AlpineTerminal
distrobox enter AlpineTerminal -- /opt/alpineexport.sh
notify-send "Finished AlpineTerminal update"
