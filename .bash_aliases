#!/bin/bash

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls="ls --color=auto"
alias ll="ls -lh"
alias la="ll -a"
alias li="ll -i"

alias tree="tree -Csu"

alias mkdir="mkdir -p"
alias rmdir="rm -rf"

alias which="which -a"

alias emacs="emacs --debug-init -nw"

alias df="df -h"
alias du="du -sh"
alias free="free -m"
alias ps="ps --forest"
alias top="htop"
alias vmstat="vmstat -S M"
alias sar="sar"

alias tcpdump="tcpdump -i eth0"
alias sshw="ssh -N -f -q shellrsa;ssh phua-66004"

function jstackp() { jstack `jps | grep $1 | awk '{ print $1 }'`; }
alias mocha="java mocha.Decompiler -v -o"

alias mntdrive="sshfs phua@aleph0:/mnt/drive ~/aleph0"
alias cmplayer="mplayer -cache 204800 -idx -sws 0 -zoom -fs"
alias ncplayer="nc aleph0 8080 | mplayer -cache 204800 -idx -"
ncstreamer() { cat $1 | nc -l -p 8080; }

alias fics="xboard -ics -icshost freechess.org"
alias chess="xboard -fcp /usr/bin/gnuchess --xboard -fd /usr/local/bin -scp /usr/local/bin/gnuchess --xboard -sd /usr/local/bin"
