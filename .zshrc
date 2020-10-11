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
export PATH=$PATH:$HOME/go/bin
export NODE_ENV='dev'
export EDITOR=vim
export VISUAL=$EDITOR
export DOTNET_DIR=/usr/local/share/dotnet
export PATH=$DOTNET_DIR:$PATH

# change the size of history
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups
setopt hist_ignore_space

# zsh autocomplete
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi


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

# lauching code
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

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
#################
#Work/Play Time
#################
alias rn= "rvm use 2.6.6" 
alias wp= "/Users/TSimpson/Documents/TeamNewton" 
alias lg="lazygit"
alias ld="lazydocker"
alias sub="open -a 'Sublime Text'"
alias vis="open -a 'Visual Studio Code'"
alias cdw="cd /Users/TSimpson/Documents/TeamNewton"
alias cdp="cd /Users/TSimpson/Documents/projects"
alias vim="nvim"
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
#################
#Docker Time
#################
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
alias rpds='~/bin/./start-local-kluster.sh' # start deals kluster
alias wgp='watch kubectl get pods' # watcher for pods
alias kctx=kubectx
alias kns=kubens
# getting kubectx && kubens going
#if [ $(command -v kubectx) ] && ! [ $(command -v kctx) ]; then
#  CMD="$(which kubectx)"
#  ln -s $CMD /usr/local/bin/kctx || alias kctx=$CMD
#fi
#if [ $(command -v kubens) ] && ! [ $(command -v kns) ]; then
#  CMD="$(which kubens)"
#  ln -s $CMD /usr/local/bin/kns || alias kns=$CMD
#fi
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

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 3 not-numeric
zstyle :compinstall filename '/Users/tsimpson/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
code () { VSCODE_CWD=/Users/tsimpson/Documents/TeamNewton/evaluation-deal-component open -n -b com.microsoft.VSCode --args  ;}
alias nukedocker='docker volume rm 0f8df1fb319beb0080353b4dabbe05afc5f7cd9e3b3084ef43f1bcd934d45363
1b73da9bf7f0c782a38b5a16c9b397f292caab700c0b1b962fc6d704684a162b
1caff4f797880a6e66547b58c30295f191ab0a12312ca4bff4b756cd1d51d5b3
2d8825796181dd849a03e8a00e970e98c62f169477a68aca7a7f1482aad457f5
2e03da73743d80785f5bb799ed62dd317ff143259f4a51c0778ef05a70806c88
2e7affd015191b1d4ef899a22bb0ff78c929227b4ab9998b75fe8e4fa1c17ceb
2f28e1ff2ed1c761cdb14b6ce769fa6700e5eb54ac1aeecc93464eaa1458ff68
4b628b276818832cfb5ddd488da98bf0fb6f2506d2e9d728178ac4e02fe42df7
4c5749c4365c18f3c415a50e1d4b7d4f2038f0e09a85f9bdb92fd555ab1b083c
4edb648e1cbd2fd1e0cdfb2541eb880f8ace177c506daea9849746b736b3aced
5ba20e9bd7e2e07777dcf5d744a148d9e3ae3c0c360fc31370c69feebba09e8d
5cc6c8948859db995bbcffdc5828b9aa40ea438bd1b983cca8c908e4bb5be4b2
5d0085c2e5b3a1149741e1a7a6edb96f47418c1d859445d22db83b52896871e4
5dd8bc8280706d7a1ca7a663771eb7f0b82e3ad6d280e7fd75e2c82362d5b413
5f31a2883aac73a21e93c821799cd8e07f96345c76262b958d48259d2b44ce2d
05af5644df921accf13fe5b6a023585c47db8721a9dbbbb1d4ada1fc97303b58
6ce77aa69280ef2cb15dc793cb4461a7cc3a58cca83859e925afc09eb25c96b6
6eeaf81ce67cdc5fe6eb15c349a86d5fc52f530f6eefc65e54e606114df931e5
7eb0449e2ac4274f3470f414741b78a9c59de745bd284cb9efccacd5d9823435
7fdd409454dd409b9b9f9aefb7e7da43143294a2c9f4e3d1a3167dca90458123
8c1dade708971e635f7b9416c5675256f89e1506d17fa08fb0bc0039c36c49ec
9a2f6aa02b26074dc2cf43228f881af6c45f1d41b45067cf7bbb3e10167fc574
9df11dbcfbe3a41f143ddaa702ed1f508f2b8b85162a63ca5887c26dba4b7584
17aff0d558bf2cf341da353869b18d6bd1c0aa71749c5a62e3e0cdf13e5dd159
31be00a9c4031082034d6ab8d47f438bb104a45ee098674081a14ba2be2c8778
34ff77f538d1a5446d5ad200baa60b552b9bcc69e2c47a415175aff89164a55b
56a7155503e6975d85d6acd1c7504e2b0c1da243704b4f66dfd83f6fcd3a4724
56f20a175d267586d9f353b5ce8a43564dfa137e506c10b6ed7aa572175e67be
60ea1e663092b57cc4c47529c530457c5041522e097e454c199c75ee4360a934
61c65e39106609020f93b3769c213848b8db1e526561079fabca802e988f10b2
68f16a04c7bd25edbf979ab5ce07afb8d4292c99fff7c24bfea6d3287cb9818e
69f4d196cb082fe38247a1285a418fb4c42e3b72399c8f9b806da53873e5feb6
72f876b2f9a6d401037f278c2ee8261f154bf02d8d531e199d652eeea8b9b995
93d2e4197e2b066a5803d566f3dc6ed43b38c257fc8d4a158af5baac26990215
97f256605b3926e2c270e1d55d86fefeed57c4c7d0994de3ab8a0d13630cb553
111d96c88d32e61c6d5131e9b47ac295da534c278f4aa575b51d2fd41cc4f2a7
286d3a101c72aeb0f806931312484c53659fca4ad305d6fd13554d9d5e883929
0368ce0397936b5d761f6b5ff7e4a293306104bd91719992cd8cb92742045d4c
377aac5985e2edc8a4badb80aed778eef899bfb0262b1c463e7afd5de467f27a
465c2b6c8b62e00aff10f03370f1668ea1047ec04facb6d1337f4719aca38b99
540e3d876af4c89103ba406114779d54a4dfd9eab2d54fcf96582b3c2e264022
620b69eed8548db2f41d30122699e9b969cfaf351099adf9934d5148d9db38c9
656d3372eeeab4688ef6c30bca247ee3bbf8ff1f6d13fcc064bfa5ee12a121a1
0666e71dc994d133abfebe43a158e89514e713d1a7d6c30212856380a85db171
760bd63e4fee43d192eb265ab2ac2d6c584901b51fa71558bea02ec84be82ef8
859c8754b070a781d8c76dcb72981daf9bb64932a2d9338ce41e254e72a0bbb2
00940a82ee0aad91721c726be74e80f65da2067f95210aac45cd2ffc3ce83acf
950ca9c84d1028cbdb53157c9752bd167a15564e0fc702d13f3bc370181ee22d
7922fe2e82152d09a60b10ede43fac1ea862973be9d060e408b19e6a2fcb291b
7947c09dca41f0de978f9225923717729ab8f4a4ed07f5704ddbe0539a0892cb
8854ed341fda530e1dd06148cba82ee988e63a8ef161b9f6d559e9c034a49aef
9799a17b678fb980b21bdc0d56e5f96ef922b4247a382ec2733f0d65c648ac3f
94769ce22b775cf33c0ac9314eea3c6c405f54212f8ed9f39486f3178393d99d
657903a7f7ccb009dce65b3068ad516c7a2d0fa02a147878feaff8659a153d84
914683e10c88376100908b06adf1df0e5122a5c28e96c9b3c769271197ceac49
3203096d5834db38c1cd562dbfe4bc9b7d54f515b32bb37365a7fc968ffb6d1b
7920676eba3a5faf6abfe0b9e52a767e1cd3712254ae403f5e3d4b4ad7309b92
08761515b15c5a90190b7c82bcb57d80da40f0e2d4a7013c37fbde7fa44bfdc9
60089175921b6e1a521031fbe8e415c9ca37c3d3e644b9d173dcfbc61e8916bc
a5c395b67aa5c8709d679683b9ef109d5cbbbf541eb3f7d0461fc5f771d0620d
a063efe48e0966bd6a187cf983d4e5d347f3779a04dcb83a2197e781ce66d9bb
b8983d2df9ada6fa5c46d201cb21d7e3afa7dffec2453b9d2acbebe9986f75f8
bc70edbfbb661f444027c1bd41bd8a9fb786f99d688a464af1d1075186b9655d
build_datavolume
c1abf9fddfeae636bd465ddd613dc35b889566e4de4b72ca99a0192555674e54
c1dc2f15d044a033a5e59eb02ba82200a43aa2de091b32faf2a0e37d851aca38
c04a2fa13de995a6bb9e69a4d0fce9b0e9e10e02bb572c5485bbe7f0b0b96575
c5c8a310cdc10dde522ea1b1d5b495036600b9b03d4f8dcee5798dd1ea28c536
c6c82b4fa328ae4e41947948e1935df1de0959cebf41d3213109657746124493
c98a3fe37a47f9f1ed0b092ce452cebae7e24115294e3a768451184a6f931a84
c450123e0822c03c6718ed21f7f052130d9cf700209297a99e92d9814dc81e96
c729113fb4f9de0dfb505609d6808848e6869b47cdabf823506cf4b5496e6b84
c6827001c8f779944f5e9a512678c36e788faadc7daf5f5d19c55124d6335d01
ca861bcc670c33ca0bf76edfff13d10be8f5b1aac6b9e8f2b777810a934f28e5
d18d54b58b48b1840505b8d0b70a4f1d1bd4cf6e46079239298c1a883d05dc92
d6692d6215870db5d59dc410476f5951f41ad594be6c7b6f7104c490236017eb
d026514d140a08dc220761dc46c42d605aa9345b0272cebbdd44181a6cd5b7ee
d099992583c058786533fcac074cd523de036b886bcc2d768d4de10e6a1a3ec7
dd0e38075035ca7b7a1801554ad217a379bc380cbf15bab88c3c189bd94b8a73
e02eb98e8c7bca12217d67c2b5c8b80148449db48efba1ee38eaf2e4b98ede95
e372fafaeaa8ff4bb03ea1d920968a6868ef35739d5d98c02017b17267b38760
e8101414e2516264198bc1aa2c84c7360d31932157c1a047d5c78ef36c28fec4
ed7d6175ef4d38007f9edffb34b091789596361b103a1d0dd746a97445a29cd9
ee246782156d58ca73cbf8e20bd4e38d368f05437f81dcca3c8226ff5cabe405
f9a41a99da74b704524a117a09f2db44fd305995c0e8de016e724c9816450849
fc973fea6e99d60e0858e5ae6cf40c568abadde73bc7ab7ef9d8bc57a62eace5
fcf60915f9da169749914ded096371e4711a3a651f1974bff0c7c5cdfee787d4
ff891c2c0d69f5421429fbf40d5b3643a3e642445d7654c879fb95e41ef0015c
user-property-component_datavolume; docker rmi f28d0831c5d9
d4551aeafbbf
6ae189e555cc
82307d495fb5
9a0ce9ce6ae5
fbc7e1cbe52a
d6f1263b2e7a
5059920060df
fabfb5e0342f
270558ea7db5
466347227deb
a5b60db5fec5
dfe85e4742c6
d451ddab9e34
f57ce83179b7
2acddbb72cc0
53364de366c3
d82f309c0881
1daa313cb586
37cbb23b527c
aa4030b7bb21
48f225ec509a
2c71349ee443
8ba9ba3f93b5
c1b6d0c364c2
70c8d89a66e2
f82231cb1d99
6e2cfedc033d
d1591415489c
5473fb618362
68c70382b6e9
fbf201bb080f
d1b8957943dc
4569fd258833
caf5b9099a20
9dc31b04a3e9
1a5d6eef6676
541852c7f501
c0cc15adfbea
207fbcccbe68
1a5dd162f4b4
1b2fd75bb8d7
00e379a8b3d7
9c356fd1e10e
97a95f0d6f7e
13cc54952709
1ea594104960
af44fca3cf60
90257b591205
7cf6f642e2a8
13fc4cc24345
e9eb77c9fdf0
057501a8b262
03239d7ca0ac
e5cac43cf169
5ded5de31aa5
49d5d0f45199
ac923eb3531e
2d581b5dbcc4
195ffed5d180
fa5521378996
bf7b5ef6ae92
a41ad1d97757
26ef7c42ea75
27fac3535196
0daa1ec48152
74f302b7a1a4
876551528cd8
af82ca02d2ef
ed4aeebfb8e9
7f27ce71bd84
7f169bbbcba3
670e6bc1e83e
e71e9ea978d4
697cfb1652e0
52d84484f327
dfcf1f7db665
26000405707a
30e140bc4288
0644265a499b
ac08f1c7e665
2d2cbaf97a49
a6b3c7d99818
520cb3c8544e
371a3e3c6786
5b1f2d096642
8ba03efaabfc
d8d9704eec22
3447ec9d1adb
836008a8472c
059faebd657b
41a3b183f63b
5f307861dff2
045227322478
1f93edf2af92
4ff75b8d3191
7199db5df6e4
8cd3217cf2a4
b17915f85456
164e6d1e3702
f6fa32f41bab
885a200df325
dc4b3eb26ab7
6f6f453500db
898d5633cffe
87ad87d3a4ed
1b5a06c1c89b
5674184543d5
d89ee7bbd153
9ce6d00567a0
31cb1ccb3fde
d490c5d198a6
9eed908edf61
b842b97eba0b
03fd91440242
c8148afede3d
8758038d79ef
d9698e906c6b
9e283a38ea2a
4f40db14ebc7
a7d1d21f84e1
3da14162307b
e6113064fa15
aab2a600567e
d6427ea81621
9d975731bcbd
b2d3bdfc7f3b
c3f3832736ce
95ad7af157dc
244e2b764015
0f13485240a3
a3cd72562f43
26dce35daebb
a41d01450b7c
094949061e63
9bed5acce967
02b8270f57ad
855b481212ff
bc449a1e1fdb
df0f3c29b8cc
752e5b4c07ea
5cdd690353cd
e761d35999b0
d74db98621b8
24049ed95c06
ea83be489087
d6c14945b176
d869687f3c18
310114fa7b24
40b616a8aa22
bb99a6d75da1
980c9250909d
a40e209f08ce
51ef4ebf7919
11776f3910bd
c51d6bc6f3e9
7e4f1f6aecac
e07837d8ad04
d3f8b73c1964
06b3b877cf04
366fed8f4308
223556b60a2e
91fee6c99c5b
371333ecc7d8
42917f15ae68
68c96df3a69f
71205ad5f358
8eb60cd68287
fcb3ea1b41b1
fb884113f540
b99476bcf15b
eb41a5c91bf1
8c752323171a
d8bab5a37719
573df09a283a
b3d3e200c3ee
b53644d49d5f
9ba39183b1da
84bfc2525959
1cfdcd0bcf6d
b87378707415
aa73d1bc6430
78cedef9384c
0b916d6a5c15
f3a56a8585a2
4bb9dc6380df; docker rm 5867541da672; docker rmi f28d0831c5d9
49ff3cd81409
0d579a691a8d
d4551aeafbbf
6ae189e555cc
82307d495fb5
9a0ce9ce6ae5
fbc7e1cbe52a
d6f1263b2e7a
5059920060df
fabfb5e0342f
270558ea7db5
466347227deb
a5b60db5fec5
dfe85e4742c6
d451ddab9e34
f57ce83179b7
2acddbb72cc0
53364de366c3
d82f309c0881
1daa313cb586
37cbb23b527c
aa4030b7bb21
48f225ec509a
2c71349ee443
8ba9ba3f93b5
c1b6d0c364c2
0c285d6f9643
70c8d89a66e2
f82231cb1d99
32a769de46b6
6e2cfedc033d
d1591415489c
5473fb618362
68c70382b6e9
fbf201bb080f
d1b8957943dc
4569fd258833
caf5b9099a20
9dc31b04a3e9
8de0bb45f16e
1a5d6eef6676
541852c7f501
c0cc15adfbea
207fbcccbe68
1a5dd162f4b4
1b2fd75bb8d7
9c356fd1e10e
00e379a8b3d7
607b25efa292
97a95f0d6f7e
13cc54952709
1ea594104960
af44fca3cf60
90257b591205
7cf6f642e2a8
aa5a4ce864ed
13fc4cc24345
e9eb77c9fdf0
5450c042e9ec
057501a8b262
b8e26d64457d
03239d7ca0ac
e5cac43cf169
5ded5de31aa5
49d5d0f45199
ac923eb3531e
2d581b5dbcc4
195ffed5d180
fa5521378996
bf7b5ef6ae92
a41ad1d97757
26ef7c42ea75
27fac3535196
0daa1ec48152
74f302b7a1a4
876551528cd8
af82ca02d2ef
ed4aeebfb8e9
7f27ce71bd84
7f169bbbcba3
670e6bc1e83e
e71e9ea978d4
697cfb1652e0
52d84484f327
dfcf1f7db665
26000405707a
30e140bc4288
0644265a499b
ac08f1c7e665
2d2cbaf97a49
a6b3c7d99818
520cb3c8544e
371a3e3c6786
5b1f2d096642
8ba03efaabfc
d8d9704eec22
3447ec9d1adb
836008a8472c
059faebd657b
41a3b183f63b
5f307861dff2
045227322478
1f93edf2af92
4ff75b8d3191
7199db5df6e4
8cd3217cf2a4
b17915f85456
164e6d1e3702
f6fa32f41bab
885a200df325
dc4b3eb26ab7
6f6f453500db
898d5633cffe
87ad87d3a4ed
1b5a06c1c89b
5674184543d5
d89ee7bbd153
9ce6d00567a0
31cb1ccb3fde
d490c5d198a6
9eed908edf61
b842b97eba0b
03fd91440242
c8148afede3d
8758038d79ef
d9698e906c6b
9e283a38ea2a
4f40db14ebc7
a7d1d21f84e1
3da14162307b
e6113064fa15
aab2a600567e
d6427ea81621
62687ed6efb2
9d975731bcbd
9e4a20b3bbbc
b2d3bdfc7f3b
ed37f6535eee
c3f3832736ce
95ad7af157dc
244e2b764015
0f13485240a3
a3cd72562f43
26dce35daebb
a41d01450b7c
094949061e63
f48cb613323b
97d106b850ed
9bed5acce967
02b8270f57ad
855b481212ff
bc449a1e1fdb
df0f3c29b8cc
752e5b4c07ea
5cdd690353cd
e761d35999b0
d74db98621b8
24049ed95c06
ea83be489087
d6c14945b176
d869687f3c18
310114fa7b24
40b616a8aa22
bb99a6d75da1
980c9250909d
a40e209f08ce
51ef4ebf7919
11776f3910bd
c51d6bc6f3e9
7e4f1f6aecac
e07837d8ad04
d3f8b73c1964
06b3b877cf04
366fed8f4308
223556b60a2e
91fee6c99c5b
371333ecc7d8
42917f15ae68
68c96df3a69f
71205ad5f358
8eb60cd68287
fcb3ea1b41b1
fb884113f540
b99476bcf15b
eb41a5c91bf1
8c752323171a
d8bab5a37719
573df09a283a
b3d3e200c3ee
b53644d49d5f
9ba39183b1da
84bfc2525959
1cfdcd0bcf6d
b87378707415
aa73d1bc6430
78cedef9384c
e704287ce753
d29b06482d28
0b916d6a5c15
f3a56a8585a2
4bb9dc6380df
c8e42cf9a68e
9a4a03cd4485
afc507f7ef59
84164b03fa2e
9b51d9275906
79da37e5a3aa
3a7408f53f79
a86647f0b376
441835dd2301
fc838b21afbb
b4d073a9efda
0ee1b8a3ebe0
129151cdf35f
989749268895
2a71ac5a1359
25476914cc66
b2756210eeab
54db200915ee
bf261d157914
ae893c58d83f
eca558ca0937
2982ba071059
43773d1dba76
6d1ef012b567
cabbc4c32056
c7a82b7f4014
da86e6ba6ca1
5bb0e81ff6e4; docker kill 135e74011622
4ad603f69110
2dcf50f8fbaa
36614e7cfe4f
5544d0f033d2
a435d6d3b6f7
9c15e13b93bf; docker rm 135e74011622
4ad603f69110
2dcf50f8fbaa
36614e7cfe4f
5544d0f033d2
a435d6d3b6f7
9c15e13b93bf
5867541da672; docker system prune -af'
