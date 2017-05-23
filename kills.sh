
#########################################################################
# File Name: kills.sh
# Author: raoxiang
# mail: xiangrao@qilin99.com
# Created Time: 2016-12-15
#########################################################################
#!/bin/bash
# "" 表示 str, 里面可以写命令  '' 会强制转义
PROCESS_NAME="${1}"
echo ${PROCESS_NAME}
sudo ps -elf |grep -v 'ps' | grep -i ${PROCESS_NAME}|awk '{print($4)}'|xargs -i sudo kill -9 {}
