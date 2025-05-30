#!/bin/sh

ROOTFS_DIR="$1"

cat << 'EOL' >> ${ROOTFS_DIR}/etc/modprobe.d/blacklist.conf
blacklist rtw_8822c
blacklist rtw_8821cs
blacklist rtw_8822cs
blacklist rtw_8822ce
blacklist r8169
EOL

cat << 'EOL' >> ${ROOTFS_DIR}/etc/modules-load.d/ledtrig-netdev.conf
ledtrig-netdev
EOL

cat << 'EOL' >> ${ROOTFS_DIR}/etc/modules-load.d/r8125.conf
r8125
EOL