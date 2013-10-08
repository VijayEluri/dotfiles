#!/bin/bash

set -o emacs

export EDITOR="/usr/bin/emacsclient -t"
export HISTCONTROL=ignoreboth
export HISTFILESIZE=65535
export HISTSIZE=65535
export LESSGLOBALTAGS=global
export MAIL=$HOME/Mail
# export PAGER=most
export SUDO_EDITOR="/usr/bin/emacsclient -t"
export VISUAL="/usr/bin/emacsclient -t"

shopt -s cdspell checkjobs checkwinsize dirspell extdebug globstar histappend

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

export ABCL_HOME=$HOME/usr/local/abcl
export ANDROID_HOME=$HOME/usr/local/android-sdk
export ANT_HOME=/usr/share/apache-ant
export CATALINA_HOME=/usr/share/java/apache-tomcat
export ECLIPSE_HOME=$HOME/usr/local/eclipse
export HADOOP_HOME=$HOME/usr/local/hadoop
export JAVA_HOME=/usr
export JAVACC_HOME=$HOME/usr/local/javacc
export MAVEN_HOME=/opt/maven
export R_HOME=/usr/lib/R

export PATH=$HOME/usr/local/bin:$ABCL_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANT_HOME/bin:$CATALINA_HOME/bin:$ECLIPSE_HOME:$HADOOP_HOME/bin:$JAVA_HOME/bin:$JAVACC_HOME/bin:$MAVEN_HOME/bin:$R_HOME/bin:$PATH

# export CFLAGS="-Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -g -v"
# export CPATH=
# export C_INCLUDE_PATH=$HOME/usr/local/include
# export CPLUS_INCLUDE_PATH=$HOME/usr/local/include
# export LIBRARY_PATH=$HOME/usr/local/lib
# export LD_LIBRARY_PATH=$HOME/usr/local/lib:$LD_LIBRARY_PATH

export PYTHONPATH=$HOME/usr/local/lib/python2.7/site-packages

export CLASSPATH=$(find $HOME/usr/local/jars/ -type f -name "*.jar" -printf "%p:\n" | sort -u | tr -d '\n')$CLASSPATH

source $HOME/.bashrc

# eval `/usr/bin/keychain --clear --eval --agents ssh,gpg ~/.ssh/id_ecdsa KEYS`
