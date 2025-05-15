
#!/usr/bin/with-contenv bash

# Check CPU architecture
ARCH=$(uname -m)

echo -e "${INFO} Check CPU architecture ..."
if [[ ${ARCH} == "x86_64" ]]; then
    ARCH="qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip"
elif [[ ${ARCH} == "armv7l" ]]; then
    ARCH="qbittorrent-enhanced-nox_arm-linux-musleabi_static.zip"
elif [[ ${ARCH} == "aarch64" ]]; then
    ARCH="qbittorrent-enhanced-nox_aarch64-linux-musl_static.zip"    
else
    echo -e "${ERROR} This architecture is not supported."
    exit 1
fi

# Download files
echo "Downloading binary file: ${ARCH}"
TAG=$(cat /qbittorrent/ReleaseTag)
echo "qbittorrent version: ${TAG}"
curl -L -o ${PWD}/qbittorrentee.zip https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-$TAG/$ARCH

echo "Download binary file: ${ARCH} completed"

unzip qbittorrentee.zip

# Download VueTorrent WebUI
echo "Downloading WebUI VueTorrent"
mkdir -p ${PWD}/qbui
curl -o ${PWD}/qbui/vurtorrent.zip -L https://github.com/VueTorrent/VueTorrent/releases/download/v2.24.2/vuetorrent.zip
echo "Download VueTorrent completed"
cd ${PWD}/qbui
unzip vurtorrent.zip
