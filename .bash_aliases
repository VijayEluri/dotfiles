# eval `dircolors -b /etc/DIR_COLORS`

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls="ls --color=auto"
alias ll="ls -lh"
alias la="ll -a"
alias lr="ll -R"
alias lp="la | less"

alias tree="tree -Csu"

alias mkdir="mkdir -p"

alias df="df -h"
alias du="du -sh"

alias emacs="emacs --debug-init -nw"
# alias etags="/usr/bin/etags.emacs"

alias rash="ssh -N -f -q shellrsa;ssh phua-66004"
# alias crawl="wget -nv -w 15 --random-wait -k -m"
# alias wpdf="wget -r -l1 --no-parent -A.pdf $1"
# alias curl="curl"

alias fics="xboard -ics -icshost freechess.org"
alias chess="xboard -fcp /usr/bin/gnuchess --xboard -fd /usr/local/bin -scp /usr/local/bin/gnuchess --xboard -sd /usr/local/bin"

alias mntdrive="sshfs phua@aleph0:/mnt/drive ~/aleph0"
alias cmplayer="mplayer -cache 204800 -idx -sws 0 -zoom -fs"
alias ncplayer="nc aleph0 8080 | mplayer -cache 204800 -idx -"
ncstreamer () { cat $1 | nc -l -p 8080; }
