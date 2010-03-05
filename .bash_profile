#!/bin/bash

# See also: .bashrc, .bash_aliases, .screenrc

set -o emacs

export PS1="\u@\h:\w $ "
export SHELL=/bin/bash
export EDITOR=emacsclient
export LESS_OPEN="| tar --to-stdout -xfz %s"

ANDROID_HOME=$HOME/local/android-sdk
ANT_HOME=$HOME/local/apache-ant
CATALINA_HOME=$HOME/local/apache-tomcat
JAVA_HOME=/usr/lib/jvm/java-6-openjdk
MAVEN_HOME=$HOME/local/apache-maven

export ANDROID_HOME ANT_HOME CATALINA_HOME JAVA_HOME MAVEN_HOME

export PATH=$ANDROID_HOME/tools:$ANT_HOME/bin:$CATALINA_HOME/bin:$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH
export PATH=$HOME/local/bin:$PATH

export LD_LIBRARY_PATH=$HOME/local/lib:$PATH

#export MANPATH=$HOME/local/doc/man:$MANPATH

#CVSROOT=":pserver:user@host:/cvsroot/trunk"
#CVS_RSH="ssh"
#export CVSROOT CVS_RSH
#SVNROOT="file:///var/repos"
#SVNROOT="svn://user@host/trunk"
#SVN_EDITOR="emacsclient"
#export SVNROOT SVN_EDITOR

/usr/bin/xrdb -merge ~/.xinitrc
/usr/bin/xmodmap ~/.xmodmap