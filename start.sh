#!/bin/sh

set -euo pipefail

# Vars
NVM_VER=0.36.0
VAGRANT_PLUGINS=('vagrant-reload' 'vagrant-cachier' 'vagrant-vbguest')
VAGRANT_IMAGES=('ubuntu/jammy64' 'generic/oracle8')
DOCKER_IMAGES=('alpine:3.14' 'ubuntu:22.04' 'amazonlinux:2' 'oraclelinux:9-slim')

# Command Line Tool
xcode-select --install

# Brew
sudo mkdir -p /usr/local/Homebrew
sudo chown -R $(whoami) /usr/local/Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Necessary packages
brew update
brew upgrade
brew tap homebrew/cask
brew bundle

# Local
mkdir -p ${HOME}/.local/bin

# Golang GOPATH
mkdir -p ${HOME}/.go/{src,pkg,bin}

# pip3
sudo -H pip3 install --upgrade --no-cache-dir --ignore-installed pip boto3 botocore PyYAML setuptools

# Docker
for docker_image in ${DOCKER_IMAGES[@]}; do
  docker pull ${docker_image};
done

# Vagrant
for vagrant_image in ${VAGRANT_IMAGES[@]}; do
  vagrant box add --provider virtualbox ${vagrant_image};
done

for vagrant_plugin in ${VAGRANT_PLUGINS[@]}; do
  vagrant plugin install $vagrant_plugin;
done

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VER}/install.sh | bash
nvm install --lts
nvm use --lts

# Python
curl -sSL https://install.python-poetry.org | python3 -

# Override .bashrc
cp .bashrc ${HOME}/.bash_profile
cp .bashrc ${HOME}/.bashrc
cp .vimrc ${HOME}/.vimrc
