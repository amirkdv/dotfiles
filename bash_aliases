#!/bin/bash
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi
alias ll="ls -alh --group-directories-first"
alias tree="tree -a -C"

if which trash-put >/dev/null 2>&1; then
  alias rm='echo "you probably want to use trash-put (t-p), if not use \rm" ; false'
  alias t-p='trash-put -v'
  alias t-l='trash-list'
else
  echo "trash-cli is not installed, install via: \`pip install trash-cli'" >&2
fi
