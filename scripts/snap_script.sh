#!/bin/bash --

set -e

mkdir -p "$TRAVIS_BUILD_DIR/snaps-cache"
sudo snapcraft --use-lxd
