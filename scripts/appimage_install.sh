#!/bin/bash --

set -e

sudo apt update
# Compile-time
sudo apt install -y gcc g++ build-essential qt5-default qt5-qmake qttools5-dev-tools
# Run-time
sudo apt install -y libqt5dbus5 libqt5network5 libqt5core5a libqt5widgets5 libqt5gui5 libqt5svg5-dev
# Optional
sudo apt install -y openssl ca-certificates
# Install fcitx-frontend-qt5
sudo apt install -y fcitx-frontend-qt5
