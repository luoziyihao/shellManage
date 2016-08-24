#########################################################################
# File Name: getLog.sh
# Author: raoxiang
# mail: xiangrao@qilin99.com
# Created Time: 2016-08-10
#########################################################################
#!/bin/bash

YESTERDAY=$(date -d "1 days ago" +%Y-%m-%d)
TODAY=$(date -d today "+%Y-%m-%d")

ssh root@cms.qilin99.com "/bin/bash /root/getLatestCatalina.sh"

sleep 3

scp "root@cms.qilin99.com:/tmp/"$(date -d today "+%Y-%m-%d")".catalina.out" ./
