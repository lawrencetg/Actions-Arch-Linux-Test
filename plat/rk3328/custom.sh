#!/bin/sh

ROOTFS_DIR="$1"

cat << 'EOL' >> ${ROOTFS_DIR}/etc/modules-load.d/r8152.conf
r8152
EOL

cat << 'EOL' >> ${ROOTFS_DIR}/etc/modules-load.d/ledtrig-netdev.conf
ledtrig-netdev
EOL