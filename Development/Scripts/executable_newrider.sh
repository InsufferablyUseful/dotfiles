#!/bin/bash
notify-send "Starting Rider update"
if [ $(distrobox list | grep Rider | wc -l) = '1' ]; then
distrobox stop --yes Rider 
distrobox rm -f Rider
fi
podman pull ghcr.io/insufferablyuseful/boxkit-dotnet:latest
distrobox create --image ghcr.io/insufferablyuseful/boxkit-dotnet:latest --name Rider --home ~/DistroboxHomes/dotnetenv
notify-send "Finished Rider update"
