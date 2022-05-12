# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
source /Users/yutengjing/.cache/p10k-instant-prompt-yutengjing.zsh

export PATH="/usr/local/sbin:$PATH"

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
  command-not-found
  extract
  gh
  hitokoto
  rust
  safe-paste
  sudo
  themes
  z
)

# unofficial
plugins+=(
  zsh-npm-scripts-autocomplete
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# load plugins in none vscode integrated terminal
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  plugins+=(
    git-auto-fetch
  )
fi

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

# 将下划线和中划线视为和普通字母一样作为一个单词的一部分
WORDCHARS+='_-'

# bindkey
bindkey '^[SE' autosuggest-execute

# language
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# call nvm use automatically whenever you enter a directory that contains an .nvmrc file with a string telling nvm which node to use
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use --silent
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default --silent
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# gvm
[[ -s "/Users/yutengjing/.gvm/scripts/gvm" ]] && source "/Users/yutengjing/.gvm/scripts/gvm"

# pnpm completion
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# ------------------------ proxy -----------------------------
function proxyWithoutPrompt() {
  export http_proxy="http://127.0.0.1:7890"
  export https_proxy="http://127.0.0.1:7890"
  export all_proxy="socks5://127.0.0.1:7890"
  export no_proxy="localhost,127.0.0.1"

  export HTTP_PROXY="http://127.0.0.1:7890"
  export HTTPS_PROXY="http://127.0.0.1:7890"
  export ALL_PROXY="socks5://127.0.0.1:7890"
  export NO_PROXY="localhost,127.0.0.1,172.16.5.83,.gaoding.com,.gaoding.cn,.huanleguang.com"
}

function proxy() {
  proxyWithoutPrompt
  echo "HTTP Proxy on"
}

function noproxy() {
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

function node-docs() {
  local section=${1:-all}
  open_command "https://nodejs.org/docs/$(node --version)/api/$section.html"
}

function update-nvm() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
}

function ls-path() {
  echo -e ${PATH//:/\\n}
}

function file-count() {
  ls $1 | wc -l
}

function uninstall-vscode-insiders() {
  rm -rv ~/Library/Preferences/com.microsoft.VSCodeInsiders.plist 2>/dev/null
  rm -rv ~/Library/Caches/com.microsoft.VSCodeInsiders 2>/dev/null
  rm -rv ~/Library/Caches/com.microsoft.VSCodeInsiders.ShipIt 2>/dev/null
  rm -rv ~/Library/Application\ Support/Code\ -\ Insiders 2>/dev/null
  rm -rv ~/Library/Saved\ Application\ State/com.microsoft.VSCodeInsiders.savedState/ 2>/dev/null
  rm -rv ~/.vscode-insiders/ 2>/dev/null
}

function uninstall-vscode() {
  rm -rv ~/Library/Preferences/com.microsoft.VSCode.plist 2>/dev/null
  rm -rv ~/Library/Caches/com.microsoft.VSCode 2>/dev/null
  rm -rv ~/Library/Caches/com.microsoft.VSCode.ShipIt 2>/dev/null
  rm -rv ~/Library/Application\ Support/Code 2>/dev/null
  rm -rv ~/Library/Saved\ Application\ State/com.microsoft.VSCode.savedState/ 2>/dev/null
  rm -rv ~/.vscode/ 2>/dev/null
}

function ver() {
  echo "MacOS: ${$(sw_vers | sed '2q;d'):16}
VSCode: $(code-insiders --version | head -n 1)
Typescript: ${$(tsc --version):8}
Node: $(node --version)
Npm: $(npm --version)
Yarn: $(yarn --version)
Pnpm: $(pnpm --version)
Rustc: ${$(rustc --version):6}
Go: ${$(go version):13}
Python3: ${$(python3 --version):7}"
}

function n() {
  if [[ ${1##*.} == 'ts' ]]; then
    ts-node $@
  else
    node $@
  fi
}

function listening() {
  if [ $# -eq 0 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -n -P
  elif [ $# -eq 1 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
  else
    echo "Usage: listening [pattern]"
  fi
}

function i() {
  cd ~/code/$1
}

function mc() {
  mkdir $1 && c $1
}

# ------------------------ alias -----------------------------
alias update_all='brew update && brew upgrade && brew upgrade --cask && brew cleanup && update-nvm && npm upgrade -g --latest && rustup update && omz update && git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull'
alias lstcp="sudo lsof -iTCP -sTCP:LISTEN -P -n"
alias lah="lsd -lah"

# CEP debug mode
alias enable_cep_debug="defaults write com.adobe.CSXS.11 PlayerDebugMode 1"
alias disable_cep_debug="defaults write com.adobe.CSXS.11 PlayerDebugMode 0"

# git
alias ga="git add -A"
alias gp="git push"
alias gpl="git pull"
alias gcm="git commit -m"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gcl="git clone"

# vscode
alias rc="code-insiders ~/.zshrc"
alias c="code-insiders"

# node package manager
alias nid="ni -D"
alias nio="ni --prefer-offline"
alias s="nr start"

# ------------------------ environment variables -----------------------------
export PNPM_HOME="/Users/yutengjing/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# set node_modules/.bin to path when in VSCode terminal
if [[ "$TERM_PROGRAM" == "vscode" && -d "$PWD/node_modules/.bin" ]]; then
  export PATH="$PWD/node_modules/.bin:$PATH"
fi
