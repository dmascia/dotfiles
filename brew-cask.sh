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
brew cask install visual-studio-code
brew cask install imagealpha
brew cask install imageoptim

# browsers
brew cask install google
brew cask install firefox-developer-edition

brew tap caskroom/fonts 
brew cask install font-fira-code
