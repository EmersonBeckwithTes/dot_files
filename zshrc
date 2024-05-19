# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="awesomepanda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
eval "$(/opt/homebrew/bin/brew shellenv)"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias la='ls -a'
alias ll='ls -l'
alias vimrc='pushd ~/.vim/'
#alias poetry='poetry@1.1.15'

#Auto Open TMUX
if [ "$TMUX" = "" ]; then exec tmux; fi



# Atuocomplete
autoload -Uz compinit
compinit
_comp_options+=(globdots)

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on %b'
export PATH="/Users/ebeckwith/.local/bin:$PATH"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/opt/python@2/libexec/bin:$PATH"

# Pyspark
export SPARK_HOME=/usr/local/Cellar/apache-spark/2.4.4/libexec
export PYTHONPATH=/usr/local/Cellar/apache-spark/2.4.4/libexec/python/:$PYTHONP$


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ebeckwith/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ebeckwith/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ebeckwith/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ebeckwith/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

alias work="cd ~/Documents/work/data"
alias sbi="cd ~/Documents/work/data/services/service-batch-ingestion"
alias dbt="cd ~/Documents/work/data/dbt/service-dbt-aggregations"
alias scripts="cd ~/Documents/work/data/scripts"
alias zshrc="vim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias dep="arch -x86_64"
alias hive="arch -x86_64 hive"

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
#add-zsh-hook chpwd load-nvmrc
load-nvmrc

# rosetta terminal setup
if [ $(arch) = "i386" ]; then
    alias brew="/usr/local/bin/brew"
    alias pyenv="/usr/local/bin/pyenv"

    # export CPPFLAGS="-I$(brew86 --prefix libffi)/include -I$(brew86 --prefix openssl)/include -I$(brew86 --prefix readline)/lib"
    # export CFLAGS="-I$(brew86 --prefix openssl)/include -I$(brew86 --prefix bzip2)/include -I$(brew86 --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include -Wno-implicit-function-declaration" 
    # export LDFLAGS="-L$(brew86 --prefix openssl)/lib -L$(brew86 --prefix readline)/lib -L$(brew86 --prefix zlib)/lib -L$(brew86 --prefix bzip2)/lib -L$(brew86 --prefix gettext)/lib -L$(brew86 --prefix libffi)/lib"
    # export PYTHON_BUILD_HOMEBREW_OPENSSL_FORMULA=openssl@1.0

fi

function intel(){
  arch -x86_64 /usr/local/bin/zsh
}
alias brew86="arch -x86_64 /usr/local/bin/brew"
export PATH=/opt/homebrew/bin:$PATH
# Allow Ctrl-z to toggle between suspend and resume 
function Resume {  
    fg
    zle push-input 
    BUFFER=""
    zle accept-line
} 
zle -N Resume
bindkey "^Z" Resume
