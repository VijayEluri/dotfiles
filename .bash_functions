decomp () {
    if [ -f $1 ] ; then
        case $1 in
            *.7z)      7z x $1       ;;
            *.bz2)     bunzip2 $1    ;;
            *.gz)      gunzip $1     ;;
            *.rar)     rar x $1      ;;
            *.tar)     tar xf $1     ;;
            *.tar.bz2) tar xjf $1    ;;
            *.tbz2)    tar xjf $1    ;;
            *.tar.gz)  tar xzf $1    ;;
            *.tgz)     tar xzf $1    ;;
            *.Z)       uncompress $1 ;;
            *.zip)     unzip $1      ;;
            *)         echo "Unknown file type: '$1'" ;;
        esac
    else
        echo "Invalid file: '$1'"
    fi
}
