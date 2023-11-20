function source_if_exists() {
  if [[ -f $1 ]]; then
    source $1
  fi
}

source_if_exists "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

setopt appendhistory autocd beep notify
unsetopt extendedglob nomatch
bindkey -v
bindkey '^r' _atuin_search_widget

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
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

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

PATH="/opt/homebrew/bin/python3:${PATH}"
PATH="${HOME}/.local/bin:${PATH}"
PATH="${PATH}:${BMA_HOME:-$HOME/.bash-my-aws}/bin"
PATH="${PATH}:${HOME}/.cargo/bin"

source_if_exists "${HOME}/.aliases"
source_if_exists "$ZSH/oh-my-zsh.sh"
source_if_exists "${HOMEBREW_PREFIX}/opt/asdf/libexec/asdf.sh"
source_if_exists "${HOME}/.agent-bridge.sh"
source_if_exists "${HOME}/.config/broot/launcher/bash/br"
source_if_exists "${BMA_HOME:-$HOME/.bash-my-aws}/aliases"
source_if_exists "${HOME}/.inshellisense/key-bindings.zsh"

command -v atuin >> /dev/null && eval "$(atuin init zsh)"

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
compinit -d ~/.cache/zcompdump

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

