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

# AWS CLI
sudo easy_install pip
sudo pip install --upgrade --no-cache-dir --ignore-installed awscli pip boto3 botocore virtualenv PyYAML setuptools

# vagrant plugins and boxes download
vagrant plugin install vagrant-reload
vagrant plugin install vagrant-cachier
vagrant box add --provider virtualbox ubuntu/trusty64
vagrant box add --provider virtualbox ubuntu/xenial64
vagrant box add --provider virtualbox centos/7
