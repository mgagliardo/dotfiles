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
cp ./.bash_profile ${HOME}/.bash_profile
cp ./.vimrc ${HOME}/.vimrc
cp -R ./.config ${HOME}/
