#!/bin/bash --

set -e

travis_retry bash "${ROOT_PATH}/scripts/services/0x0.st.sh" "${DIST_PATH}/flameshot_${VERSION}_${ARCH}.${EXTEN}"