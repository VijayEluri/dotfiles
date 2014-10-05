#!/bin/bash

set -o emacs

# export DISPLAY=:0.0
export EDITOR="/usr/bin/emacsclient -t"
export HISTCONTROL=ignoreboth
export HISTFILE="$HOME/.bash_history"
export HISTFILESIZE=65535
export HISTSIZE=65535
export LESSGLOBALTAGS=global
export MAIL=$HOME/Mail
# export PAGER=most
# export SUDO_EDITOR="/usr/bin/emacsclient -t"
# export TERM="rxvt-unicode-256color"
# export VISUAL="/usr/bin/emacsclient -t"

shopt -s cdspell checkjobs checkwinsize dirspell extdebug globstar histappend

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

export ABCL_HOME=$HOME/local/abcl
export ANDROID_HOME=$HOME/local/android-sdk
export ANT_HOME=/usr/share/apache-ant
export CATALINA_HOME=/usr/share/java/apache-tomcat
export ECLIPSE_HOME=$HOME/local/eclipse
export HADOOP_HOME=$HOME/local/hadoop
export JAVA_HOME=/usr
export JAVACC_HOME=$HOME/local/javacc
export JVMSTAT_HOME=$HOME/local/jvmstat
export JVMSTAT_JAVA_HOME=$JAVA_HOME
export PYTHON_HOME=/usr
export R_HOME=/usr/lib/R
export SOLARISSTUDIO_HOME=$HOME/local/SolarisStudio

export PATH=$HOME/local/bin:$ABCL_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANT_HOME/bin:$CATALINA_HOME/bin:$ECLIPSE_HOME:$HADOOP_HOME/bin:$JAVA_HOME/bin:$JAVACC_HOME/bin:$MAVEN_HOME/bin:$R_HOME/bin:$PATH

export INFOPATH=$HOME/local/share/info:$INFOPATH
export MANPATH=$HOME/local/share/man:$MANPATH

# AUTOCONF AUTOMAKE BINUTILS CMAKE COREUTILS GCC GDB GNUMAKE
# export CFLAGS="-Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -g -v"
# export CPATH=
# export C_INCLUDE_PATH=$HOME/local/include
# export CPLUS_INCLUDE_PATH=$HOME/local/include
# export LIBRARY_PATH=$HOME/local/lib
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

export PYTHONPATH=$HOME/local/lib/python2.7/site-packages

export CLASSPATH=$(find $HOME/local/jars/ -type f -name "*.jar" -printf "%p:\n" | sort -u | tr -d '\n')$CLASSPATH

# export WORKSPACE=$HOME/workspaces
# export GTAGSLIBPATH=$WORKSPACE/java/HelloWorld

source $HOME/.bashrc

eval `/usr/bin/keychain --clear --eval --agents ssh,gpg ~/.ssh/id_ecdsa KEYS`

umask 077
# ulimit -c unlimited
# stty -ixon
