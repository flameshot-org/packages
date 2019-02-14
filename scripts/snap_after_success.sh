#!/bin/bash --

set -e

echo "File name: flameshot-app_${VERSION}_amd64.${EXTEN} ."

SHA256=$(sha256sum "${RESULT_PATH}/flameshot-app_${VERSION}_amd64.${EXTEN}")
echo "SHA256: ${SHA256} ."

travis_retry bash "${ROOT_PATH}/scripts/services/0x0.st.sh" "${RESULT_PATH}/flameshot-app_${VERSION}_amd64.${EXTEN}"