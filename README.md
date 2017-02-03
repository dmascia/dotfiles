# Dave Mascia's dotfiles

* I maintain this repo as *my* dotfiles, but your free to use it. **I am not liable for anything that goes wrong on your computer, use it at your own risk!**
* You're quite welcome to make suggestions, however I may decline if it's not of personal value to me.
* *my* dotfiles are geared towards node & php development 

## Setup
#### installing & using

* fork this repo
* clone your forked repo
* run parts of `setup-a-new-machine.sh` in stages
* run `symlink-setup.sh`
  * git config needs attention, it's currently setup with my github email account



#### Shell

This repo contains configurations for bash, and only bash. 

## My Favorite Parts.

### [`.aliases`](https://github.com/dmascia/dotfiles/blob/master/.aliases) and [`.functions`](https://github.com/dmascia/dotfiles/blob/master/.functions)

So many goodies that i've collected over the years and use daily. Many of functions and aliases came from Paul Irish and others like.

### The "readline config" (`.inputrc`)
Basically it makes typing into the prompt amazing.


### Custom Bash Prompt with Git information

![Screenshot of my shell prompt](https://d17oy1vhnax1f7.cloudfront.net/items/1w3L1B0z0U1I2j1L060p/bashscreenshot.png?v=da766635)




### Cool utilizes

[nvm](https://github.com/creationix/nvm), [git open](https://github.com/paulirish/git-open), [git recent](https://github.com/paulirish/git-recent), [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy), [trash-cli ](https://github.com/andreafrancia/trash-cli), [wifi-password](https://github.com/rauchg/wifi-password)

## Overview Of Files

####  Automatic config
* `.viminfo` - vim config
* `.inputrc` - behavior of the actual prompt line

#### shell environment
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.exports`
* `.functions`

#### manual run
* `setup-a-new-machine.sh` - apps i need installed
* `symlink-setup.sh`  - sets up symlinks for all dotfiles
* `.osx` - run on a fresh osx setup
* `brew.sh` & `brew-cask.sh` - homebrew initialization

#### git, brah
* `.git`
* `.gitattributes`
* `.gitconfig`
* `.gitignore`



### `~/bin`

One-off binaries that aren't via an npm global or homebrew.


