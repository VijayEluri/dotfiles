#!/bin/bash

alias a="apropos"
alias i="info"
alias m="man"
alias whatis="whatis"
alias whereis="whereis"
alias which="which -a"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls="ls --color=auto --classify"
alias ll="ls -lhv"
alias la="ll -a"
alias lt="ll -tr"
alias tree="tree -ACF"
alias lr="tree -h --du"

alias mkdir="mkdir -p"
alias rmdir="rm -rf"
alias shred="shred -zu"

# alias grep="ack"
alias grep="grep --color=auto"
alias xargs="xargs -P4"

alias df="df -h"
alias du="du -sh"
alias free="free -ht"
alias pmap="pmap"
alias pp="ps -eFly"
alias pt="ps -eLf"
alias top="htop"
alias vmstat="vmstat -S M"
alias sar="sar"

# alias ifconfig="ip addr"
# alias nameif="ip link"
# alias arp="ip neigh"
# alias route="ip route"
# alias iptunnel="ip tunnel"
# alias ipmaddr="ip maddr"
# alias iwconfig="iw dev wlan0 link"
# alias netstat="ss"
# alias nslookup="dig; host; whois"
# alias traceroute="traceroute"
# alias mtr="mtr"

# alias nc="netcat"
# alias tcpdump="sudo tcpdump -i wlan0"
# alias tshark="sudo tshark"
# alias nmap="sudo nmap -P0"
# alias aircrack="sudo aircrack-ng"
# alias kismet="sudo kismet"

alias mount="sudo mount -o uid=phua,gid=phua"
alias umount="sudo umount"

alias emacs="emacs --debug-init -nw"

# alias gcc="gcc -Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -g -v"
alias gas="as"
alias gdb="gdb -tui"

alias python="python2"

alias java="java -server"
alias jprof="java -agentlib:hprof"
alias jps="jps -lmvV"
jstackp() { jstack $(jps | grep $1 | gawk '{ print $1 }'); }
jkillp() { kill -9 $(jps | grep $1 | gawk '{ print $1 }'); }
# alias get_eclipse="find . -name .project -o -name .classpath -exec tar --append --file=projects.tar {} \;"

# alias wget="curl -O"
alias wgetr="wget -r -nc -p -E -k -np"

alias sshrsa="ssh -N -f -q shellrsa; ssh phua-66004"

alias mntdrive="sshfs phua@aleph0:/mnt/dram ~/aleph0"
alias umntdrive="fusermount -u ~/aleph0"

alias ncplayer="nc aleph0 8080 | mplayer -cache 204800 -idx -"
ncstreamer() { cat $1 | nc -l -p 8080; }

alias cmplayer="mplayer -cache 204800 -idx -sws 0 -zoom -fs"
alias cdplayer="mplayer -cdrom-device /dev/sr0 cdda://"
alias dvdplayer="mplayer dvd://1 -dvd-device /dev/sr0"

alias record="growisofs -Z /dev/sr0 -r -J -allow-limited-size"
alias isorecord="cdrecord -v dev=/dev/sr0"

alias fics="xboard -ics -icshost freechess.org"
alias chess="xboard -fcp /usr/bin/gnuchess --xboard -fd /usr/local/bin -scp /usr/local/bin/gnuchess --xboard -sd /usr/local/bin"
