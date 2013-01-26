# set PATH so it includes user bin if it exists
if [ -d ~/bin ] ; then
	PATH=~/bin:"${PATH}"
fi

export PATH

EDITOR="vim"
VISUAL="vim"
bindkey -v 

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# automatically enter directories without cd
setopt auto_cd

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# completion
autoload -U compinit && compinit

# rainbows
autoload -U colors && colors

# advanced prompts
autoload -U promptinit && promptinit

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1="%{$fg[blue]%}[%n@%m:%~]%{$reset_color%}
\$ "

# huge history
export HISTSIZE=5000
export HISTFILE="$HOME/.zsh/history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# functions
if [ -e "$HOME/.zsh/functions" ]; then
  source "$HOME/.zsh/functions"
fi

# aliases
if [ -e "$HOME/.zsh/aliases" ]; then
  source "$HOME/.zsh/aliases"
fi

# vim:ft=zsh