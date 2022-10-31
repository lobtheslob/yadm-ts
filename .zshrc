# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

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
export PATH=$PATH:$HOME/go/bin
export NODE_ENV='dev'
export EDITOR=vim
export VISUAL=$EDITOR
export DOTNET_DIR=/usr/local/share/dotnet
export PATH=$DOTNET_DIR:$PATH
export PATH=~/homebrew/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export JAVA_HOME="/Users/tyler.simpson/Library/Java/JavaVirtualMachines/liberica-11.0.16.1"
export GIT_USERNAME=digilob
export GIT_ACCESS_TOKEN=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
export GIT_NPM_TOKEN=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

# change the size of history
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE


ZSH_THEME="powerlevel10k/powerlevel10k"

setopt hist_ignore_all_dups
setopt hist_ignore_space
#################################################
### Aliases
#################################################
#################
#Work/Play Time
#################
#alias air='~/.air'
#alias vim="nvim"
alias cat="bat"
alias less="batpipe"
alias watch="batwatch"
alias diff="batdiff"
alias ls="exa"
alias lg="lazygit"
alias ld="lazydocker"
alias sub="open -a 'Sublime Text'"
alias vis="open -a 'Visual Studio Code'"
alias cdw="cd /Users/tyler.simpson/projects/digicert"
alias cdp="cd /Users/tyler.simpson/projects"
alias co="git checkout"
alias cls="clear"
alias cl="colorls -al"
alias lc="lolcat"
alias his="history"
alias who="whoami"
alias gst="git status"
alias cra="create-react-app"
alias chnpm="sudo chown -R $(whoami):staff"
alias dc="docker-compose"
alias dp="docker ps"
alias dk="docker kill $(docker ps -aq)"
alias dcup="docker-compose up"
alias dcdn="docker-compose down"
alias klf="kubectl logs -f"
alias kgp="kubectl get pods"
alias kpf="kubectl port-forward"
alias kdp="kubectl delete pods"
alias ll="ls -al"
alias chrome='open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args -remote-debugging-port=9222'
alias binfix='/usr/bin/find ~/bin -type f | xargs chmod +x'
alias GOFLAGS="-mod=mod" 
alias python=python3
#alias tmux='tmux -vv -f /dev/null new'

#################
#pbcopy replacement
#################
#alias pbcopy='xsel --clipboard --input'
#alias pbcopy='xsel --clipboard --input'
#alias pbcopy="clip.exe"
#alias pbpaste="powershell.exe -command 'Get-Clipboard' | head -n -1"
#################
#Docker Time
#################
alias dm=docker-machine
alias dmnfs=". ~/.docker_env && docker-machine-nfs default --mount-opts='noacl,async,nolock,vers=3,udp,noatime,actimeo=1'"
alias dmcfg="docker-machine env default > ~/.docker_env && source ~/.docker_env && dmnfs"
alias dmclean="dmclean1 && dmclean2 && dmclean3"
alias dmstart="dm start && dmcfg && devupdate && appupdate && dmclean"
alias policyupdate="adgpupdate"
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
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
# kills all running docker containers, and does a minimal clean
alias docker-stupid='docker-compose down ; docker stop $(docker ps -aq) ; docker rm $(docker ps -qa) ; docker network rm $(docker network ls | grep "bridge" | awk "/ / { print $1 }")'
   # kills all running docker containers, and does a larger clean
   alias dmclean='docker-compose down ; docker stop $(docker ps -aq) ; docker rm $(docker ps -qa) ; docker network rm $(docker network ls | grep "bridge" | awk "/ / { print $1 }") ; docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
   # kills all running docker containers, and purges everything docker has done
   alias dmpurge='docker-compose down ; docker stop $(docker ps -aq) ; docker rm $(docker ps -qa) ; docker network rm $(docker network ls | grep "bridge" | awk "/ / { print $1 }") ; docker volume ls | grep -v DRIVER | while read driver name ; do docker volume rm $name ; done ; docker image ls -a | grep -v "REPOSITORY" | while read repo tag image etc ; do docker rmi $image --force ; done'

startover() {
   echo 'Killing everything'
   docker stop $(docker ps -a -q)
   docker rm -f $(docker ps -a -q)
   docker rmi -f $(docker images -q)
   echo 'Everything killed, my lord'
}

# k8s
#alias kap='kubectl delete all --all --all-namespaces' # kill all pods
alias wgp='watch kubectl get pods' # watcher for pods
alias kctx=kubectx
alias kns=kubens
# getting kubectx && kubens going
if [ $(command -v kubectx) ] && ! [ $(command -v kctx) ]; then
  CMD="$(which kubectx)"
  ln -s $CMD /usr/local/bin/kctx || alias kctx=$CMD
fi
if [ $(command -v kubens) ] && ! [ $(command -v kns) ]; then
  CMD="$(which kubens)"
  ln -s $CMD /usr/local/bin/kns || alias kns=$CMD
fi
#https://github.com/jeffkaufman/icdiff
alias diff="icdiff"
alias gd="git icdiff"

# https://github.com/sharkdp/bat
batdiff() {
      git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

#fzf
if type rg &> /dev/null; then
 export FZF_DEFAULT_COMMAND='rg --files'
 export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

#fd() {
#local dir
#dir=$(find ${1:-.} -path '*/\.*' -prune \
#-o -type d -print 2> /dev/null | fzf +m) &&
#cd "$dir"
#}
## type "fo" to open a file in its default application by hiting ctrl + o when
## the file is selected
#fo() {
#x=$(preview)
#folder_path=$(echo $x | cut -d '.' -f 1,1 | rev | cut -d "/" -f2- | rev);
#cd $folder_path
#nvim $(echo $x | rev | cut -d '/' -f 1,1 | rev)
#}
#

export NVM_DIR="$HOME/.nvm"
  [ -s "/Users/tyler.simpson/homebrew/opt/nvm/nvm.sh" ] && \. "/Users/tyler.simpson/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/Users/tyler.simpson/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/Users/tyler.simpson/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
   export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

ZSH_DISABLE_COMPFIX='true'
export LC_ALL=en_US.UTF-8 
export LANG=en_US.UTF-8
alias ls='ls -G'

#################################################
### Colorize Man pages
#################################################
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#man 2 select
#export MANROFFOPT='-c'
#export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
#export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
#export LESS_TERMCAP_me=$(tput sgr0)
#export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
#export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
#export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
#export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
#export LESS_TERMCAP_mr=$(tput rev)
#export LESS_TERMCAP_mh=$(tput dim)
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 3 not-numeric
zstyle :compinstall filename '/Users/tsimpson/.zshrc'

neofetch

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
source ~/powerlevel10k/powerlevel10k.zsh-theme

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
export PATH="/Users/tyler.simpson/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/Users/tyler.simpson/homebrew/opt/openjdk/include"
