#!/bin/sh

set -exuo pipefail

# Vars
NVM_VER=0.36.0
VAGRANT_IMAGES=('ubuntu/xenial64' 'ubuntu/bionic64' 'centos/7')
VAGRANT_PLUGINS=('vagrant-reload' 'vagrant-cachier' 'vagrant-vbguest')
DOCKER_IMAGES=('alpine:3' 'ubuntu:xenial' 'ubuntu:bionic'  'nginx:stable-alpine' 'amazonlinux:latest' 'centos:7')

# Command Line Tools
xcode-select --install

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Necessary packages
brew update
brew upgrade
brew tap caskroom/cask
brew tap homebrew/completions
brew bundle

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
mkdir ${HOME}/.miniconda3
curl -o- https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh | bash

# Override .bashrc
cp .bashrc ${HOME}/.bash_profile
cp .bashrc ${HOME}/.bashrc
cp .vimrc ${HOME}/.vimrc
