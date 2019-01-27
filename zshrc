autoload colors; colors

# General

bindkey -v
set editing-mode vi
set blink-matching-paren on
export KEYTIMEOUT=1
setopt rm_star_wait # sanity check for 'rm *'

# VCS

autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:*' enable git svn # enable only for git and svn
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "!"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' check-for-staged-changes true
#zstyle ':vcs_info:*+*:*' debug true
zstyle ':vcs_info:git*' formats "%{$fg[yellow]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
zstyle ':vcs_info:*' actionformats "%{$fg[yellow]%}%b%{$reset_color%}[%a]%u%c%{$reset_color%} "

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PS1='%m %B%1~%b%{$reset_color%} ${vcs_info_msg_0_}'

# History

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
bindkey '^R' raw-history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# All sessions append to one zsh command history
setopt append_history

# Do not write events to history that are duplicates of previous events
setopt hist_ignore_dups

# When searching history don't display results already cycled through twice
setopt hist_find_no_dups

# Remove extra blanks from each command line being added to history
setopt hist_reduce_blanks

# Include more information about when the command was executed, etc
setopt extended_history

# Completion

autoload -U compinit && compinit
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
bindkey '^i' expand-or-complete-prefix
setopt completeinword
zstyle ':completion:*' completer _complete _list _match _prefix

# Source

[ -f ~/.env ] && source ~/.env
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
