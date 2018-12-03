#!/bin/bash --

set -e

docker exec -i snap-builder apt update
docker exec -i snap-builder sh -c "apt install -y snapcraft build-essential g++"
docker exec -i snap-builder sh -c "apt autoclean -y && apt clean -y"