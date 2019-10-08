#!/bin/bash --

set -e

RESULT_SNAP=$(find ./ -name "*.snap")

if [[ $TRAVIS_PULL_REQUEST != "false" ]]; then
  TRANSFER_SNAP="${RESULT_SNAP%%.snap}-pr$TRAVIS_PULL_REQUEST.snap"
  mv "$RESULT_SNAP" "$TRANSFER_SNAP"
  RESULT_SNAP="$TRANSFER_SNAP"
fi

SHA256=$(sha256sum "$RESULT_SNAP")
echo "SHA256: ${SHA256} ."

timeout 240 /snap/bin/transfer "$RESULT_SNAP"

# https://0x0.st
# travis_retry bash "${ROOT_PATH}/scripts/services/0x0.st.sh" "${RESULT_SNAP}"

# https://wetransfer.com
travis_retry bash "${ROOT_PATH}/scripts/services/wetransfer.com.sh" "${RESULT_SNAP}"