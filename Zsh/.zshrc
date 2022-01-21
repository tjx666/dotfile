# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh-autopair
# if [[ ! -d ~/.zsh-autopair ]]; then
#   git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
# fi
# source ~/.zsh-autopair/autopair.zsh
# autopair-init

# zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp root line)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/yutengjing/.oh-my-zsh"

# Set name f the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="random"
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# official
plugins+=(
  alias-finder
  sudo
  themes
  z
  command-not-found
  rust
  safe-paste
  extract
  hitokoto
)

# unofficial
plugins+=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-better-npm-completion
  yarn-autocompletions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# broot
source /Users/yutengjing/.config/broot/launcher/bash/br

# proxy
proxyWithoutPrompt() {
  export http_proxy="http://127.0.0.1:7890"
  export https_proxy="http://127.0.0.1:7890"
  export all_proxy="socks5://127.0.0.1:7890"
  export no_proxy="localhost,127.0.0.1"

  export HTTP_PROXY="http://127.0.0.1:7890"
  export HTTPS_PROXY="http://127.0.0.1:7890"
  export ALL_PROXY="socks5://127.0.0.1:7890"
  export NO_PROXY="localhost,127.0.0.1,172.16.5.83,.gaoding.com,.gaoding.cn,.huanleguang.com"
}

proxy () {
  proxyWithoutPrompt
  echo "HTTP Proxy on"
}

noproxy () {
  unset http_proxy
  unset https_proxy
  unset all_proxy
  unset no_proxy
  unset HTTP_PROXY
  unset HTTPS_PROXY
  unset ALL_PROXY
  unset NO_PROXY
  echo "HTTP Proxy off"
}

function node-docs {
  local section=${1:-all}
  open_command "https://nodejs.org/docs/$(node --version)/api/$section.html"
}

# alias
alias update_all='brew update && brew upgrade && brew upgrade --cask && brew cleanup && pnpm upgrade -g --latest && omz update && git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull'
alias enable_cep_debug="defaults write com.adobe.CSXS.11 PlayerDebugMode 1"
alias disable_cep_debug="defaults write com.adobe.CSXS.11 PlayerDebugMode 0"

# language
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# environment variables

export PATH="/usr/local/sbin:$PATH"

# java
# PATH=/usr/local/opt/openjdk@11/bin:$PATH
# export JAVA_HOME=$(/usr/libexec/java_home)
# export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"

# mysql
# PATH=$PATH:/usr/local/mysql/bin

# export PATH=/Users/yutengjing/code/depot_tools:$PATH
# export PATH=$PATH:/Users/yutengjing/apps/flutter/1.22.4/bin
# export PATH=$PATH:/Users/yutengjing/apps/flutter/1.22.4/.pub-cache/bin

# sfv() {
#   export PATH=/Users/yutengjing/apps/flutter/$1/bin:$PATH
#   export PATH=/Users/yutengjing/apps/flutter/$1/.pub-cache/bin:$PATH
# }

# if [ "$YTJ_FLUTTER_VERSION" = "latest" ]; then
#     sfv latest
# fi

# flutter mirror
# export PUB_HOSTED_URL=https://pub.flutter-io.cn
# export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# Emscripten
# export PATH=$PATH:/Users/yutengjing/apps/emsdk
# export PATH=$PATH:/Users/yutengjing/apps/emsdk/upstream/emscripten
# export PATH=$PATH:/Users/yutengjing/apps/emsdk/node/12.18.1_64bit/bin
# export PATH=$PATH:/Users/yutengjing/apps/emsdk/python/3.7.4-2_64bit/bin
# export EMSDK=/Users/yutengjing/apps/emsdk
# export EM_CONFIG=/Users/yutengjing/apps/emsdk/.emscripten
# export EM_CACHE=/Users/yutengjing/apps/emsdk/upstream/emscripten/cache
# export EMSDK_NODE=/Users/yutengjing/apps/emsdk/node/12.18.1_64bit/bin/node
# export EMSDK_PYTHON=/Users/yutengjing/apps/emsdk/python/3.7.4-2_64bit/bin/python3

# android
# export PATH=$PATH:/Users/yutengjing/Library/Android/sdk/platform-tools

# react native
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools