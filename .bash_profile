#!/bin/bash

set -o emacs

export EDITOR="emacsclient -t"
export HISTCONTROL=ignoreboth
export HISTFILESIZE=65535
export HISTSIZE=65535
export MAIL=$HOME/Mail
export PAGER=less
export SHELL=/bin/bash
export SUDO_EDITOR="emacsclient -c -a emacs"
export TERM=rxvt-256color

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

shopt -s cdspell
shopt -s histappend

ANDROID_HOME=$HOME/usr/local/android-sdk
ANT_HOME=/usr/share/java/apache-ant
CATALINA_HOME=/usr/share/java/apache-tomcat
ECLIPSE_HOME=$HOME/usr/local/eclipse
HADOOP_HOME=$HOME/usr/local/hadoop
JAVA_HOME=/opt/java
MAVEN_HOME=/opt/maven
PYTHONPATH=$HOME/usr/local/lib/python2.7/site-packages
R_HOME=/usr/lib/R

export ANDROID_HOME ANT_HOME CATALINA_HOME ECLIPSE_HOME HADOOP_HOME JAVA_HOME MAVEN_HOME PYTHONPATH R_HOME

export PATH=$HOME/usr/local/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANT_HOME/bin:$CATALINA_HOME/bin:$ECLIPSE_HOME:$HADOOP_HOME/bin:$JAVA_HOME/bin:$MAVEN_HOME/bin:$R_HOME/bin:$PATH

export LD_LIBRARY_PATH=$HOME/usr/local/lib:$LD_LIBRARY_PATH

export CLASSPATH=$(find $HOME/usr/local/jars -type f -name "*.jar" -printf "%p:\n" | sort -u | tr -d '\n')$CLASSPATH

source $HOME/.bashrc

# eval `keychain [--noask] --eval [--agents ssh] id_rsa` || exit 1
# eval `keychain --eval id_rsa`
