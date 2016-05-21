#!/bin/sh
# deploy ctrade for test

GREP=/bin/grep
PS=/bin/ps
RM=/bin/rm
KILL=/bin/kill
AWK=/bin/awk
ECHO=/bin/echo
SH=/bin/sh
TOMCAT_PROCESS="org.apache.catalina.startup.Bootstrap"

TOMCAT="/opt/apache-tomcat-8.0.30/"
BIN=${TOMCAT}"/bin"
WEB_APPS=${TOMCAT}"/webapps"
SRC="/data/git/src/"
DEPLOY_PROJECT="ctrade2"
DEPLOY_PROJECT_WAR=${SRC}"/ctrade2/ctrade/target/ctrade-1.0-test.war"

FILE_LOCK_DIR_PATH="/tmp/filelock"
CTRADE_FILE_LOCK=${FILE_LOCK_DIR_PATH}"/ctrade.lock"
FILE_LOCK=${CTRADE_FILE_LOCK}

CTRADEWAR_NAME="ctrade"
WAR_NAME=${CTRADEWAR_NAME}

# 根据进程名杀掉所有对应进程
kill_process(){
    process_name=${1}
    if [ "${process_name}"x = ""x ]
    then
        echo "process name in null space"
        return 1
    fi

    while true
    do
        # find server PID
        PID=`${PS} -ef | ${GREP} -E ${process_name}|${GREP} -v "grep"|head -n 1|awk '{print $2}'`
        if [ "$PID" != "" ];
        then
            echo "kill process "${process_name}" on pid "${PID}
            ${KILL} -s 9 ${PID}
            sleep 2
        else
            echo "kill "${process_name}" over"
            break
        fi
    done
    return 0
}

deploy_lock(){
    # create lock dir
    if [ ! -d "${FILE_LOCK_DIR_PATH}" ]; then
      mkdir -p "${FILE_LOCK_DIR_PATH}"
    fi
    # make file lock 
    touch ${FILE_LOCK}
}

deploy_unlock(){
    # unlock FILE_LOCK
    rm -rf ${FILE_LOCK}
}

mvn_build_cmd(){
    /usr/bin/mvn clean package -P test -Dmaven.test.skip=true
}

mvn_build(){
   # 如果命令执行成功 返回为 0  shell以为真 这里刚好是二进制比较相等
   if ! mvn_build_cmd
    then 
        deploy_unlock
        echo "mvn build failded. Please checkout the code, then deploy again."
        exit
   fi 
}

# detect file lock
if [ -e "${FILE_LOCK}" ]; then
    echo  " someone is deploy  ${WAR_NAME}. Please wait for a minute and try again"
    exit
else 
    deploy_lock
fi

echo  "start to deploy ctrade."
# deploy
echo "start pull..."
cd ${SRC}""${DEPLOY_PROJECT}
git pull
echo "package start..."
mvn_build
echo "start..."
cp ${DEPLOY_PROJECT_WAR} ${WEB_APPS}"/"${WAR_NAME}".war"
echo "kill tomcat --------------------------------------------------"
# ${SH} ${BIN}"/shutdown.sh"
# kill serveral tomcat process
kill_process ${TOMCAT_PROCESS}
echo "kill tomcat end --------------------------------------------------"
sleep 3
${SH} ${BIN}"/startup.sh"
sleep 3



deploy_unlock
echo "done..."
