#!/bin/bash

# $ declare -[Ff]

# $ time_t timestamp
function time_t() {
    date +"%Y-%m-%d %H:%M:%S.%N" -d @${1}
}

# $ nohupify pid
# function nohupify() {
#     kill -s SIGTSTP $1
#     bg
#     disown
# }

# $ backup /path/to/file
function backup() {
    cp $1{,.backup}
}

# $ recover /path/to/file
function recover() {
    FILE=/proc/$(lsof | grep $1 | awk '{ print $2 }' | uniq)/fd
    FILE=$FILE/$(ls -l $FILE | grep $1 | awk '{ print $(NF-2) }')
    cp $FILE $1.recovered
}

# $ google query
function google() {
    elinks https://www.google.com/search?q=$(echo $@ | sed 's/\ /+/g')
    # elinks https://duckduckgo.com/?q=$(echo \!g $@ | sed 's/\ /+/g')
}

# $ xkcd [id]
function xkcd() {
    IMG=$(curl -s https://xkcd.com/$1/ | grep -A1 '<div id="comic">' | grep "<img")
    LINT="xmllint --xpath \"/img/@%s\" - <<<\$IMG | awk -F \\\\\" '{ print \$2 }'"
    SRC=http:$(eval `printf "$LINT" "src"`)
    TITLE=$(eval `printf "$LINT" "title"`)
    ALT=$(eval `printf "$LINT" "alt"`)

    echo $ALT: $TITLE | recode HTML
    feh $SRC
}

# TODO .gitconfig
# git fetch && git merge FETCH_HEAD
function git_rebase_upstream_master() {
    CURRENT_BRANCH=$(git branch | grep '^* ' | awk '{ print $2 }')

    git stash

    git checkout master
    git pull --rebase upstream master
    git push -u origin master

    git checkout $CURRENT_BRANCH
    git pull --rebase origin master
    # git push -u origin $CURRENT_BRANCH

    git stash pop

    # ctags -e -R .
    # CWD=$(realpath .) (cd / && find $CWD -name "*.java" > $CWD/cscope.files) ; cscope -b -q
    gtags
    mkid

    # make || ant
}

# $ jstackp pname
function jstackp() {
    jstack $(jps | grep $1 | awk '{ print $1 }')
}

# $ cfrdir [/path/to/directory]
function cfrdir() {
    [ $# -eq 1 ] && cd $1
    for file in $(find . -name \*.class); do cfr $file > ${file%.class}.java; done
}

# $ cfrjar /path/to/jar
function cfrjar() {
    DIRNAME=$(dirname $1)
    FILENAME=$(basename $1)
    PATHNAME=${FILENAME%.*}

    cd $DIRNAME && mkdir $PATHNAME && cd $PATHNAME
    jar xf ../$FILENAME
    cfrdir .
}

# TODO

function man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
                   LESS_TERMCAP_me=$'\e[0m' \
                   LESS_TERMCAP_se=$'\e[0m' \
                   LESS_TERMCAP_so=$'\e[01;44;33m' \
                   LESS_TERMCAP_ue=$'\e[0m' \
                   LESS_TERMCAP_us=$'\e[01;32m' \
                   command man "$@"
}

function trim() {
    if [ $# -eq 0 ]; then X=16; else X=$1; fi
    awk "{ print substr(\$1, 0, $X) }"
}

function review() {
    (head ; tail) <$1
}

function colreview() {
    review $1 | column -t
}

function csvview() {
    column -s, -t <$1 | less # [-N -#2]
}

function fixview() {
    cat $1 | tr "\001" "|" | strings | less
}

function mssql_query() {
    sqsh -S "schema" -U "username" -P "password" -C "$1"
}
