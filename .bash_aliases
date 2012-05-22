#!/bin/bash

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls="ls --color=auto"
alias ll="ls -lh"
alias la="ll -a"
alias li="ll -i"
alias lr="ll -R"

alias tree="tree -Csu"

alias mkdir="mkdir -p"
alias rmdir="rm -rf"

alias which="which -a"

alias df="df -h"
alias du="du -sh"
alias free="free -m"
alias ps="ps --forest"
alias top="htop"
alias vmstat="vmstat -S M"
alias sar="sar"

alias tcpdump="tcpdump -i eth0"
alias tshark="tshark"
alias mtr="mtr"
alias nmap="nmap"
alias sshw="ssh -N -f -q shellrsa;ssh phua-66004"
alias cscdump="tcpdump -nn -v -s 1500 -c 1 'ether[20:2] == 0x2000'"

alias emacs="emacs --debug-init -nw"

alias python="python2"

alias hcd="hadoop dfs -cd"
alias hls="hadoop dfs -ls"
alias hcat="hadoop dfs -cat"
alias hmkdir="hadoop dfs -mkdir"
alias hrm="hadoop dfs -rm"
alias hrmdir="hadoop dfs -rmr"

alias mntdrive="sshfs phua@aleph0:/mnt/drive ~/aleph0"
alias cmplayer="mplayer -cache 204800 -idx -sws 0 -zoom -fs"
alias ncplayer="nc aleph0 8080 | mplayer -cache 204800 -idx -"
ncstreamer() { cat $1 | nc -l -p 8080; }
alias cdplayer="mplayer -cdrom-device /dev/sr0 cdda://"
alias record="growisofs -Z /dev/sr0 -r -J -allow-limited-size"

alias fics="xboard -ics -icshost freechess.org"
alias chess="xboard -fcp /usr/bin/gnuchess --xboard -fd /usr/local/bin -scp /usr/local/bin/gnuchess --xboard -sd /usr/local/bin"
