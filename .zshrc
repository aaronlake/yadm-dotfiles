if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt appendhistory autocd beep notify
unsetopt extendedglob nomatch
bindkey -v
bindkey '^R' history-incremental-search-backward

HISTFILE=~/.cache/zsh-histfile
HISTSIZE=10000
SAVEHIST=10000
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git vscode aws zsh-autosuggestions zsh-syntax-highlighting zaw \
        kubectl kubectx helm brew golang rust docker docker-compose \
        pre-commit zoxide terraform 1password vi-mode gh git git-commit asdf)

export TERM="xterm-256color"
export ZSH="${HOME}/.oh-my-zsh"
export VIRTUAL_ENV_DISABLE_PROMPT=0
export LANG=en_US.UTF-8
export HISTFILESIZE=1000000
export HISTSIZE=1000000

if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi

PATH="/opt/homebrew/bin/python3:${PATH}"
PATH="/Users/alake/.local/bin:${PATH}"
PATH="${PATH}:${HOME}/.cargo/bin"

autoload -Uz compinit
compinit -d ~/.cache/zcompdump

source $ZSH/oh-my-zsh.sh

if [[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ]]; then
  source /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

if [[ -f "${HOME}/.agent-bridge.sh" ]]; then
  source "${HOME}/.agent-bridge.sh"
fi

if [[ -f "${HOME}/.config/broot/launcher/bash/br" ]]; then
  source "${HOME}/.config/broot/launcher/bash/br"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

