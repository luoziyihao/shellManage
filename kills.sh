#!/bin/bash
#########################################################################
# File Name: kills.sh
# Author: raoxiang
# mail: xiangrao@qilin99.com
# Created Time: 2016-12-15
#########################################################################
# "" 表示 str, 里面可以写命令  '' 会强制转义
PROCESS_NAME="${1}"
echo "start kill ${PROCESS_NAME}"

find_ps_info(){
    # get ps_info
    ps_info=`ps -ef |grep -v "ks" |grep -v "kills.sh"| grep -i ${PROCESS_NAME}|grep -v "grep"`
    echo "ps_info=${ps_info}"
}

ks(){
    # kill
    echo ${ps_info} | awk '{print($2)}'|xargs -i kill -9 {}
}

for i in $( seq 1 20 )
do
    find_ps_info
    if [ "${ps_info}x" != "x" ]
    then
        ks
        echo -e "kill ${i} times\n"
        sleep 1
    else
        break
    fi
done

echo "kill done "
