#!/bin/bash

function backup() {
    cp $1{,.bak}
}

function recover() {
    path=/proc/$(lsof | grep $1 | gawk '{ print $2 }')/fd
    path=$path/$(ls -l $path | grep $1 | gawk '{ print $8 }')
    cp $path $1.recovered
}

function jstackp() {
    jstack $(jps | grep $1 | gawk '{ print $1 }')
}

function jkillp() {
    kill -9 $(jps | grep $1 | gawk '{ print $1 }')
}

function fixless() {
    cat $1 | tr "\001" "|" | strings | less
}

function dbselect() {
    sqsh -S Schema -U "username" -P "password" -C "$1"
}
