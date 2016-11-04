#!/bin/bash

#同步历史统计日志到CMS

log_date=`date --date="$1 days ago" +%Y-%m-%d`
dst_file=/data/log/tomcat/ctrade_statistics.log.$log_date
/bin/rm -f $dst_file
for ((i=1; i<=2; i++))
do
    src_file=root@web$i.qilin99.com.in:/data/log/tomcat/ctrade_statistics.log.$log_date
    /bin/touch $dst_file.tmp
    /usr/bin/scp $src_file $dst_file.tmp
    /bin/cat $dst_file.tmp >> $dst_file
    /bin/rm -f $dst_file.tmp
done
