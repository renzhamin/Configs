#!/bin/sh

BASE_DIR="$HOME/archlive/custom/airootfs"
HOME_DIR="$BASE_DIR/root"

cp /etc/pacman.d/mirrorlist "$BASE_DIR/etc/pacman.d/"

mkdir -p "$HOME_DIR/.local/bin"
mkdir -p "$HOME_DIR/.cache"
rsync -a --delete ~/.cache/gitstatus "$HOME_DIR/.cache/"
rsync -a --delete ~/.mozilla "$HOME_DIR/"

cp /usr/bin/{light,networkmanager_dmenu,rofi-bluetooth} "$HOME_DIR/.local/bin/"

cp ~/.fdignore "$HOME_DIR/"
cp ~/.profile "$HOME_DIR/.zprofile"

mkdir -p "$HOME_DIR/.config"
rsync -a --delete ~/.config/{alacritty,gtk-2.0,gtk-3.0,Scripts,nvim,awesome,pcmanfm,redshift,zsh,rofi,tmux} "$HOME_DIR/.config/"
rsync ~/.config/{aliases,aliases_arch,wallpaper.jpeg} "$HOME_DIR/.config/"

rsync -aR --delete ~/.config/./coc/extensions/node_modules/{coc-clangd,coc-snippets,coc-pyright} "${HOME_DIR}/.config/"
cp ~/.config/coc/extensions/package.json.bak "${HOME_DIR}/.config/coc/extensions/package.json"

sed -i 's/local.*browser.*=.*/local browser="firefox"/'  "$HOME_DIR/.config/awesome/keymaps.lua"

# zsh
mkdir -p "$HOME_DIR/.local/share/{zsh,fonts}"
mkdir -p "$HOME_DIR/.cache/zsh"
rsync -a --delete ~/.local/share/zsh/plugins "$HOME_DIR/.local/share/zsh/"
tar xf ~/.config/Configs/fonts.lzma -C "$HOME_DIR/.local/share"

rm $BASE_DIR/etc/systemd/system/multi-user.target.wants/*

# network manager
ln -sf /usr/lib/systemd/system/NetworkManager.service "$BASE_DIR/etc/systemd/system/multi-user.target.wants/NetworkManager.service"
ln -sf /usr/lib/systemd/system/NetworkManager-dispatcher.service "$BASE_DIR/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service"
ln -sf /usr/lib/systemd/system/NetworkManager-wait-online.service "$BASE_DIR/etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service"

ln -sf /usr/bin/nvim "$HOME_DIR/.local/bin/vi"


# startx
echo "exec startx" >> "$HOME_DIR/.zprofile"
echo "exec awesome" > "$HOME_DIR/.xinitrc"

rm "$HOME_DIR/.config/gtk-3.0/bookmarks"
rm -r "$BASE_DIR/etc/systemd/system/cloud-init.target.wants"
sed -i 's:.*xinput.*::g' "${HOME_DIR}/.config/Scripts/autostart.sh"

mkdir -p "$HOME_DIR/Codes/X"
touch "$HOME_DIR/Codes/X/Input.txt"
touch "$HOME_DIR/Codes/X/Output.txt"

echo "[ ! -f /usr/include/c++/11.1.0/x86_64-pc-linux-gnu/bits/stdc++.h.gch ] && g++ --std=c++20 -x c++-header -fsanitize=undefined /usr/include/c++/11.1.0/x86_64-pc-linux-gnu/bits/stdc++.h &" > "${BASE_DIR}/etc/profile"
