#!/bin/bash --

set -e

TEMP_DOWNLOAD_URL=$(travis_retry curl --upload-file \
"${DIST_PATH}"/flameshot_${VERSION}_${ARCH}.${EXTEN} \
"https://transfer.sh/flameshot_${VERSION}_${ARCH}.${EXTEN}")