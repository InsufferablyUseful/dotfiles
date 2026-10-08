#!/bin/bash
notify-send "Starting AlpineApps update"
if [ $(distrobox list | grep AlpineApps | wc -l) = '1' ]; then
	distrobox stop --yes AlpineApps
	distrobox rm -f AlpineApps
fi
podman pull ghcr.io/insufferablyuseful/boxkit-apps:latest
distrobox create --image ghcr.io/insufferablyuseful/boxkit-apps:latest --name AlpineApps
distrobox enter AlpineApps -- /opt/alpine-export.sh
notify-send "Finished AlpineApps update"
