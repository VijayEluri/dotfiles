#!/bin/bash

alias a="apropos"
alias i="info"
alias m="man"
# alias whatis="whatis"
# alias whereis="whereis"
alias which="which -a"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls="ls --color=auto --classify"
alias ll="ls -lhv"
alias la="ll -a"
alias lt="ll -tr"
# alias tree="tree -ACF"
# alias lr="tree -h --du"

alias mkdir="mkdir -p"
alias rmdir="rm -rf"
alias shred="shred -zu"
alias trash="mv -t ~/.trash"

# alias grep="ack"
alias grep="grep --color=auto"
alias xargs="xargs -P4"
alias locate="slocate"

alias df="df -ah --total"
alias du="du -sh --total"
alias free="free -ht"
alias pp="ps -eFly"
alias pt="ps -eLf"
# alias pstree="pstree"
alias top="htop"

# sysstat: iostat mpstat pidstat sar nfsiostat cifsiostat
# procps: vmstat
# alias vmstat="vmstat -S M"

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
# alias nmap="sudo nmap"
# alias aircrack="sudo aircrack-ng"
# alias kismet="sudo kismet"

# alias wget="curl -O"
alias wgetr="wget -r -nc -p -E -k -np"

alias sshrsa="ssh -N -f -q shellrsa; ssh phua-66004"

alias emacs="emacs --debug-init -nw"

alias sbcl="rlwrap sbcl"
alias abcl="java -jar ~/local/jars/abcl.jar"

# alias gless="less -TGTAGS -t"
# alias grless="less -TGRTAGS -t"

# alias gcc="gcc -Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -g -v"
alias gas="as"
alias gdb="gdb -tui"

alias pmap="pmap -x"
alias ltrace="ltrace"
alias strace="strace"

alias cachegrind="valgrind --tool=cachegrind"
alias callgrind="valgrind --tool=callgrind"

alias python="python2"
alias ipython="ipython2"
# alias pystall="python setup.py install --home=~/local"

alias java="java -server"
alias jprof="java -agentlib:hprof"
alias jps="jps -lmvV"

jstackp() { jstack $(jps | grep $1 | awk '{ print $1 }'); }
jkillp() { kill -9 $(jps | grep $1 | awk '{ print $1 }'); }

alias jstatd="jstatd -J-Djava.security.policy=/path/to/jstatd.all.policy"
alias er_print="rlwrap er_print"

# jad mocha krakatau
alias jasmin="java -jar ~/local/jasmin-2.4/jasmin.jar"
alias cfr="java -jar ~/local/jars/cfr_0_79.jar"
alias procyon="java -jar ~/local/jars/procyon-decompiler-0.5.25.jar"

# TODO

alias usync="rsync -a --delete ~/workspaces ~/mnt/usb"
# alias async="rsync -a --delete -e ssh /home/phua/workspaces/linux/dotfiles phua@aleph0:/home/phua/workspaces/linux"

alias mount="sudo mount -o uid=phua,gid=phua"
alias umount="sudo umount"

alias fmount="sshfs phua@aleph0:/mnt/dram ~/aleph0"
alias fumount="fusermount -u ~/aleph0"

alias record="growisofs -Z /dev/sr0 -r -J -allow-limited-size"
alias isorecord="cdrecord -v dev=/dev/sr0"

alias cmplayer="mplayer -cache 204800 -idx -sws 0 -zoom -fs"
alias cdplayer="mplayer -cdrom-device /dev/sr0 cdda://"
alias dvdplayer="mplayer dvd://1 -dvd-device /dev/sr0"

alias ncplayer="nc aleph0 8080 | mplayer -cache 204800 -idx -"
ncstreamer() { cat $1 | nc -l -p 8080; }

alias fics="xboard -ics -icshost freechess.org"
alias chess="xboard -fcp /usr/bin/gnuchess --xboard -fd /usr/local/bin -scp /usr/local/bin/gnuchess --xboard -sd /usr/local/bin"

alias clamscan="clamscan -l ~/clamscan.log -i"
