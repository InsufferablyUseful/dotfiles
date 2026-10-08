#!/bin/bash
notify-send "Starting distrobox update"
echo $CR_PAT | podman login ghcr.io -u benrobertson150@hotmail.co.uk --password-stdin'
./newap.sh
./newat.sh
./newrider.sh
notify-send "Distrobox update finished"

