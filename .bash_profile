#!/bin/bash

set -o emacs

shopt -s cdspell checkjobs checkwinsize dirspell extdebug globstar histappend
# shopt -s huponexit

# export DISPLAY=:0.0
export EDITOR="/usr/bin/emacsclient -t"
export HISTCONTROL=ignoreboth
export HISTFILE=$HOME/.bash_history
export HISTFILESIZE=65535
export HISTSIZE=65535
export MAIL=$HOME/Mail
# export PAGER=most
export SUDO_EDITOR=$EDITOR
export TERM="rxvt-unicode-256color"
export VISUAL=$EDITOR

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
# /usr/bin/ibus-daemon --xim &

export ABCL_HOME=$HOME/local/abcl
export ANDROID_HOME=$HOME/local/android-sdk-linux
export ANT_HOME=/usr/share/apache-ant
export ANT_CONTRIB_HOME=$HOME/local/ant-contrib
export CATALINA_HOME=/usr/share/java/apache-tomcat
export ECLIPSE_HOME=$HOME/local/eclipse
export HADOOP_HOME=$HOME/local/hadoop
export JAVA_HOME=/usr/lib/jvm/default
export JAVACC_HOME=$HOME/local/javacc
export JVMSTAT_HOME=$HOME/local/jvmstat
export JVMSTAT_JAVA_HOME=$JAVA_HOME
export PYTHON_HOME=/usr
export R_HOME=/usr/lib/R
export SOLARISSTUDIO_HOME=$HOME/local/SolarisStudio

export PATH=$HOME/local/bin:$ABCL_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANT_HOME/bin:$CATALINA_HOME/bin:$ECLIPSE_HOME:$HADOOP_HOME/bin:$JAVA_HOME/bin:$JAVACC_HOME/bin:$JVMSTAT_HOME/bin:$R_HOME/bin:$SOLARISSTUDIO_HOME/bin:$PATH

export INFOPATH=$HOME/local/share/info:$INFOPATH

export MANPATH=$HOME/local/share/man:$MANPATH

export GTAGSCONF=$HOME/local/global/gtags.conf
# export GTAGSLIBPATH=$HOME/workspaces/forks/linux-torvalds
export LESSGLOBALTAGS=global

# export CFLAGS="-Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -g -v"
# export CPATH=
# export C_INCLUDE_PATH=$HOME/local/include
# export CPLUS_INCLUDE_PATH=$HOME/local/include
# export LIBRARY_PATH=$HOME/local/lib
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

# export CLASSPATH=$(find $HOME/local/jars/ -type f -name "*.jar" -printf "%p:\n" | sort -u | tr -d '\n')$CLASSPATH

export PYTHONPATH=$HOME/local/lib/python2.7/site-packages:/usr/lib/python2.7/site-packages

source $HOME/.bashrc

eval `/usr/bin/keychain --clear --eval --agents ssh,gpg ~/.ssh/id_ecdsa KEYS`

umask 077
ulimit -c unlimited

# stty -ixon -tabs erase '^H'
