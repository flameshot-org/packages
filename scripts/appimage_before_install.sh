#!/bin/bash --

set -e

git clone https://github.com/lupoDharkael/flameshot

# Get linuxdeployqt tool
travis_retry wget \
	-c "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage" \
	-O linuxdeployqt
chmod +x linuxdeployqt
