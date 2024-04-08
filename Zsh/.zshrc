# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
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
  node
  web-search
  # alias-finder
  command-not-found
  # hitokoto
  rust
  safe-paste
  sudo
  themes
)

# load plugins in none vscode integrated terminal
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  plugins+=(
    git-auto-fetch
  )
fi

# unofficial
plugins+=(
  zsh-npm-scripts-autocomplete
  zsh-autosuggestions
  zsh-syntax-highlighting
  # you-should-use
  fzf-tab
  # pnpm-shell-completion
)

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

# language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8


# 将下划线和中划线视为和普通字母一样作为一个单词的一部分
WORDCHARS+='_-'

# bindkey
bindkey '^[[1;3B' autosuggest-execute

# ------------------------ proxy -----------------------------
TIMEFMT=$'\nTime %E Memory %MKiB CPU %P'

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
# proxyWithoutPrompt

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
  local go_version=$(go version)
  go_version=${go_version:13}

  echo "MacOS: $(sw_vers | sed '2q;d' | cut -f 3)
VSCode: $(c --version | head -n 1)
Typescript: $(tsc --version | cut -d ' ' -f 2)
Node: $(node --version)
Npm: $(npm --version)
Yarn: $(yarn --version)
Pnpm: $(pnpm --version)
Rustc: $(rustc --version | cut -d ' ' -f 2)
Go: $go_version
Python3: $(python3 --version | cut -d ' ' -f 2)"
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

function get-ip() {
  local ip=$(ipconfig getifaddr en0)
  echo $ip
  echo $ip | pbcopy
}

function n() {
  if [[ ${1##*.} == 'ts' ]]; then
    ts-node $@
  else
    node $@
  fi
}

function o() {
  if [[ $1 == '' ]]; then
    open .
  else
    open $@
  fi
}

function t() {
  if [[ -f ./package.json ]]; then
    nr test
  else
    cargo test
  fi
}

function i() {
  cd ~/code/$1
}

function gpu() {
  local current_branch=$(git rev-parse --abbrev-ref HEAD)
  git push --set-upstream origin $current_branch
}

function it2() {
  local wd="$PWD"
  local args="$@"

  if [ -d "$1" ]; then
    wd="$1"
    args="${@:2}"
  fi

  local text="cd $wd"
  local cmd=""
  if [ -n "$args" ]; then
    cmd=" && $args"
    text="$text$cmd"
  fi

  # https://iterm2.com/documentation-scripting.html
  # delay 1 is needed to get current session
  osascript <<EOF
        tell application "iTerm"
            activate
            delay 1
            tell current session of current window
                write text "$text"
            end tell
        end tell
EOF
}

function sic() {
  rg "$@" $(git diff --cached --name-only)
}

function fp() {
  fd -I -d 1 "$@" node_modules/.pnpm/
}

function update-all() {
  # proxy
  brew update
  brew upgrade
  brew upgrade --cask
  brew cleanup
  
  # js
  corepack prepare npm@latest --activate
  corepack prepare pnpm@latest --activate
  npm upgrade -g --latest
  pnpm up -g --latest
  # bun upgrade

  # other languages
  # rustup update
  # go-global-update
  # cargo install-update -a

  # zsh
  git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull
  git -C ~/.oh-my-zsh/custom/plugins/zsh-npm-scripts-autocomplete pull
  git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions pull
  git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting pull
  git -C $ZSH_CUSTOM/plugins/you-should-use pull
  git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab pull
  omz update
}

function remove-types() {
  swc $1 -C jsc.target=esnext -d .
}

# ------------------------ alias -----------------------------
alias lstcp="sudo lsof -iTCP -sTCP:LISTEN -P -n"
# override the oh-my-zsh defined at ~/.oh-my-zsh/lib/directories.zsh
alias l="lsd -lah"
alias rmdss='find . -name ".DS_Store" -type f -delete'
function v2gif() {
    # Based on https://gist.github.com/SheldonWangRJT/8d3f44a35c8d1386a396b9b49b43c385
    output_file="${1%.*}.gif"
    ffmpeg -y -i "$1" -v quiet -vf scale=iw/2:ih/2 -pix_fmt rgb8 -r 10 "$output_file" && gifsicle -O3 "$output_file" -o "$output_file"
}

# CEP debug mode
alias enable_cep_debug="defaults write com.adobe.CSXS.11 PlayerDebugMode 1"
alias disable_cep_debug="defaults write com.adobe.CSXS.11 PlayerDebugMode 0"
alias killcep="pkill -9 CEPHtmlEngine"

# git
alias ga="git add -A"
alias gp="git push"
alias gpf="git push --force"
alias gpl="git pull"
alias gpm="git pull origin master"
alias gcm="git commit -m"
alias gam="ga && gcm"
alias gca="git commit --amend"
alias gl="git log --pretty='%C(yellow)%h %C(cyan)%cd %Cblue%aN%C(auto)%d %Creset%s' --graph --date=relative --date-order"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gcl="git clone"
alias gr="git reset --hard"
alias m="git checkout master"

# vscode
alias c="code-insiders"
alias rc="c ~/.zshrc"
alias hosts="c /etc/hosts"

# node package manager
alias p="pnpm"
alias pyr="p why -r"
alias pyrl="p why -r --long"
alias f="pnpm --filter"
alias nido="ni -D --prefer-offline"
alias niod="ni --prefer-offline -D"
alias niw="p -w add --prefer-offline"
alias niwd="p -w add --prefer-offline -D"
alias nid="ni -D"
alias nio="ni --prefer-offline"
alias s="nr start"
alias upkgs="ncu -u -t minor"
alias b="nr build"
alias dev="nr dev"
alias rmpkgs="rm -rf node_modules && pnpm -r exec rm -rf node_modules"

# cargo
alias cr="cargo run"

# https://github.com/ajeetdsouza/zoxide
alias j=zoxide



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm
export PATH="/Users/yutengjing/Library/Application Support/fnm:$PATH"
eval "`fnm env --use-on-cd --log-level error`"
fpath+=~/.zfunc

# pnpm
export PNPM_HOME="/Users/yutengjing/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# ------------------------ environment variables -----------------------------
# set node_modules/.bin to path when in VSCode terminal
if [[ "$TERM_PROGRAM" == "vscode" && -d "$PWD/node_modules/.bin" ]]; then
  export PATH="$PWD/node_modules/.bin:$PATH"
fi

export VUE_EDITOR=code-insiders

# export PNPM_GLOBAL_NODE_MODULES=$(pnpm root -g

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
