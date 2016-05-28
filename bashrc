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

[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -f /etc/bash_completion ]] && ! shopt -oq posix && source /etc/bash_completion
#[[ -f ~/.bash_ssh_agent ]] && source ~/.bash_ssh_agent
[[ -f ~/.bash_prompt ]] && source ~/.bash_prompt
[[ -f ~/.bash_locale ]] && source ~/.bash_locale

# add /usr/sbin and /usr/local/bin to PATH on Mac OS X for homebrew.
[[ "$OSTYPE" == "darwin"* ]] && PATH=$PATH:/usr/sbin:/usr/local/sbin || :

# start tmux automatically, force 256 colors
which tmux >/dev/null && [[ -z $TMUX ]] && tmux
export EDITOR=vim

# set up npm so that global installs land in the homedir:
if which npm >/dev/null; then
  export NPM_PACKAGES="$HOME/.npm-packages"
  export PATH="$NPM_PACKAGES/bin:$PATH"
fi

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
