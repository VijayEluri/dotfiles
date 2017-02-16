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
alias ncdu="ncdu -r"
alias free="free -hwlt"
alias pgrep="pgrep -a"
alias pp="ps -eFly"
alias pt="ps -eLF"
# alias pstree="ps -ejFlyH"
# alias pmap="pmap -x"
alias top="htop"
alias vmstat="vmstat -S M"
# alias slabtop="sudo slabtop"

# iproute2
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
# alias tcpflow="tcpflow"
# alias nmap="sudo nmap"
# alias kismet="sudo kismet"
# alias airmon-ng="sudo airmon-ng"
# alias airodump-ng="sudo airodump-ng"

# alias wget="curl -O"
# alias mirror="wget -r -nc -p -E -k -np"

alias svndiff="svn diff --diff-cmd diff -x -b"
# alias patch="patch -p0 <FILE"

# alias gcc="gcc -Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -g -v"
alias gas="as"
# alias gdb="gdb -tui"
alias cachegrind="valgrind --tool=cachegrind"
alias callgrind="valgrind --tool=callgrind"

# alias java="java -server"
alias jhprof="java -agentlib:hprof"
alias jps="jps -mlvV"
alias jstatd="jstatd -J-Djava.security.policy=$HOME/workspaces/java/jstatd.all.policy"
alias er_print="rlwrap er_print"
alias jfr="java -XX:+UnlockCommercialFeatures -XX:+FlightRecorder" # " -XX:StartFlightRecording=duration=60s,filename=myrecording.jfr"

alias jasmin="java -jar $HOME/local/jasmin-2.4/jasmin.jar"
alias dejasmin="java -cp $(find $HOME/local/tinapoc-0.4-alpha/bin -name "*.jar" -printf "%p:") dejasmin"
alias jd="java -jar $HOME/local/jars/jd-gui.jar"
alias cfr="java -jar $HOME/local/jars/cfr.jar"
alias procyon="java -jar $HOME/local/jars/procyon-decompiler.jar"

alias sbcl="rlwrap sbcl"

alias kali32="qemu-system-i386 -enable-kvm -net nic -net user ~/mnt/kali/kali-i386.img"
alias kali64="qemu-system-x86_64 -enable-kvm -net nic -net vde ~/mnt/kali/kali-x86_64.img"

alias torfox="$HOME/local/tor-browser_en-US/Browser/start-tor-browser --detach"

# TODO

alias open="xdg-open"

alias mount="sudo mount"        # -o uid=$(id -u -n),gid=$(id -g -n)
alias umount="sudo umount"
alias sshmount="sshfs $USER@aleph0:/mnt/dram $HOME/mnt/aleph0"
alias sshumount="fusermount -u $HOME/mnt/aleph0"

# alias record="growisofs -Z /dev/sr0 -r -J -allow-limited-size"
alias isotocd="cdrecord -v dev=/dev/sr0"
alias isotodvd="growisofs -dvd-compat -Z /dev/sr0="
alias handbrake="ghb"

# alias mplayer="mpv"
# alias amplayer="mplayer -vo caca"
# alias cmplayer="mplayer -cache 204800 -idx -sws 0 -zoom -fs"
alias emplayer="mplayer -alang eng -slang eng"
alias cdplayer="mplayer -cdrom-device /dev/sr0 cdda://"
alias dvdplayer="mplayer dvd://1 -dvd-device /dev/sr0"

alias ncplayer="nc $HOSTNAME 8080 | mplayer -cache 204800 -idx -"
ncstreamer() { cat $1 | nc -l -p 8080; }

alias castnow="node $HOME/node_modules/castnow/index.js"
alias castmp4="node $HOME/node_modules/castnow/index.js --tomp4"

alias wbez="rtl_fm -f 91.5e6 -M wbfm -s 240k -r 44.1k - | aplay -r 44100 -f S16_LE -t raw"
alias cpd4="rtl_fm -f 460.150e6 -M fm -s 240k -r 44.1k - | aplay -r 44100 -f S16_LE -t raw"

alias fics="xboard -ics -icshost freechess.org"
alias chess="xboard -fcp /usr/bin/gnuchess --xboard -fd /usr/local/bin -scp /usr/local/bin/gnuchess --xboard -sd /usr/local/bin"
