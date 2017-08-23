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

# get ps_info
ps_info=`ps -elf |grep -v "ks" |grep -v "kills.sh"| grep -i ${PROCESS_NAME}|grep -v "grep"`
echo "ps_info=${ps_info}"

# kill
echo ${ps_info} | awk '{print($4)}'|xargs -i kill -9 {}

# get ps_info
ps_info=`ps -elf |grep -v "ks" |grep -v "kills.sh"| grep -i ${PROCESS_NAME}|grep -v "grep"`
echo "new ps_info=${ps_info}"

echo "kill done "
