#!/bin/bash

# $ alias

alias a="apropos"
alias i="info"
alias m="man"
# w whatis whereis which who
alias which="which -a"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls="ls --color=auto --classify"
alias ll="ls -lhv"
alias la="ll -a"
alias li="ll -i"
alias lt="ll -tr"
alias lc="lt -c"
alias lu="lt -u"

alias mkdir="mkdir -p"
alias rmdir="rm -rf"
alias shred="shred -zu"
alias trash="mv -t $HOME/.trash"

# alias grep="ack"
alias grep="grep --color=auto"
alias xargs="xargs -P4"

alias df="df -ah --total"
alias du="du -h"
alias free="free -hwlt"
alias psproc="ps -eFly"
alias psthread="ps -eLF"
# alias pstree="ps -ejFlyH"
alias top="htop"

# psmisc: fuser killall pstree peekfd
# sysstat: sar iostat mpstat pidstat nfsiostat cifsiostat
# procps-ng: free kill pkill pgrep pmap ps pwdx skill slabtop snice
# sysctl tload top uptime vmstat w watch
alias vmstat="vmstat -S M"
alias slabtop="sudo slabtop"

# ethtool -S

# iproute2:
alias ifconfig="ip address"     # -s stats
alias nameif="ip link"          # -s stats
alias arp="ip neighbor"
alias route="ip route"
alias iptunnel="ip tunnel"
alias ipmaddr="ip maddress"
alias tunctl="ip tuntap"
alias iwconfig="iw dev wlan0 link"
alias netstat="ss"              # -s stats
alias nslookup="dig"            # host whois

# alias traceroute="mtr"
# alias tc="tc"

# alias nc="netcat"
alias tcpdump="sudo tcpdump"
alias tshark="sudo tshark"
# alias nmap="sudo nmap"
# alias kismet="sudo kismet"
# alias airmon="sudo airmon-ng"
# alias airodump="sudo airodump-ng"

alias clamscan="clamscan -l /tmp/clamscan.log -i"

alias svndiff="svn diff --diff-cmd diff -x -b"

alias sbcl="rlwrap sbcl"
alias abcl="java -jar $HOME/local/jars/abcl.jar"

# alias gcc="gcc -Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -g -v"
alias gas="as"
# alias gdb="gdb -tui"
alias cachegrind="valgrind --tool=cachegrind"
alias callgrind="valgrind --tool=callgrind"

# TODO od xd hexdump radare2 rr ptrace strace ltrace dtrace sysdig
# alias pmap="pmap -x"

alias java="java -server"
alias jhprof="java -agentlib:hprof"
alias jps="jps -mlvV"
alias jstatd="jstatd -J-Djava.security.policy=$HOME/workspaces/java/jstatd.all.policy"
alias er_print="rlwrap er_print"
alias jfr="java -XX:+UnlockCommercialFeatures -XX:+FlightRecorder" # " -XX:StartFlightRecording=duration=60s,filename=myrecording.jfr"

alias jasmin="java -jar $HOME/local/jasmin-2.4/jasmin.jar"
alias jd="java -jar $HOME/local/jars/jd-gui.jar"
alias cfr="java -jar $HOME/local/jars/cfr.jar"
alias procyon="java -jar $HOME/local/jars/procyon-decompiler.jar"

alias python="python2"
alias ipython="ipython2"
alias virtualenv="virtualenv2"
alias pip="pip2"

alias kali32="qemu-system-i386 -enable-kvm -net nic -net user ~/mnt/kali/kali-i386.img"
alias kali64="qemu-system-x86_64 -enable-kvm -net nic -net vde ~/mnt/kali/kali-x86_64.img"

# alias sshrsa="ssh -N -f -q shellrsa; ssh phua-66004"

# TODO

alias open="xdg-open"

alias mount="sudo mount"
alias umount="sudo umount"

alias sshmount="sshfs $USER@aleph0:/mnt/dram $HOME/mnt/aleph0"
alias sshumount="fusermount -u $HOME/mnt/aleph0"

# alias record="growisofs -Z /dev/sr0 -r -J -allow-limited-size"
alias isotocd="cdrecord -v dev=/dev/sr0"
alias isotodvd="growisofs -dvd-compat -Z /dev/sr0="

# alias mplayer="mpv"
alias amplayer="mplayer -vo caca"
alias cmplayer="mplayer -cache 204800 -idx -sws 0 -zoom -fs"
alias cdplayer="mplayer -cdrom-device /dev/sr0 cdda://"
alias dvdplayer="mplayer dvd://1 -dvd-device /dev/sr0"

alias ncplayer="nc $HOSTNAME 8080 | mplayer -cache 204800 -idx -"
ncstreamer() { cat $1 | nc -l -p 8080; }

alias castnow="node $HOME/workspaces/forks/castnow/index.js"

alias fics="xboard -ics -icshost freechess.org"
alias chess="xboard -fcp /usr/bin/gnuchess --xboard -fd /usr/local/bin -scp /usr/local/bin/gnuchess --xboard -sd /usr/local/bin"

# TODO

# alias configure="./configure --prefix=$HOME/local"
# alias pystall="python setup.py install --home=$HOME/local"
# alias pipstall="pip2 install --install-option='--prefix=$HOME/local'"
# alias pipinstall="pip2 install --target=$HOME/local/lib/python2.7/site-packages"

# alias wget="curl -O"
# alias mirror="wget -r -nc -p -E -k -np"

# alias ypcat="ypcat -k hosts.byaddr | grep -i"
# alias netloop="taskset -c 3 netstat -a | grep -e Recv-Q; while [ 1 ]; do netstat -unap 2>/dev/null | grep --line-buffered -e java | awk '{ if ($2 > 0) print $0, d }' d=$(date); usleep 50; done"
