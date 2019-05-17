#!/bin/sh

#Install Command Line Tools
xcode-select --install

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Necessary packages
brew update
brew upgrade
brew tap caskroom/cask
brew tap homebrew/completions
brew bundle

# Override .bashrc
cp .bashrc $HOME/.bash_profile

# Golang GOPATH
mkdir -p $HOME/.go/{src,pkg,bin}

# pip3 (Python 3)
sudo -H pip3 install --upgrade --no-cache-dir --ignore-installed awscli pip boto3 botocore virtualenv virtualenvwrapper PyYAML setuptools
mkdir $HOME/.virtualenvs

# Get Docker images
docker_images=('alpine:3.9' 'ubuntu:16.04' 'nginx:stable-alpine' 'amazonlinux:latest' 'centos:7')
for docker_image in $docker_images; do
  docker pull $docker_image;
done

# vagrant plugins and boxes download
vagrant_plugins=('vagrant-reload' 'vagrant-cachier' 'vagrant-vbguest')
for vagrant_plugin in $vagrant_plugins; do
  vagrant plugin install $vagrant_plugin;
done

vagrant_images=('ubuntu/xenial64' 'centos/7')
for vagrant_image in $vagrant_images; do
  vagrant box add --provider virtualbox $vagrant_image
done
