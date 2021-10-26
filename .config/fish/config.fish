set default_user "davemascia"
set default_machine "dm-macbookpro"


# mv, rm, cp
alias mv 'command gmv --interactive --verbose'
alias rm 'command grm --interactive --verbose'
alias cp 'command gcp --interactive --verbose'

alias hosts='sudo vi /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)
alias ag='ag --follow --hidden -W (math $COLUMNS - 11)'
alias d="cd ~/Documents/Dev"
alias c="cd ~/Documents/Dev/cardcash"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias m="cd ~/Documents/Dev/microservices"
alias hd="~/Documents/Dev/cardcash/card.py"
alias fs="stat -f \"%z bytes\""

# Networking. IP address, dig, DNS
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"
# wget sucks with certificates. Let's keep it simple.
alias wget="curl -O"
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g;'
alias update__gem='sudo gem update --system; sudo gem update --no-document'

# fix for "The local tag on your machine already exists on github. Please compare and realign your local tags and github tags to reflect a monotonic order. Then rerun this script."
function repairGitTags --description "Match local tags with server"
    git fetch --tags && git tag -l | xargs git tag -d
end

function dstart --description "Connect to Docker & List containers"
    eval "(docker-machine env -u)" && val "(docker-machine env default)" && docker ps
end

function removeDockerNC --description "Docker remove <none> TAG images"
    docker rmi (docker images -a -q)
end

function removeAllBranches --description "Removes all local and remote git branches except master branch"
    git fetch -p origin
    git branch | grep -v master | sed 's/origin\//:/' | xargs git branch -D
    git branch -r | grep -v master | sed 's/origin\//:/' | xargs git push origin
end


function removeUntaggedImages  --description "Delete all untagged images"
    docker rmi (docker images | grep "^<none>" | awk '{print $3}')
end


function removeAllContainers  --description "elete all containers"
    docker ps -q -a | xargs docker rm
end


function removeDanglingImages  --description "Delete all dangling images"
    docker rmi (docker images -q -f dangling=true)
end


function stopAllContainers --description "Stop all running cntainers"
    docker stop (docker ps -a -q)
end


function syncDatabaseLib --description "Sync DatabaseLib"
    echo "---rsync---> database_lib/"
    rsync -ah  --progress  --ignore-times "/Users/davemascia/Documents/Dev/cardcash/database_lib/" "./node_modules/database_lib/" --exclude .git --exclude .gitignore --exclude .DS_Store --exclude test --exclude '*.md' --exclude .idea
end

function syncQueueLib --description "Sync QueueLib"
    echo "---rsync---> queue_lib/"
    rsync -ah  --progress  --ignore-times "/Users/davemascia/Documents/Dev/cardcash/queue_lib/" "./node_modules/QueueLib/" --exclude .git --exclude .gitignore --exclude .DS_Store --exclude test --exclude '*.md' --exclude ManualTest --exclude 'classDesign*' --exclude 'seqDiag*'  --exclude .idea
end

function syncCommonLib --description "Sync CommonLib"
    echo "---rsync---> common_lib/"
    rsync -ah  --progress --ignore-times "/Users/davemascia/Documents/Dev/cardcash/common_lib/" "./node_modules/common_lib/" --exclude .git --exclude .gitignore --exclude .DS_Store --exclude test --exclude '*.md' --exclude .idea
end

function syncMessageContractLib --description "Sync MessageContractLib"
    echo "---rsync---> message_contract_lib/"
    rsync -ah --progress  --ignore-times "/Users/davemascia/Documents/Dev/cardcash/message_contract_lib/" "./node_modules/message_contract_lib/" --exclude .git --exclude .gitignore --exclude .DS_Store --exclude test --exclude '*.md' --exclude .idea
end

function syncServiceFramework --description "Sync ccservice-framework"
    echo "---rsync---> ccservice-framework/"
    rsync -ah  --progress --ignore-times "/Users/davemascia/Documents/dev/ccservice-framework/" "./node_modules/ccservice-framework/" --exclude .git --exclude .gitignore --exclude .DS_Store --exclude test --exclude '*.md' --exclude .idea
end

function syncCCUIFramework --description "Sync ccui-framework"
    echo "---rsync---> ccui-framework/"
    rsync -ah  --progress --ignore-times "/Users/davemascia/Documents/Dev/cardcash/ccui-framework/" "./node_modules/ccui-framework/" --exclude .git --exclude .gitignore --exclude .DS_Store --exclude test --exclude '*.md' --exclude .idea
end

function getTags --description "Get all git tagx"
    git for-each-ref --sort=taggerdate --format '%(refname) %(taggerdate)' refs/tags
end

function rvm --description='Ruby enVironment Manager'
  # run RVM and capture the resulting environment
  set --local env_file (mktemp -t rvm.fish.XXXXXXXXXX)
  bash -c 'source ~/.rvm/scripts/rvm; rvm "$@"; status=$?; env > "$0"; exit $status' $env_file $argv

  # apply rvm_* and *PATH variables from the captured environment
  and eval (grep '^rvm\|^[^=]*PATH\|^GEM_HOME' $env_file | grep -v '_clr=' | sed '/^[^=]*PATH/s/:/" "/g; s/^/set -xg /; s/=/ "/; s/$/" ;/; s/(//; s/)//')
  # needed under fish >= 2.2.0
  and set -xg GEM_PATH (echo $GEM_PATH | sed 's/ /:/g')

  # clean up
  rm -f $env_file
