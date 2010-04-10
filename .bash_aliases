#eval `dircolors -b /etc/DIR_COLORS`

alias ls="ls --color=auto"
alias ll="ls -lh"
alias la="ll -a"
alias lp="la | less"
alias lr="ls -lR"

alias tree="tree -Csu"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias df="df -h"
alias du="du -sh"
alias mkdir="mkdir -p"
alias mv="mv -i"
alias rm="rm -i"
#alias rm="mv $@ -t ~/.trash"

alias emacs="emacs -nw"
alias xemacs="emacs -fn 6x13"
#alias conkeror="/path/to/conkeror/xulrunner-stub &"

#alias bsh="java -cp /path/to/bsh.jar bsh.Interpreter"
#alias clojure="java -server -cp /path/to/jline.jar:/path/to/clojure.jar jline.ConsoleRunner clojure.lang.Repl"
#alias rhino="java -cp /path/to/rhino/js.jar org.mozilla.javascript.tools.shell.Main"
#alias rhino="java -jar /path/to/rhino/js.jar"

alias ncplayer="netcat aleph0 2020 | mplayer -cache 204800 -idx -"
alias cmplayer="mplayer -cache 204800 -idx -sws 0 -zoom -fs"
alias mntmedia="sshfs phua@aleph0:/mnt/media ~/aleph0"
ncstreamer () { cat $1 | nc -l -p 2020; }
