# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.config/zsh/plugins/p10k.zsh

export GPG_TTY=$(tty)

# My own aliases & exports
# exports are now in .zshenv
source "$HOME"/.config/zsh/aliases.zsh

# Source OMZ configurations
source "$XDG_CONFIG_HOME"/zsh/oh-my-zsh.zsh

# History Options
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export HISTSIZE=50000
export SAVEHIST=50000

# Cache completitions = moar speed!
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path '"$XDG_CACHE_HOME"/zsh/.zcompcache'

# Personal Completitions
# for some reason this does not seem to be done by omz, shame
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
#fpath=($fpath ~/.config/zsh/completions)
autoload -U compinit && compinit -d "$XDG_CACHE_HOME"zsh/zcompdump-"$ZSH_VERSION"

# Source plugin loads, if necessary
source "$HOME"/.config/zsh/plugins/pnpm.zsh
source "$HOME"/.config/zsh/plugins/conda.zsh

# Source functions
source "$HOME"/.config/zsh/functions/paclog.zsh
source "$HOME"/.config/zsh/functions/timezsh.zsh
source "$HOME"/.config/zsh/functions/ffmpeg.zsh
