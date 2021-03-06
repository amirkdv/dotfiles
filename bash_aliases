#!/bin/bash
declare lscolorflag=
declare lsgroupdirsflag=
declare grepcolorflag='--color=auto'
case $OSTYPE in
  darwin*)
    lscolorflag='-G'
    ;;
  linux-gnu)
    lsgroupdirsflag='--group-directories-first'
    alias ll='ls -alh --group-directories-first'
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        lscolorflag='--color=auto'
    fi
    ;;
esac
alias ll="ls -alh $lsgroupdirsflag $lscolorflag"
alias grep="grep $grepcolorflag"
alias tree="tree -a -C"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias opn='xdg-open 2>/dev/null'

# use 256 colors with tmux
alias tmux='tmux -2'

# output of `script` contains all the color codes which the following cleans up
# first regex takes care of color codes, taken from:
#   http://www.commandlinefu.com/commands/view/3584/remove-color-codes-special-characters-with-sed
# second regex gets rid of all control characters; from \x01 to \x1F as per:
#   http://en.wikipedia.org/wiki/C0_and_C1_control_codes
alias script_colorsafe="( FN=/tmp/script_\$(date +%s) ; \
                          script \$FN ; \
                          sed -ri 's/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g; s/[\x01-\x1F]//g' \$FN )"
