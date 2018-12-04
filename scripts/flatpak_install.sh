#!/bin/bash --

set -e

docker exec -i flatpak-builder dnf -y update

# Install Flatpak and dependencies
docker exec -i flatpak-builder sh -c "dnf install -y flatpak flatpak-builder ostree fuse wget curl git bzip2 dconf bzr elfutils"
docker exec -i flatpak-builder sh -c "dnf clean all"

# Install runtimes, merged into one layer because of xattr attributes
docker exec -i flatpak-builder sh -c "flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo"
docker exec -i flatpak-builder sh -c "flatpak install -y flathub org.gnome.Platform//3.30"
docker exec -i flatpak-builder sh -c "flatpak install -y flathub org.gnome.Sdk//3.30"