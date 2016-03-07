#!/bin/bash

# [[ $- != *i* ]] && return

[[ $TERM == "dumb" ]] && PS1="$ " && return

PS1="\[\e]2;\u@\h: \W\a\e[1;32m\][\u@\h \W]\$ \[\e[0m\]"

source /usr/share/bash-completion/bash_completion
source /usr/share/git/completion/git-completion.bash

source $HOME/.bash_aliases
source $HOME/.bash_functions
