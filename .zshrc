if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.cache/zsh-histfile
HISTSIZE=10000
SAVEHIST=10000
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git aws zsh-autosuggestions zsh-syntax-highlighting zaw kubectl brew)

setopt appendhistory autocd beep notify
unsetopt extendedglob nomatch
bindkey -v
bindkey '^R' history-incremental-search-backward
set -o vi

export TERM="xterm-256color"
export ZSH="${HOME}/.oh-my-zsh"
export VIRTUAL_ENV_DISABLE_PROMPT=0
export LANG=en_US.UTF-8
export HISTFILESIZE=1000000
export HISTSIZE=1000000

PATH="/opt/homebrew/bin/python3:${PATH}"
PATH="/Users/alake/.local/bin:${PATH}"
PATH="${PATH}:${HOME}/.cargo/bin"

autoload -Uz compinit
compinit -d ~/.cache/zcompdump

eval "$(github-copilot-cli alias -- "$0")"

source $ZSH/oh-my-zsh.sh

if [[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ]]; then
  source /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

if [[ -f "${HOME}/.agent-bridge.sh "]]; then
  source "${HOME}/.agent-bridge.sh"
fi

command -v zoxide > /dev/null && eval "$(zoxide init zsh)"

if [[ -f "${HOME}/.config/broot/launcher/bash/br"]]; then
  source "${HOME}/.config/broot/launcher/bash/br"
fi


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

