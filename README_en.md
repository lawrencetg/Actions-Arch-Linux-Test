# Actions-Arch-Linux
This project provides a way to build Arch Linux system that can run directly on FriendlyElec development boards.  
[切换到中文](README.md)  
### The default configuration of the userspace
- Package: Packages in the base group, kernel firmware and utilities, openssh, and haveged
- Account: Username is root, password is fa, A normal user account named alarm is set up, with the password alarm
- Network: The first network interface is configured for DHCP to automatically obtain an IP address
- Login: Serial terminal and SSH login are enabled
- DNS: systemd-resolved management of resolv.conf
- NTP: systemd-timesyncd NTP management
### After booting, initialize the pacman keyring and populate the Arch Linux ARM package signing keys
```
pacman-key --init 
pacman-key --populate archlinuxarm
```
### Running the Alpine from TF Card
Download the image file with “-sd-” in the name, use your preferred flashing tool to write the image file to the TF card, then insert the TF card into the development board. Power on the board, and the Arch Linux system will start.
### Flashing the Alpine to eMMC
Download the image file with “-eflasher-” in the name, use your preferred flashing tool to write the image file to the TF card, then insert the TF card into the development board. Power on the board, and it will automatically flash the system to eMMC. After flashing is complete, removing the TF card will trigger an automatic reboot and boot into the Arch Linux system on eMMC.
### Customizing Arch Linux
- Please refer to this link: https://wiki.friendlyelec.com/wiki/index.php/Getting_Started_with_Arch-Linux
### Release Notes
- 2025/03/14 First release