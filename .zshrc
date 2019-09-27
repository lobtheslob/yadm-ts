export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH=/Users/TSimpson/.oh-my-zsh
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:
export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=/Users/`whoami`/Library/Python/3.7/bin/:$PATH
export PATH=~/bin:$PATH
export PATH=$HOME/bin:$HOME/Library/Python/3.7/bin:$PATH
export NODE_ENV='dev'
export EDITOR=vim
export VISUAL=$EDITOR
# tmux complains about color scheme
#

#COPIED from .bashrc

# If you have run proxify and or certify, load previous settings
# These belong in .bashrc because they are non-login required
test -f ~/.berkadia_certs && . ~/.berkadia_certs
test -f ~/.berkadia_proxy && . ~/.berkadia_proxy

function dmclean1 {
  if [ $(docker ps -a -q -f status=exited | wc -l) -gt 1 ] ; then
    docker rm -v $(docker ps -a -q -f status=exited);
  fi
}

function dmclean2 {
  if [ $(docker images -f 'dangling=true' -q | wc -l) -gt 1 ] ; then
    docker rmi $(docker images -f 'dangling=true' -q);
  fi
}

function dmclean3 {
  if [ $(docker volume ls -qf dangling=true | wc -l) -gt 1 ] ; then
    docker volume rm $(docker volume ls -qf dangling=true);
  fi
}


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wi
# ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="spaceship"
# ZSH_THEME="agnoster"
DEFAULT_USER=`whoami`

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    aws
    brew
    # cake
    # cask
    # capistrano
    # catimg
    # celery
    # chruby
    # chucknorris
    colored-man-pages
    copydir
    copyfile
    cp
    dash
    docker
    docker-compose
    docker-machine
    dircycle
    dirhistory
    dirpersist
    django
    encode64
    extract
    # fabric
    # fancy-ctrl-z
    # fbterm
    # Forklift
    # fasd
    # gas
    # geeknote
    gem
    go
    golang
    git
    github
    gitfast
    git-extras
    git-flow
    git-flow-avh
    git-hubflow
    go
    golang
    # gradle
    # grails
    # httpie
    history
    # jira
    jsontools
    #keychain
    # knife
    kubectl
    # macports
    man
    node 
    osx
    pip
    sudo
    thefuck
    tmux
    tmuxinator
    # thor
    # urltools
    vi-mode
    vim-interaction
    vscode
    # yarn 
    # web-search

)



# source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH="/opt/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#################################################
### Aliases
#################################################
alias sub="open -a 'Sublime Text'"
alias vis="open -a 'Visual Studio Code'"
alias deis="cd /Users/samuelbernheim/Google\ Drive/Brandeis/Year\ 4"
alias gproj="cd ~/Github-Projects"
alias vim="nvim"
alias co="git checkout"
alias cls="clear"
alias cl="colorls -al"
alias lc="lolcat"
alias his="history"
alias who="whoami"
alias gst="git status"
alias cra="create-react-app"
alias work="cd ~/Documents/TeamKapteyn"
alias chnpm="sudo chown -R $(whoami):staff"
alias dc="docker-compose"
alias ll="ls -al"
alias chrome='open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args -remote-debugging-port=9222'
alias binfix='/usr/bin/find ~/bin -type f | xargs chmod +x'
alias dm=docker-machine
alias dmnfs=". ~/.docker_env && docker-machine-nfs default --mount-opts='noacl,async,nolock,vers=3,udp,noatime,actimeo=1'"
alias dmcfg="docker-machine env default > ~/.docker_env && source ~/.docker_env && dmnfs"
alias dmclean="dmclean1 && dmclean2 && dmclean3"
alias devupdate="ecr-login && docker pull 287054460789.dkr.ecr.us-east-1.amazonaws.com/polaris/devenv-nodejs-polarisplatform:latest && docker run --rm -it -v \"$HOME\"/://userhome --entrypoint=bash '287054460789.dkr.ecr.us-east-1.amazonaws.com/polaris/devenv-nodejs-polarisplatform' //app/install && binfix"
alias appupdate="ecr-login && docker pull 287054460789.dkr.ecr.us-east-1.amazonaws.com/polaris/appenv-angular2-polarisplatform:latest && docker run --rm -it -v \"$HOME/bin/\"://hostbin --entrypoint=bash '287054460789.dkr.ecr.us-east-1.amazonaws.com/polaris/appenv-angular2-polarisplatform' //app/install && binfix"
alias dmstart="dm start && dmcfg && devupdate && appupdate && dmclean"
alias policyupdate="adgpupdate"
alias appbash="docker run -it -v '/`pwd`':'//code' -v $HOME'/.npmrc':'//root/.npmrc' --rm --volumes-from npmcachervol:rw --volumes-from ${PWD##*/}-npm:rw --entrypoint=bash 287054460789.dkr.ecr.us-east-1.amazonaws.com/polaris/appenv-angular2-polarisplatform"
alias devbash="docker run -it -v '/`pwd`':'//code' -v $HOME'/.npmrc':'//root/.npmrc' --rm --volumes-from npmcachervol:rw --volumes-from ${PWD##*/}-npm:rw --entrypoint=bash 287054460789.dkr.ecr.us-east-1.amazonaws.com/polaris/devenv-nodejs-polarisplatform"
# Docker JJ
alias dkpsa='docker ps -a'                  # List all containers (default lists just running)
alias dkcls='docker container ls'           # List containers
alias dkcps='docker-compose ps'             # List docker-compose containers
alias dkils='docker image ls'               # List images
alias dkvls='docker volume ls'              # List volumes
alias dkmls='docker-machine ls'             # List docker-machines


alias dkstoprm='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Clean up exited containers (docker < 1.13)
alias dkrmC='docker rm $(docker ps -qaf status=exited)'

# Clean up dangling images (docker < 1.13)
alias dkrmI='docker rmi $(docker images -qf dangling=true)'

# Pull all tagged images
alias dkplI='docker images --format "{{ .Repository }}" | grep -v "^<none>$" | xargs -L1 docker pull'

# Clean up dangling volumes (docker < 1.13)
alias dkrmV='docker volume rm $(docker volume ls -qf dangling=true)'

startover() {
  echo 'Killing everything'
  docker stop $(docker ps -a -q)
  docker rm -f $(docker ps -a -q)
  docker rmi -f $(docker images -q)
  echo 'Everything killed, my lord'
}




# https://github.com/jeffkaufman/icdiff
# alias diff="icdiff"
# alias gd="git icdiff"
# # https://github.com/sharkdp/bat
# alias cat="bat"
# alias preview="fzf --preview 'bat --color \"always\" {}'"

# type "fd" to open a directory using fzf
fd() {
	local dir
	dir=$(find ${1:-.} -path '*/\.*' -prune \
		-o -type d -print 2> /dev/null | fzf +m) &&
		cd "$dir"
}

# type "fo" to open a file in its default application by hiting ctrl + o when
# the file is selected
fo() {
	x=$(preview)
	folder_path=$(echo $x | cut -d '.' -f 1,1 | rev | cut -d "/" -f2- | rev);
	cd $folder_path
	nvim $(echo $x | rev | cut -d '/' -f 1,1 | rev)
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm



#####################################################################################
### Powerlevel 9k Settings - https://github.com/bhilburn/powerlevel9k
#####################################################################################

# Please only use this battery segment if you have material icons in your nerd font (or font)
# Otherwise, use the font awesome one in "User Segments"
prompt_zsh_battery_level() {
  local percentage1=`pmset -g ps  |  sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p'`
  local percentage=`echo "${percentage1//\%}"`
  local color='%F{red}'
  local symbol="\uf00d"
  pmset -g ps | grep "discharging" > /dev/null
  if [ $? -eq 0 ]; then
    local charging="false";
  else
    local charging="true";
  fi
  if [ $percentage -le 20 ]
  then symbol='\uf579' ; color='%F{red}' ;
    #10%
  elif [ $percentage -gt 19 ] && [ $percentage -le 30 ]
  then symbol="\uf57a" ; color='%F{red}' ;
    #20%
  elif [ $percentage -gt 29 ] && [ $percentage -le 40 ]
  then symbol="\uf57b" ; color='%F{yellow}' ;
    #35%
  elif [ $percentage -gt 39 ] && [ $percentage -le 50 ]
  then symbol="\uf57c" ; color='%F{yellow}' ;
    #45%
  elif [ $percentage -gt 49 ] && [ $percentage -le 60 ]
  then symbol="\uf57d" ; color='%F{blue}' ;
    #55%
  elif [ $percentage -gt 59 ] && [ $percentage -le 70 ]
  then symbol="\uf57e" ; color='%F{blue}' ;
    #65%
  elif [ $percentage -gt 69 ] && [ $percentage -le 80 ]
  then symbol="\uf57f" ; color='%F{blue}' ;
    #75%
  elif [ $percentage -gt 79 ] && [ $percentage -le 90 ]
  then symbol="\uf580" ; color='%F{blue}' ;
    #85%
  elif [ $percentage -gt 89 ] && [ $percentage -le 99 ]
  then symbol="\uf581" ; color='%F{blue}' ;
    #85%
  elif [ $percentage -gt 98 ]
  then symbol="\uf578" ; color='%F{green}' ;
    #100%
  fi
  if [ $charging = "true" ];
  then color='%F{green}'; if [ $percentage -gt 98 ]; then symbol='\uf584'; fi
  fi
  echo -n "%{$color%}$symbol" ;
}

# custom functions
zsh_internet_signal(){
  local color
  local symbol="\uf7ba"
  if ifconfig en0 | grep inactive &> /dev/null; then
  color="%F{red}"
  symbol="\ufaa9"
  else
  color="%F{green}"
  symbol="\ufaa8"
  fi
  echo -n "%{$color%}$symbol"
}

zsh_docker_signal() {
	local color
	local symbol="\uf308"
	docker=$(docker ps) &> /dev/null
	if [ $? = 0 ]; then
		color="%F{green}"
	else
		color="%F{red}"
	fi

	echo -n "%{$color%}$symbol"
}

# Reload the plugin to highlight the commands each time Iterm2 starts 
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


### VISUAL CUSTOMISATION ### 

# Elements options of left prompt (remove the @username)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
     dir
     context
    # custom_javascript
    # custom_python
    # custom_go
    custom_internet_signal
    custom_docker_signal
    vcs 
    #newline
    rbenv
    battery 
    root_indicator 
    #dir_writable
)

