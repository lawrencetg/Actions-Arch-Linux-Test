#!/bin/sh

ROOTFS_DIR="$1"

cat << 'EOL' >> ${ROOTFS_DIR}/etc/modules-load.d/r8169.conf
r8169
EOL

cat << 'EOL' >> ${ROOTFS_DIR}/etc/modules-load.d/ledtrig-netdev.conf
ledtrig-netdev
EOL