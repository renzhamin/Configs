timedatectl set-ntp true
# echo "Server = http://mirror.xeonbd.com/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
mount -t 9p -o trans=virtio /hostshare /shared
cp /shared/mirrorlist /etc/pacman.d/
