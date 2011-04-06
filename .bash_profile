#!/bin/bash

set -o emacs

ANDROID_HOME=$HOME/local/android-sdk
ANT_HOME=/usr/share/java/apache-ant
CATALINA_HOME=/usr/share/java/apache-tomcat
ECLIPSE_HOME=$HOME/usr/local/eclipse
ECLIM_HOME=$ECLIPSE_HOME/plugins/org.eclim_1.6.2
JAVA_HOME=/opt/java
MAVEN_HOME=/opt/maven

export ANDROID_HOME ANT_HOME CATALINA_HOME ECLIPSE_HOME ECLIM_HOME JAVA_HOME MAVEN_HOME
export PATH=$ANDROID_HOME/tools:$ANT_HOME/bin:$CATALINA_HOME/bin:$ECLIPSE_HOME:$ECLIM_HOME/bin:$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH

export EDITOR=emacsclient
export HISTCONTROL=ignoreboth
export HISTFILESIZE=65535
export HISTSIZE=65535
export MAIL=$HOME/Mail
export PAGER=less
export SHELL=/bin/bash
# export SHELL=/bin/zsh
export TERM=xterm-256color
# export TERM=rxvt-unicode
# export TERM=screen

shopt -s cdspell
# shopt -s checkwinsize
shopt -s histappend

source $HOME/.bashrc
source $HOME/.bash_aliases
source $HOME/.bash_functions
# source /etc/bash_completion

# eval `keychain [--noask] --eval [--agents ssh] id_rsa` || exit 1
# eval `keychain --eval id_rsa`
