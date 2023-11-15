function source_if_exists() {
  if [[ -f $1 ]]; then
    source $1
  fi
}

source_if_exists "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

setopt appendhistory autocd beep notify
unsetopt extendedglob nomatch
bindkey -v
bindkey '^R' history-incremental-search-backward

HISTFILE=~/.cache/zsh-histfile
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  1password
  aws
  brew
  docker
  docker-compose
  gh
  git
  git-commit
  golang
  helm
  kubectl
  kubectx
  pre-commit
  rust
  terraform
  vi-mode
  vscode
  zoxide
  zsh-autosuggestions
  zsh-syntax-highlighting
  zaw
)

export TERM="xterm-256color"
export ZSH="${HOME}/.oh-my-zsh"
export VIRTUAL_ENV_DISABLE_PROMPT=0
export LANG=en_US.UTF-8
export HISTFILESIZE=1000000
export HISTSIZE=1000000

source_if_exists "${HOME}/.aliases"

PATH="/opt/homebrew/bin/python3:${PATH}"
PATH="${HOME}/.local/bin:${PATH}"
PATH="${PATH}:${HOME}/.cargo/bin"

autoload -Uz compinit
compinit -d ~/.cache/zcompdump

source_if_exists "$ZSH/oh-my-zsh.sh"
source_if_exists "/opt/homebrew/opt/asdf/libexec/asdf.sh"
source_if_exists "/home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh"
source_if_exists "${HOME}/.agent-bridge.sh"
source_if_exists "${HOME}/.config/broot/launcher/bash/br"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(atuin init zsh)"
