# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

GOROOT=/usr/local/go
if [[ -d $GOROOT ]]; then
  export GOROOT
  export PATH="$GOROOT/bin:$PATH"
fi

[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -f /etc/bash_completion ]] && ! shopt -oq posix && source /etc/bash_completion
[[ -f ~/.bash_ssh_agent ]] && source ~/.bash_ssh_agent && start_agent && add_identity
[[ -f ~/.bash_prompt ]] && source ~/.bash_prompt && setup_prompt
[[ -f ~/.bash_locale ]] && source ~/.bash_locale && setup_locale en_CA.utf8
