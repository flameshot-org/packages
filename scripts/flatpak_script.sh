#!/bin/bash --

set -e

docker exec -i flatpak-builder sh -c "flatpak-builder build ${SRC_PATH}/flatpak/gnome/org.dharkael.Flameshot.yaml"
