# eval `dircolors -b /etc/DIR_COLORS`

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# ls [-dilRs]
alias ls="ls --color=auto"
alias ll="ls -lh"
alias la="ll -a"
alias lr="ll -R"
alias lp="la | less"

alias tree="tree -Csu"

alias mkdir="mkdir -p"

alias df="df -h"
alias du="du -sh"

alias emacs="emacs -nw"
alias xemacs="emacs -fn 6x13"
# alias conkeror="/path/to/conkeror/xulrunner-stub &"
# alias etags="/usr/bin/etags.emacs"

# alias crawl="wget -nv -w 15 --random-wait -k -m"
# alias curl="curl"

alias bsh="java -jar /usr/share/java/bsh.jar"

alias mntdrive="sshfs phua@aleph0:/mnt/drive ~/aleph0"
alias cmplayer="mplayer -cache 204800 -idx -sws 0 -zoom -fs"
alias ncplayer="netcat aleph0 8080 | mplayer -cache 204800 -idx -"
ncstreamer () { cat $1 | nc -l -p 8080; }
