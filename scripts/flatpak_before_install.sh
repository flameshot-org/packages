#!/bin/bash --

set -e

cp -rf "${ROOT_PATH}"/flatpak "${SRC_PATH}"
# --privileged gives too many permissions to the container.
# FUSE functionality needs in fact only the following permissions:
# SYS_ADMIN is needed for mount/umount functionality, 
# and /dev/fuse exposes the FUSE device to the container.
# reference: https://github.com/s3fs-fuse/s3fs-fuse/issues/647#issuecomment-392697838
docker run --privileged --name flatpak-builder -v $SRC_PATH:$SRC_PATH -w $SRC_PATH -td $FLATPAK_DOCKER_REPO /bin/bash
