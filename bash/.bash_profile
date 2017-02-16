#!/bin/bash

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
/usr/bin/ibus-daemon --xim -dr &

export ANACONDA_HOME=$HOME/local/anaconda3
export ANDROID_HOME=$HOME/local/android-sdk-linux
export ANT_HOME=/usr/share/apache-ant
export ANT_CONTRIB_HOME=$HOME/local/ant-contrib
export CPAN_HOME=$HOME/perl5
export ECLIPSE_HOME=$HOME/local/eclipse
export HADOOP_HOME=$HOME/local/hadoop
export JAVA_HOME=/usr/lib/jvm/default
export JVMSTAT_HOME=$HOME/local/jvmstat
export JVMSTAT_JAVA_HOME=$JAVA_HOME
# export PERL5_HOME=$HOME/perl5
# export PYTHON_HOME=/usr
# export R_HOME=/usr/lib/R
export SOLARISSTUDIO_HOME=$HOME/local/SolarisStudio

# export PATH=$HOME/.local/bin:$PATH # Gunicorn
# export PATH=$PERL5_HOME/bin:$PYTHON_HOME/bin:$R_HOME/bin:$PATH
export PATH=$HOME/local/bin:$ANACONDA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH:$ANT_HOME/bin:$CPAN_HOME/bin:$ECLIPSE_HOME:$HADOOP_HOME/bin:$JAVA_HOME/bin:$JVMSTAT_HOME/bin:$SOLARISSTUDIO_HOME/bin:$PATH

export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

export INFOPATH=$HOME/local/share/info:$INFOPATH

export MANPATH=$HOME/local/share/man:$MANPATH

export GTAGSCONF=$HOME/local/global/gtags.conf
# export GTAGSLIBPATH=$HOME/workspaces
export LESSGLOBALTAGS=global

export GOPATH=$HOME/workspaces/go

export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

# export PYTHONPATH=$HOME/.local/lib/python3.6/site-packages:/usr/lib/python3.6/site-packages

source $HOME/.bashrc

eval `/usr/bin/keychain --eval --agents ssh,gpg ~/.ssh/id_rsa KEYS`

ulimit -c unlimited
umask 077

stty -ixon