# Elements options of right prompt
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    command_execution_time  
    root_indicator 
    background_jobs
    node_version 
    history 
    time
)

# Add a second prompt line for the command
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Add a space in the first prompt 
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"

# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"

# Custom uncommented POWERLEVEL9K const
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="045"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="darkturquoise"
POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%I:%M  \UF133  %m.%d.%y}"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="136"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_FOREGROUND="071"
POWERLEVEL9K_STATUS_BACKGROUND="black"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%f "
POWERLEVEL9K_CUSTOM_DOCKER_SIGNAL="zsh_docker_signal"
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_ICON='\uf1e6'
HIST_STAMPS="mm/dd/yyyy"
DISABLE_UPDATE_PROMPT=true

# Change the git statuses
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf113"

# Add a new line after the global prompt 
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# Colorise the top Tabs of Iterm2 with the same color as background
# Just change the 18/26/33 wich are the rgb values 
echo -e "\033]6;1;bg;red;brightness;18\a"
echo -e "\033]6;1;bg;green;brightness;26\a"
echo -e "\033]6;1;bg;blue;brightness;33\a"

# Custom Function Echo to line
POWERLEVEL9K_CUSTOM_DOCKER_SIGNAL="zsh_docker_signal"
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"

# Create a custom JavaScript prompt section
POWERLEVEL9K_CUSTOM_JAVASCRIPT="echo -n '\uE781' JavaScript"
POWERLEVEL9K_CUSTOM_JAVASCRIPT_FOREGROUND="yellow"
POWERLEVEL9K_CUSTOM_JAVASCRIPT_BACKGROUND="black"

# Create a custom Node_Version prompt section
POWERLEVEL9K_NODE_VERSION_FOREGROUND="083"
POWERLEVEL9K_NODE_VERSION_BACKGROUND="black"

# History
POWERLEVEL9K_HISTORY="echo -n '\uf1da'"
POWERLEVEL9K_HISTORY_FOREGROUND="deepskyblue4"
POWERLEVEL9K_HISTORY_BACKGROUND="white"

# Time
POWERLEVEL9K_TIME_FOREGROUND="white"
POWERLEVEL9K_TIME_BACKGROUND="deepskyblue4"

# Create a custom Python prompt section
# POWERLEVEL9K_CUSTOM_PYTHON="echo -n '\uf81f' Python"
# POWERLEVEL9K_CUSTOM_PYTHON_FOREGROUND="black"
# POWERLEVEL9K_CUSTOM_PYTHON_BACKGROUND="blue"

# Create a custom Ruby prompt section
# POWERLEVEL9K_CUSTOM_RUBY="echo -n '\ue21e' Ruby"
# POWERLEVEL9K_CUSTOM_RUBY_FOREGROUND="black"
# POWERLEVEL9K_CUSTOM_RUBY_BACKGROUND="red"

# Create a custom Go prompt section
POWERLEVEL9K_CUSTOM_GO="echo -n '\ue626' Go"
POWERLEVEL9K_CUSTOM_GO_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_GO_BACKGROUND="deepskyblue3"

# Custom nerd-fonts
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_DISABLE_COMPFIX='true'
export LC_ALL=en_US.UTF-8 
export LANG=en_US.UTF-8
#source ~/.oh-my-zsh/themes/powerlevel9k/powerlevel9k.zsh-theme
alias ls='ls -G'

#################################################
### Colorize Man pages
#################################################

export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
eval "$(rbenv init -)"
eval $(thefuck --alias)