end

function ls --description "List contents of directory"
    # previously had this set to...
    #   set -l     param --color=always  # afaik, this isn't neccessary: set --export CLICOLOR_FORCE 1
    set -l param --color=auto;

    set param $param --almost-all
    set param $param --human-readable
    set param $param --sort=extension
    set param $param --group-directories-first
    if isatty 1
      set param $param --indicator-style=classify
    end

    if type gls 1>/dev/null 2>/dev/null
      gls $param $argv
    else
      ls $param $argv
    end
end

function cloney --description "clone something, cd into it. yarn install it."
    git clone --depth=1 $argv[1]
    cd (basename $argv[1] | sed 's/.git$//')
    yarn install
end

function clonen --description "clone something, cd into it. npm install it."
    git clone --depth=1 $argv[1]
    cd (basename $argv[1] | sed 's/.git$//')
    npm install
end

function md --wraps mkdir -d "Create a directory and cd into it"
  command mkdir -p $argv
  if test $status = 0
    switch $argv[(count $argv)]
      case '-*'
      case '*'
        cd $argv[(count $argv)]
        return
    end
  end
end

function upgradeyarn
  curl -o- -L https://yarnpkg.com/install.sh | bash
end

function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_commandd $history[1]
    thefuck $fucked_up_commandd > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_commandd
    end
end

# requires my excellent `npm install -g statikk`
function server -d 'Start a HTTP server in the current dir, optionally specifying the port'    
    if test $argv[1]
        set port $argv[1]
        statikk --open --port "$port"
    else
        statikk --open
    end
end

function emptytrash -d 'Empty the Trash on all mounted volumes and the main HDD. then clear the useless sleepimage'
    sudo rm -rfv "/Volumes/*/.Trashes"
    grm -rf "~/.Trash/*"
    rm -rfv "/Users/paulirish/Library/Application Support/stremio/Cache"
    rm -rfv "/Users/paulirish/Library/Application Support/stremio/stremio-cache"
    rm -rfv "~/Library/Application Support/Spotify/PersistentCache/Update/*.tbz"
    rm -rfv ~/Library/Caches/com.spotify.client/Data
    rm -rfv ~/Library/Caches/Firefox/Profiles/98ne80k7.dev-edition-default/cache2
end

function cdz --description 'Change to a directory using fuzzy finder. (Usually found as fd)'

    if test (count $argv) -gt 1
        echo "fd only accepts 1 argument, (count $argv) given"
        return 1
    end

    if test -n $argv
        echo $argv | sed -ne 's/\(.*\/\)\?\(.*\)/\1/p' | read base
        echo $argv | sed -ne 's/\(.*\/\)\?\(.*\)/\2/p' | read query

        if test -z "$base"; or not set -q base
            set base .
        end
    else
        set base .
        set query ''
    end

    # TODO. this can probably be improved ot use locate instead, e.g.
    #    file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"
    # from https://github.com/junegunn/fzf/wiki/examples
    find $base -type d -path '*/\.*' -prune -o -type d -print ^ /dev/null | fzf +m --query=$query --select-1 --exit-0 > $TMPDIR/dirs

    set dir (cat $TMPDIR/dirs)

    if test -n "$dir"
        cd "$dir"
    end

end

# Local prompt customization
set -e fish_greeting

# highlighting inside manpages and elsewhere
set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline


export GOPATH=$HOME/.go/
export ANDROID_HOME=$HOME/Library/Android/sdk

set -l PA ""

set PA $PA "$PATH:$GOPATH/bin:$GOROOT/bin"
set PA $PA "/Users/$USER/.homebrew/opt/coreutils/libexec/gnubin"
set PA $PA "/Users/$USER/Library/Android/sdk/platform-tools"
set PA $PA "$ANDROID_HOME/emulator"
set PA $PA "$ANDROID_HOME/tools"
set PA $PA "$ANDROID_HOME/tools/bin"
set PA $PA "$ANDROID_HOME/platform-tools"
set PA $PA "/usr/local/opt/ruby/bin"

set --export PATH $PA

# Readline colors
set -g fish_color_autosuggestion 555 yellow
set -g fish_color_command 5f87d7
set -g fish_color_comment 808080
set -g fish_color_cwd 87af5f
set -g fish_color_cwd_root 5f0000
set -g fish_color_error 870000 --bold
set -g fish_color_escape af5f5f
set -g fish_color_history_current 87afd7
set -g fish_color_host 5f87af
set -g fish_color_match d7d7d7 --background=303030
set -g fish_color_normal normal
set -g fish_color_operator d7d7d7
set -g fish_color_param 5f87af
set -g fish_color_quote d7af5f
set -g fish_color_redirection normal
set -g fish_color_search_match --background=purple
set -g fish_color_status 5f0000
set -g fish_color_user 5f875f
set -g fish_color_valid_path --underline

set -g fish_color_dimmed 555
set -g fish_color_separator 999

# Git prompt status
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showupstream auto

# pure
set -U pure_color_success (set_color green)
set -U pure_color_git_dirty (set_color cyan)

# Status Chars
#set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_dirtystate 'red'

set __fish_git_prompt_color_upstream_ahead ffb90f
set __fish_git_prompt_color_upstream_behind blue