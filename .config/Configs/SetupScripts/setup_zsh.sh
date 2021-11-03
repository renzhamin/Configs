#!/bin/sh

PLUGIN_DIR="$HOME/.local/share/zsh/plugins"

mkdir -p ~/.local/share/{zsh,fonts}
mkdir -p ~/.cache/zsh

mkdir -p "${PLUGIN_DIR}"
cd "${PLUGIN_DIR}"

git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git

git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git

git clone --depth 1 https://github.com/hlissner/zsh-autopair.git

git clone --depth 1 https://github.com/xPMo/zsh-toggle-command-prefix.git

git clone --depth 1 https://github.com/skywind3000/z.lua.git

git clone --depth 1 https://github.com/romkatv/powerlevel10k

tar xvf ~/.config/Configs/fonts.lzma -C ~/.local/share
