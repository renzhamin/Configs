#!/bin/sh

PLUGIN_DIR="$HOME/.local/share/zsh/plugins"

mkdir -p ~/.local/share/{zsh,fonts}
mkdir -p ~/.cache/zsh

mkdir -p "${PLUGIN_DIR}"
cd "${PLUGIN_DIR}"

for i in $(cat ~/.config/zsh/plugins); do
    git clone --depth 1 $i
done

tar xf ~/.config/Configs/fonts.lzma -C ~/.local/share
