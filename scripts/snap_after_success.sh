#!/bin/bash --

set -e

mv "results/*.snap" "results/flameshot-app_${VERSION}_${ARCH}.${EXTEN}"

travis_retry bash "${ROOT_PATH}/scripts/services/0x0.st.sh" "results/*.snap"