#!/bin/sh

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Necessary packages
brew update
brew upgrade
brew tap caskroom/cask
brew tap homebrew/completions
brew bundle

# Override .bashrc
cp .bashrc $HOME/.bashrc

# Golang GOPATH
mkdir $HOME/.go

# pip
sudo easy_install pip
sudo pip install --upgrade --no-cache-dir --ignore-installed awscli pip boto3 botocore virtualenv PyYAML setuptools

# Get latest Docker images
docker_images = [ 'alpine:3.6', 'ubuntu:14.04', 'ubuntu:16.04' ]
for docker_image in docker_images; do
  docker pull $docker_image;
done

# vagrant plugins and boxes download
vagrant_plugins = [ 'vagrant-reload', 'vagrant-cachier' ]
for vagrant_plugin in vagrant_plugins; do
  vagrant plugin install $vagrant_plugin;
done

vagrant_images = [ 'ubuntu/trusty64', 'ubuntu/xenial64', 'centos/7' ]
for vagrant_image in vagrant_images; do
  vagrant box add --provider virtualbox $vagrant_image
done
