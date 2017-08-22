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

# Vagrant boxes download
vagrant box add --provider virtualbox centos/7
vagrant box add --provider virtualbox ubuntu/trusty64
vagrant box add --provider virtualbox ubuntu/xenial64
