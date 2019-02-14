#!/bin/bash --

set -e
docker exec -i snap-builder snapcraft clean
docker exec -i snap-builder snapcraft

# docker exec -i snap-builder snapcraft enable-ci travis --refresh

# move snap package
RESULT_PATH="${SRC_PATH}"/results
mkdir "${RESULT_PATH}"

cd flameshot
docker exec -i snap-builder sh -c "mv flameshot*.snap flameshot-app_amd64.snap"
# docker cp still doesn't support wildcards
docker cp snap-builder:$SRC_PATH/flameshot-app_amd64.snap $RESULT_PATH/flameshot-app_${VERSION}_amd64.snap
