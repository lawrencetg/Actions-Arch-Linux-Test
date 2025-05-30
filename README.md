# Actions-Arch-Linux
此项目用于构建可直接运行在友善电子开发板上的Arch Linux系统。  
[Switch to English](README_en.md)  
### 用户空间的默认配置
- 软件包: 基础组中的软件包、内核固件和实用程序、openssh 和 haveged
- 帐号：root用户名密码为fa, 额外设置一个名为alarm的普通用户帐户，密码为alarm
- 网络：已配置第一个网口为dhcp自动获取IP地址
- 登录：已启用串口终端和SSH登录
- DNS: systemd-resolved 管理 resolv.conf
- NTP: systemd-timesyncd NTP 管理
### 启动后，初始化 pacman 密钥环并填充 Arch Linux ARM包签名密钥
```
pacman-key --init 
pacman-key --populate archlinuxarm
```
### 通过TF卡运行系统
下载带 "-sd-" 字样的镜像文件，使用你熟悉的写卡工具将镜像文件写入TF卡，然后将TF卡插入开发板，上电启动开发板即可启动Arch Linux系统。
### 烧写系统到eMMC运行
下载带 "-eflasher-" 字样的镜像文件，使用你熟悉的写卡工具将镜像文件写入TF卡，然后将TF卡插入开发板，上电启动开发板，会自动烧写系统到eMMC，烧写完成后，拨出TF卡会自动重启并进入eMMC中的Arch Linux系统。
### 定制 Arch Linux 系统
- 请参考这里: https://wiki.friendlyelec.com/wiki/index.php/Getting_Started_with_Arch-Linux/zh
### 更新说明
* 2025/05/30 首次发布
