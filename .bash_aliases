#eval `dircolors -b /etc/DIR_COLORS`

alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ll -a"
alias lp="la | less"
alias lr="ls -lR"

alias tree="tree -Csu"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias mkdir="mkdir -p"

alias urxvt="urxvt --loginShell --color1 Orange -depth 32 +j -tr -tint blue -sh 40 -bg black -fg white -fn xft:Bitstream Vera Sans Mono:pixelsize=15 -fb 9x15bold,xft:Bitstream Vera Sans Mono -sl 1024"
alias emacs="emacs -nw"
alias xemacs="emacs -fn 6x13"
alias clojure="java -server -cp /path/to/jline.jar:/path/to/clojure.jar jline.ConsoleRunner clojure.lang.Repl"

alias ncplayer="netcat aleph0 2020 | mplayer -cache 204800 -idx -"
alias cmplayer="mplayer -cache 200000 -idx -sws 0 -zoom -fs"
alias mntmedia="sshfs user@host:/mnt /media"

ncstreamer () { cat $1 | nc -l -p 2020; }