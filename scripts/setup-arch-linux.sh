#!/bin/sh
export LANG="en_US.UTF-8"
export LANGUAGE=en_US:en
export LC_NUMERIC="C"
export LC_CTYPE="C"
export LC_MESSAGES="C"
export LC_ALL="C"

pacman-key --init
pacman-key --populate archlinuxarm
pacman -Syu --noconfirm
pacman -Sy bash-completion nano openssh sudo vim --noconfirm
ln -s /dev/null /etc/udev/rules.d/80-net-setup-link.rules


# sshd configuration
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# enable serial console
echo "ttyFIQ0::respawn:/sbin/agetty -L 1500000 ttyFIQ0 vt100" >> /etc/inittab
echo "ttyFIQ0" >> /etc/securetty

# root password
echo "root:fa" | chpasswd

echo "$(date +%Y%m%d)" > /etc/rom-version
[ -e /lib/firmware ] || mkdir -p /lib/firmware
[ -e /lib/modules ] || mkdir -p /lib/modules

# Set hostname
echo "arch-linux" > /etc/hostname
cat << 'EOL' > /etc/hosts
127.0.0.1       arch-linux.my.domain arch-linux localhost.localdomain localhost
::1             localhost localhost.localdomain
EOL