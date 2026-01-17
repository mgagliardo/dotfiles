#!/bin/sh

set -euo pipefail

# Vars
VAGRANT_PLUGINS=('vagrant-qemu')
VAGRANT_IMAGES=('perk/ubuntu-2204-arm64')

# Command Line Tool
xcode-select --install

# Change default terminal because I live in 1990
chsh -s /bin/bash

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
cp ./.bash_profile ${HOME}/.bash_profile
source ${HOME}/.bash_profile

# Brewww
brew update
brew upgrade
brew bundle

# Local
mkdir -p ${HOME}/.local/bin

# Vagrant
for vagrant_plugin in ${VAGRANT_PLUGINS[@]}; do
  vagrant plugin install $vagrant_plugin;
done

for vagrant_image in ${VAGRANT_IMAGES[@]}; do
  vagrant box add ${vagrant_image};
done

# Override .bash_profile
cp -R ./.config ${HOME}/

# NeoVim configs
BREW_DIR=/opt/homebrew/bin
HEREROCKS_DIR=${HOME}/.local/share/nvim/lazy-rocks/hererocks/bin
mkdir -p ${HEREROCKS_DIR}
ln -s ${BREW_DIR}/lua ${HEREROCKS_DIR}/lua
ln -s ${BREW_DIR}/luarocks ${HEREROCKS_DIR}/luarocks

# Tmux
cp .tmux.conf ${HOME}/
mkdir -p ${HOME}/.tmux/plugins ${HOME}/.config/tmux/plugins/tmux-plugins/ ${HOME}/.config/tmux/plugins/catpuccin
git clone git@github.com:tmux-plugins/tmux-cpu.git ${HOME}/.config/tmux/plugins/tmux-plugins/
git clone git@github.com:tmux-plugins/tmux-battery.git ${HOME}/.config/tmux/plugins/tmux-plugins/
git clone -b v2.1.3 git@github.com:catppuccin/tmux.git ${HOME}/.config/tmux/plugins/catppuccin/tmux

