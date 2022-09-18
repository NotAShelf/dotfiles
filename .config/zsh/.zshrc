# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/home/notashelf/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export GPG_TTY=$(tty)

zmodload zsh/zprof

# Include my aliases
source "$HOME"/.config/zsh/aliases.zsh

# fix locale problems
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# xdg being a very viby boy
source $HOME/.config/zsh/xdg-exports.zsh

# Source OMZ configurations
source ~/.config/zsh/oh-my-zsh.zsh

# History Options
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export HISTSIZE=50000
export SAVEHIST=50000

# Cache completitions = moar speed!
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "~/.cache/zsh/.zcompcache"

# Personal Completitions
# for some reason this does not seem to be done by omz, shame
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
#fpath=($fpath ~/.config/zsh/completions)
autoload -U compinit && compinit

# Logs function for pacman 
source ~/.config/zsh/plog.zsh
