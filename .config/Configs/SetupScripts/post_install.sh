host="arch"
username="markas"

echo "/hostshare /shared 9p trans=virtio,version=9p2000.L,rw 0 0" >> /etc/fstab

ln -sf /usr/share/zoneinfo/Asia/Dhaka /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "${host}" > /etc/hostname
echo "127.0.0.1 localhost" > /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 ${host}.localdomain ${host}" >> /etc/hosts

useradd ${username}
usermod -aG wheel ${username}
pacman -S --noconfirm --needed xorg-server xorg-xrandr
echo "xrandr -s 1366x768 >& /dev/null" >> /etc/profile
pacman -S --noconfirm --needed net-tools sudo grub efibootmgr dhcpcd
systemctl enable dhcpcd
# systemctl enable lightdm.service dhcpcd
# groupadd -r autologin
# gpasswd -a ${username} autologin

# sed -i 's+#greeter-session=.*+greeter-session=lightdm-gtk-greeter+g' /etc/lightdm/lightdm.conf
sed -i 's+# %wheel ALL=(ALL) ALL+ %wheel ALL=(ALL) ALL+g' /etc/sudoers
## autologin
# sed -i "s+#autologin-user=+autologin-user=${username}+g" /etc/lightdm/lightdm.conf
###
## grub
# grub-install --target="i386-pc" /dev/sda
grub-install --target=x86_64-efi --efi-directory=boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
##
