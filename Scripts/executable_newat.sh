#!/bin/bash
if [ $(distrobox list | grep AlpineTerminal | wc -l) = '1' ]; then
distrobox rm AlpineTerminal
fi
podman pull ghcr.io/insufferablyuseful/boxkit:latest
distrobox create --image ghcr.io/insufferablyuseful/boxkit:latest --name AlpineTerminal
