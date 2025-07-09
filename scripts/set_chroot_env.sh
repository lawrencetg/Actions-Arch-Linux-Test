#!/bin/bash

# __tzs_mount_chroot_env() {
#     mkdir -p $1/tmp
#     mount -t tmpfs tmpfs $1/tmp
#     mount -o bind /proc $1/proc
#     mount -o bind /sys $1/sys
#     mount -o bind /dev/ $1/dev/
#     mount -o bind /dev/pts $1/dev/pts
#     mount -o bind /run $1/run
#     mount -o bind /etc/resolv.conf $1/etc/resolv.conf
#     if [[ -z "$USING_APT_CACHE" ]]; then
#         echo "Using apt cache: Disable"
#     else
#         echo "Using apt cache: $USING_APT_CACHE"
#         mkdir -p $USING_APT_CACHE
#         mount -o bind $USING_APT_CACHE $1/var/cache/apt/archives
#     fi
#     trap 'echo "Unmounting filesystem...";umount_chroot_env $1;export get_int=true' INT
# }

# __tzs_umount_chroot_env() {
#     umount -l $1/etc/resolv.conf 2>/dev/null
#     umount -l $1/tmp 2>/dev/null
#     umount -l $1/dev/pts 2>/dev/null
#    umount -l $1/dev/ 2>/dev/null
#    umount -l $1/sys 2>/dev/null
#    umount -l $1/proc 2>/dev/null
#    umount -l $1/run 2>/dev/null
#    rm -rf $1/tmp/*
#    umount -l $1/var/cache/apt/archives 2>/dev/null
#}

mount_chroot_env()
{
    local target=$1

    [ -d $target/tmp ] || mkdir -m 1777 $target/tmp

    mount -t proc proc $target/proc
    mount -o bind /sys $target/sys
    mount -o bind /dev/ $target/dev/
    mount -o bind /dev/pts $target/dev/pts

    #if [[ -z "$USING_APT_CACHE" ]]; then
    #    echo "Using apt cache: Disable"
    #else
    #    echo "Using apt cache: $USING_APT_CACHE"
    #    mkdir -p $USING_APT_CACHE
    #    mount -o bind $USING_APT_CACHE $target/var/cache/apt/archives
    #fi

    trap 'umount_chroot_env $target' INT TERM EXIT
}

umount_chroot_env()
{
    local target=$1

    umount -l $target/dev/pts 2>/dev/null
    umount -l $target/dev 2>/dev/null
    umount -l $target/sys 2>/dev/null
    umount -l $target/proc 2>/dev/null
    # umount -l $target/var/cache/apt/archives

    trap - INT TERM EXIT
}

#if [[ -z "$USING_APT_CACHE" ]]; then
#	echo "tip: export USING_APT_CACHE=/path/to/cache"
#fi
