#!/bin/bash


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# daily
brew cask install lastpass


# dev
brew cask install iterm2
brew cask install sublime-text
brew cask install atom
brew cask install imagealpha
brew cask install imageoptim


# browsers
brew cask install google
brew cask install google-chrome-canary
brew cask install firefox
brew cask install chromium
