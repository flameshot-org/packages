#!/bin/bash --

set -e

cp -rf "${ROOT_PATH}"/snap "${SRC_PATH}"
docker run --name snap-builder -v $SRC_PATH:$SRC_PATH -w $SRC_PATH -td $SNAP_DOCKER_REPO
