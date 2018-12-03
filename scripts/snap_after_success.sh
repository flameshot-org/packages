#!/bin/bash --

set -e

TEMP_DOWNLOAD_URL=$(travis_retry curl --upload-file \
		results/*.snap \
		"https://transfer.sh/flameshot_${VERSION}_amd64.${EXTEN}")