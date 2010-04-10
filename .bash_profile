#!/bin/bash

set -o emacs

export PS1="[\!] \u@\h:\w $ "
export SHELL=/bin/bash
export EDITOR=emacsclient

ANDROID_HOME=$HOME/local/android-sdk
ANT_HOME=$HOME/local/apache-ant
CATALINA_HOME=$HOME/local/apache-tomcat
JAVA_HOME=/usr/lib/jvm/java-6-openjdk
MAVEN_HOME=$HOME/local/apache-maven

export ANDROID_HOME ANT_HOME CATALINA_HOME JAVA_HOME MAVEN_HOME

export PATH=$HOME/local/bin:$ANDROID_HOME/tools:$ANT_HOME/bin:$CATALINA_HOME/bin:$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH

#export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

#export MANPATH=$HOME/local/doc/man:$MANPATH

#CVSROOT=":pserver:phua@aleph0:/cvsroot/trunk"
#CVS_RSH="ssh"
#export CVSROOT CVS_RSH
#SVNROOT="svn://phua@aleph0/trunk"
#SVN_EDITOR="emacsclient"
#export SVNROOT SVN_EDITOR

if [ -f $HOME/.Xdefaults ]; then
    /usr/bin/xrdb -merge $HOME/.Xdefaults
fi

if [ -f $HOME/.xmodmap ]; then
    /usr/bin/xmodmap $HOME/.xmodmap
fi
