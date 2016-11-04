#########################################################################
# File Name: getTodayCatalina.sh
# Author: raoxiang
# mail: xiangrao@qilin99.com
# Created Time: 2016-08-10
#########################################################################
#!/bin/bash
tail -n 3000000 /data/log/tomcat/catalina.out | awk -F "[ \t][ \t]*" 'BEGIN {start=strftime("%Y-%m-%d",mktime(strftime("%Y %m %d %H %M %S"))-3600*24*0); end=strftime("%Y-%m-%d", systime())} {if(($1 >= start && $1 <= end) && ($2 >= "00:00:00,000" && $2 <= "24:00:00,000")) {print $0}}' > "/tmp/"$(date -d today "+%Y-%m-%d")".catalina.out"
