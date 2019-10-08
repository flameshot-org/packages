#!/bin/bash --

set -e

DIST_PATH="${SRC_PATH}"/dist
mkdir "${DIST_PATH}"

if [[ "${RUN_TIME}" == "gnome" ]]; then 
	docker exec -i flatpak-builder sh -c "flatpak-builder build ${SRC_PATH}/flatpak/gnome/org.dharkael.Flameshot.yaml" 
elif [[ "${RUN_TIME}" == "kde" ]]; then 
	docker exec -i flatpak-builder sh -c "flatpak-builder --repo=repo --force-clean flameshot-app-dir ${SRC_PATH}/flatpak/kde/org.dharkael.Flameshot.yaml" 
	docker exec -i flatpak-builder sh -c "flatpak --user remote-add --no-gpg-verify flameshot-repo repo" 
	docker exec -i flatpak-builder sh -c "flatpak build-bundle ${SRC_PATH}/repo flameshot.flatpak org.dharkael.Flameshot --runtime-repo=https://flathub.org/repo/flathub.flatpakrepo"
	docker exec -i flatpak-builder sh -c "cp ${SRC_PATH}/flameshot.flatpak ${DIST_PATH}/flameshot_${VERSION}_${ARCH}.${EXTEN}"
elif [[ "${RUN_TIME}" == "freedesktop" ]]; then 
	docker exec -i flatpak-builder sh -c "flatpak-builder build ${SRC_PATH}/flatpak/freedesktop/org.dharkael.Flameshot.yaml" 
fi

