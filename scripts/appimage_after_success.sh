#!/bin/bash --

set -e

echo "File name: flameshot_${VERSION}_${ARCH}.${EXTEN} ."

SHA256=$(sha256sum "${DIST_PATH}/flameshot_${VERSION}_${ARCH}.${EXTEN}")
echo "SHA256: ${SHA256} ."

travis_retry bash "${ROOT_PATH}/scripts/services/0x0.st.sh" "${DIST_PATH}/flameshot_${VERSION}_${ARCH}.${EXTEN}"