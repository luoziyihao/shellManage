#!/bin/bash
#
# description: Apache app init script
# processname: app  
# chkconfig: 234 20 80  
#
#
# Copyright (C) 2014 Miglen Evlogiev
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of  MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Initially forked from: gist.github.com/valotas/1000094
# Source: gist.github.com/miglen/5590986

#Location of JAVA_HOME (bin files)
export JAVA_HOME=/usr/local/share/jvm/jdk1.8/jdk1.8.0_73
export JAVA_OPTS="-Dfile.encoding=UTF-8 \
  -Djava.security.egd=file:/dev/./urandom
  -XX:+UseConcMarkSweepGC \
  -XX:+CMSClassUnloadingEnabled \
  -XX:+UseParNewGC \
  -XX:MaxPermSize=256m \
  -Xms256m -Xmx512m"
 
#Add Java binary files to PATH
export PATH=$JAVA_HOME/bin:$PATH
 
#APP_HOME is the location of the bin files of app  
export APP_HOME=/usr/share/app  
export JAR=
 
#GREP_KEY is the location of the configuration files of this instance of app
export GREP_KEY=/usr/share/app
 
#RUN_USER is the default user of app
export RUN_USER=jenkins

# other var
export ANDROID_HOME=/data/java/android-sdk/
export JENKINS_HOME=/data/jenkins
 
#APP_USAGE is the message if this script is called without any options
APP_USAGE="Usage: $0 {\e[00;32mstart\e[00m|\e[00;31mstop\e[00m|\e[00;31mkill\e[00m|\e[00;32mstatus\e[00m|\e[00;31mrestart\e[00m}"
 
#SHUTDOWN_WAIT is wait time in seconds for java proccess to stop
SHUTDOWN_WAIT=20
 
app_pid() {
        echo `ps -fe | grep $GREP_KEY | grep -v grep | tr -s " "|cut -d" " -f2`
}

app_run(){
    exec eval nohup java ${JAVA_OPTS} -jar ${JAR}
}

start() {
  pid=$(app_pid)
  if [ -n "$pid" ]
  then
    echo -e "\e[00;31mapp is already running (pid: $pid)\e[00m"
  else
    # Start app
    echo -e "\e[00;32mStarting app\e[00m"
    #ulimit -n 100000
    #umask 007
    #/bin/su -p -s /bin/sh $RUN_USER
        if [ `user_exists $RUN_USER` = "1" ]
        then
            if [ $(id -un)x != "${RUN_USER}"x ]
            then
                echo "execute user is not ${RUN_USER}, run as ${RUN_USER} "
                # sudo -u jenkins 
                /bin/su ${RUN_USER} -s /bin/bash -c app_run
            else
                app_run
            fi
        else
                echo -e "\e[00;31mapp user $RUN_USER does not exists. Starting with $(id)\e[00m"
                app_run
        fi
        status
  fi
  return 0
}
 
status(){
          pid=$(app_pid)
          if [ -n "$pid" ]
            then echo -e "\e[00;32mapp is running with pid: $pid\e[00m"
          else
            echo -e "\e[00;31mapp is not running\e[00m"
            return 3
          fi
}

terminate() {
	echo -e "\e[00;31mTerminating app\e[00m"
	kill -9 $(app_pid)
}

stop() {
  pid=$(app_pid)
  if [ -n "$pid" ]
  then
    echo -e "\e[00;31mStoping app\e[00m"
    #/bin/su -p -s /bin/sh $RUN_USER
        sh $APP_HOME/bin/shutdown.sh
 
    let kwait=$SHUTDOWN_WAIT
    count=0;
    until [ `ps -p $pid | grep -c $pid` = '0' ] || [ $count -gt $kwait ]
    do
      echo -n -e "\n\e[00;31mwaiting for processes to exit\e[00m";
      sleep 1
      let count=$count+1;
    done
 
    if [ $count -gt $kwait ]; then
      echo -n -e "\n\e[00;31mkilling processes didn't stop after $SHUTDOWN_WAIT seconds\e[00m"
      terminate
    fi
  else
    echo -e "\e[00;31mapp is not running\e[00m"
  fi
 
  return 0
}
 
user_exists(){
        if id -u $1 >/dev/null 2>&1; then
        echo "1"
        else
                echo "0"
        fi
}
 
case $1 in
	start)
	  start
	;;
	stop)  
	  stop
	;;
	restart)
	  stop
	  start
	;;
	status)
		status
		exit $?  
	;;
	kill)
		terminate
	;;		
	*)
		echo -e $APP_USAGE
	;;
esac    
exit 0
