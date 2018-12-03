#!/bin/bash --

set -e

cd "${SRC_PATH}"
APPIMAGE_DST_PATH="${SRC_PATH}"/appimage-build
BUILD_DST_PATH="${SRC_PATH}"/build
DIST_PATH="${SRC_PATH}"/dist

mkdir "${APPIMAGE_DST_PATH}"
mkdir "${BUILD_DST_PATH}"
mkdir "${DIST_PATH}"

qmake -makefile DESTDIR="${BUILD_DST_PATH}" "${SRC_PATH}"/flameshot.pro
# Building flameshot
make -j$(nproc)

# Packaging AppImage using linuxdeployqt
mkdir -p "${APPIMAGE_DST_PATH}"/appdir/usr/bin
mkdir -p "${APPIMAGE_DST_PATH}"/appdir/usr/share/applications
mkdir -p "${APPIMAGE_DST_PATH}"/appdir/usr/share/dbus-1/interfaces
mkdir -p "${APPIMAGE_DST_PATH}"/appdir/usr/share/dbus-1/services
mkdir -p "${APPIMAGE_DST_PATH}"/appdir/usr/share/metainfo
mkdir -p "${APPIMAGE_DST_PATH}"/appdir/usr/share/bash-completion/completions
mkdir -p "${APPIMAGE_DST_PATH}"/appdir/usr/share/flameshot/translations

cp \
	"${BUILD_DST_PATH}"/flameshot \
	"${APPIMAGE_DST_PATH}"/appdir/usr/bin/
cp \
	"${SRC_PATH}"/dbus/org.dharkael.Flameshot.xml \
	"${APPIMAGE_DST_PATH}"/appdir/usr/share/dbus-1/interfaces/
cp \
	"${SRC_PATH}"/dbus/package/org.dharkael.Flameshot.service \
	"${APPIMAGE_DST_PATH}"/appdir/usr/share/dbus-1/services/
cp \
	"${SRC_PATH}"/docs/appdata/flameshot.appdata.xml \
	"${APPIMAGE_DST_PATH}"/appdir/usr/share/metainfo/
cp \
	"${SRC_PATH}"/docs/bash-completion/flameshot \
	"${APPIMAGE_DST_PATH}"/appdir/usr/share/bash-completion/completions/
cp \
	"${SRC_PATH}"/translations/*.qm \
	"${APPIMAGE_DST_PATH}"/appdir/usr/share/flameshot/translations/
cp \
	"${SRC_PATH}"/docs/desktopEntry/package/* \
	"${APPIMAGE_DST_PATH}"/appdir/usr/share/applications/
cp \
	"${SRC_PATH}"/img/app/flameshot.png \
	"${APPIMAGE_DST_PATH}"/appdir/

ls -alhR "${APPIMAGE_DST_PATH}"/appdir

# Copy other project files
cp "${SRC_PATH}"/README.md "${APPIMAGE_DST_PATH}"/appdir/README.md
cp "${SRC_PATH}"/LICENSE "${APPIMAGE_DST_PATH}"/appdir/LICENSE
echo "${VERSION}" > "${APPIMAGE_DST_PATH}"/appdir/version
echo `git describe --always` >> "${APPIMAGE_DST_PATH}"/appdir/version

# Configure env vars
unset QTDIR
unset QT_PLUGIN_PATH
unset LD_LIBRARY_PATH

# Packaging
# -verbose=2
"${ROOT_PATH}"/linuxdeployqt "${APPIMAGE_DST_PATH}"/appdir/usr/bin/flameshot -bundle-non-qt-libs

rm -f "${APPIMAGE_DST_PATH}"/appdir/usr/lib/libatk-1.0.so.0
cp \
	/usr/lib/x86_64-linux-gnu/qt5/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so \
	"${APPIMAGE_DST_PATH}"/appdir/usr/plugins/platforminputcontexts/
cd "${APPIMAGE_DST_PATH}"/appdir/usr/bin
ln -sf ../plugins/platforms/ .   # An unknown bug
ln -sf ../share/flameshot/translations/ . # add translation soft link 
cd "${SRC_PATH}"

# -verbose=2
"${ROOT_PATH}"/linuxdeployqt "${APPIMAGE_DST_PATH}"/appdir/usr/share/applications/flameshot.desktop -appimage

ls -alhR -- *.AppImage

# Rename AppImage and move AppImage to DIST_PATH 
mv Flameshot-${VERSION}-${ARCH}.AppImage "${APPIMAGE_DST_PATH}"/flameshot_${VERSION}_${ARCH}.AppImage
cd ..
cp \
	"${APPIMAGE_DST_PATH}"/flameshot_${VERSION}_${ARCH}.AppImage \
	"${DIST_PATH}"/flameshot_${VERSION}_${ARCH}.${EXTEN}
pwd
