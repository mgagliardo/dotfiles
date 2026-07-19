#!/bin/sh

set -euo pipefail

# Vars
VAGRANT_PLUGINS=('vagrant-qemu')
BREW_DIR=/opt/homebrew/bin
HEREROCKS_DIR=${HOME}/.local/share/nvim/lazy-rocks/hererocks/bin

# Command Line Tool
xcode-select --install

# Change default terminal because old school
chsh -s /bin/bash

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
cp ./.bash_profile ${HOME}/.bash_profile

# Install feats and magic
brew update
brew upgrade
brew bundle

# Create dirs
mkdir -p ${HOME}/.local/bin ${HOME}/.config

# Vagrant
for vagrant_plugin in ${VAGRANT_PLUGINS[@]}; do
  vagrant plugin install $vagrant_plugin;
done

# Override .config & .bash_profile
cp -R ./.bash_profile ./.config ${HOME}/

# NeoVim configs
mkdir -p ${HEREROCKS_DIR} 
ln -s ${BREW_DIR}/lua ${HEREROCKS_DIR}/lua
ln -s ${BREW_DIR}/luarocks ${HEREROCKS_DIR}/luarocks

# Tmux
cp .tmux.conf ${HOME}/
mkdir -p ${HOME}/.tmux/plugins ${HOME}/.config/tmux/plugins/tmux-plugins/ ${HOME}/.config/tmux/plugins/catpuccin
git clone git@github.com:tmux-plugins/tmux-cpu.git ${HOME}/.config/tmux/plugins/tmux-plugins/
git clone git@github.com:tmux-plugins/tmux-battery.git ${HOME}/.config/tmux/plugins/tmux-plugins/
git clone -b v2.1.3 git@github.com:catppuccin/tmux.git ${HOME}/.config/tmux/plugins/catppuccin/tmux
