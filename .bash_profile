ANDROID_HOME=$HOME/local/android-sdk
ANT_HOME=/usr/share/java/apache-ant
CATALINA_HOME=/usr/share/java/apache-tomcat
JAVA_HOME=/opt/java
MAVEN_HOME=/opt/maven

export ANDROID_HOME ANT_HOME CATALINA_HOME JAVA_HOME MAVEN_HOME
export PATH=$ANDROID_HOME/tools:$ANT_HOME/bin:$CATALINA_HOME/bin:$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH

export EDITOR=emacsclient
export MAIL=/var/spool/mail/phua
export PAGER=less
export TERM=rxvt-unicode

source $HOME/.bashrc
source $HOME/.bash_aliases
