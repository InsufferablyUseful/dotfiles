#!/bin/bash
if [ $(distrobox list | grep Rider | wc -l) = '1' ]; then
distrobox rm Rider
fi
podman pull ghcr.io/insufferablyuseful/boxkit-dotnet:latest
distrobox create --image ghcr.io/insufferablyuseful/boxkit-dotnet:latest --name Rider --home ~/DistroboxHomes/dotnetenv
