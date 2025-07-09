#!/bin/bash
set -e

# 定义变量
IMG_FILE="test_exfat.img"
IMG_SIZE="100M"
MOUNT_POINT="/mnt/exfat_test_mount"

echo "创建 $IMG_SIZE 的空白镜像文件: $IMG_FILE"
dd if=/dev/zero of="$IMG_FILE" bs=1M count=100

echo "关联 loop 设备..."
LOOP_DEV=$(losetup --show -f "$IMG_FILE")
echo "Loop 设备: $LOOP_DEV"

echo "格式化为 exFAT..."
mkfs.exfat "$LOOP_DEV"

echo "创建挂载目录: $MOUNT_POINT"
mkdir -p "$MOUNT_POINT"

echo "挂载 exFAT 文件系统..."
if command -v mount.exfat-fuse >/dev/null 2>&1; then
    echo "使用 exfat-fuse 挂载..."
    mount.exfat-fuse "$LOOP_DEV" "$MOUNT_POINT"
else
    echo "使用内核 exFAT 支持挂载..."
    mount -t exfat "$LOOP_DEV" "$MOUNT_POINT"
fi

echo "写入测试文件..."
echo "Hello, exFAT test!" > "$MOUNT_POINT/test_file.txt"

echo "挂载内容:"
ls -l "$MOUNT_POINT"

echo "测试完成，准备卸载..."
umount "$MOUNT_POINT"

echo "释放 loop 设备..."
losetup -d "$LOOP_DEV"

echo "删除挂载目录..."
rmdir "$MOUNT_POINT"

echo "删除 img 文件..."
rm -f "$IMG_FILE"

echo "所有清理完成！测试结束 ✅"