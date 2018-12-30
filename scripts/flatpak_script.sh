#!/bin/bash --

set -e

if [[ "${RUN_TIME}" == "gnome" ]]; then 
	docker exec -i flatpak-builder sh -c "flatpak-builder build ${SRC_PATH}/flatpak/gnome/org.dharkael.Flameshot.yaml" 
elif [[ "${RUN_TIME}" == "kde" ]]; then 
	docker exec -i flatpak-builder sh -c "flatpak-builder build ${SRC_PATH}/flatpak/kde/org.dharkael.Flameshot.yaml" 
elif [[ "${RUN_TIME}" == "freedesktop" ]]; then 
	docker exec -i flatpak-builder sh -c "flatpak-builder build ${SRC_PATH}/flatpak/freedesktop/org.dharkael.Flameshot.yaml" 
fi

