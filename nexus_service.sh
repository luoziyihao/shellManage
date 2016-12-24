#########################################################################
# File Name: nexus_start.sh
# Author: raoxiang
# mail: xiangrao@qilin99.com
# Created Time: 2016-12-24
#########################################################################
#!/usr/bin/env bash

# export JAVA_HOME="/usr/local/share/jvm/jdk1.8/jdk1.8.0_73"
export JAVA_HOME="/usr/local/share/jvm/jdk1.8.0_101"
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$PATH

# Usage: ./nexus_service.sh {start|stop|run|run-redirect|status|restart|force-reload}
/usr/local/share/nexus/nexus-3.2.0-01/bin/nexus ${1}

