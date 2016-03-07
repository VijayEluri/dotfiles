#!/bin/bash

# $ declare -[Ff]

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

# $ recover [/path/to/]file
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

function torfox() {
    $HOME/local/tor-browser_en-US/Browser/start-tor-browser --detach
}

# TODO .gitconfig
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

    ctags -e -R .
    (cd / && find $1 -name "*.$2" > $1/cscope.files) ; cscope -b -q
    gtags
}

# $ jstackp process
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
    jar xf ../$BASENAME
    cfrdir .
}

# TODO

function review() {
    (head ; tail) <$1
}

function colreview() {
    review $1 | column -t
}

function colview() {
    column -s, -t $1 | less
}

function fixview() {
    cat $1 | tr "\001" "|" | strings | less
}

function mssql_query() {
    sqsh -S "schema" -U "username" -P "password" -C "$1"
}
