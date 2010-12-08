# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
PS1='\[\e]2;\u@\h: \W\a\e[32;1m\][\u@\h \W]\$ \[\e[0m\]'
