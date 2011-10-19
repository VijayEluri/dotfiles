[ -z "$PS1" ] && return

PS1='\[\e]2;\u@\h: \W\a\e[1;32m\][\u@\h \W]\$ \[\e[0m\]'

source $HOME/.bash_aliases
