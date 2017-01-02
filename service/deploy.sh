#!/bin/bash

# how to use it
# ./deploy.sh usage PROJECT_PATH WEB_MODULE
# usage: start|stop|restart|force-reload|status|run

# how to use it for executing by root, but run by 'user'
# sudo -u 'your user' ./deploy.sh usage PROJECT_PATH WEB_MODULE

# todo 1 surpport symlinks
# todo 2 support lib back and rollback

# cmd condition, rm the comment and run once  time, then comment it
#RUN_USER=$(id -un)
#export LOG_FOLDER="/var/log/${RUN_USER}/"
#export PID_FOLDER="/var/run/${RUN_USER}/"
#sudo mkdir -p ${LOG_FOLDER}
#sudo mkdir -p ${PID_FOLDER}
#sudo chown -R $(id -un) ${LOG_FOLDER}
#sudo chown -R $(id -un) ${PID_FOLDER}

# project path
PROJECT_PATH=${2}
WEB_MODULE=${3}
if [ "${PROJECT_PATH}"x = ""x ]
then
    PROJECT_PATH=$(pwd)
fi

# find jar path
JAR=$(find ${PROJECT_PATH}"/"${WEB_MODULE}"/target" -maxdepth 1| sed '/.jar$/!d' |head -n 1)
if [ "${JAR}"x = ""x ]
then
    echo "jar's path error"
    exit
else
    echo "jar's path=${JAR}"
fi

# environment path for app service
export JAVA_HOME="/usr/local/share/jvm/jdk1.8/jdk1.8.0_73"
export JAVA_OPTS="-Dfile.encoding=UTF-8 \
  -Djava.security.egd=file:/dev/./urandom
  -XX:+UseConcMarkSweepGC \
  -XX:+CMSClassUnloadingEnabled \
  -XX:+UseParNewGC \
  -XX:MaxPermSize=256m \
  -Xms256m -Xmx512m"
# get the execute user
RUN_USER=$(id -un)
export LOG_FOLDER="/var/log/${RUN_USER}/"
export PID_FOLDER="/var/run/${RUN_USER}/"
export MODE="service"
export USE_START_STOP_DAEMON="false" # let service to be daemon process

# start app
USAGE=${1}
if [ "${USAGE}"x = ""x ]
then
    USAGE="restart"
fi
${JAR} ${USAGE}
${JAR} status
sleep 2
exit 0
echo "deploy end"
