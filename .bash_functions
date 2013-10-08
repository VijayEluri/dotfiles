#!/bin/bash

# shopt -s huponexit
# function background() {
#     kill -s SIGTSTP $1
#     bg
#     disown
# }

function backup() {
    cp $1{,.backup}
}

function recover() {
    path=/proc/$(lsof | grep $1 | gawk '{ print $2 }')/fd
    path=$path/$(ls -l $path | grep $1 | gawk '{ print $8 }')
    cp $path $1.recovered
}

function google() {
    firefox https://www.google.com/search?q=$(echo $@ | sed 's/\ /+/g')
}

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

function dbquery() {
    sqsh -S "schema" -U "username" -P "password" -C "$1"
}
