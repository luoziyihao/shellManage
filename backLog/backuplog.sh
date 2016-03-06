#!/bin/sh
#存储空间日志的清理
#日志空间日志的清理注掉
SLEEPTIME=5
log_ram_dir="D:/raoxiangMM/Doc/log/BPETServer_DEV2"
working_dir="D:/raoxiangMM/Doc/log/GCMSLogBak/"

timefilter(){
   checkStr=$1 
   timeup=$2
   timedown=$3 
   subcheckstr=${checkStr##*.txt.}
   substart=`expr length $subcheckstr - 1`
   subend=`expr length $subcheckstr`
   timestr=`expr substr $subcheckstr $substart $subend` 
   timecompare=`echo $timeup $timedown $timestr|awk '{print($3<= $1&& $3>= $2)}'`
}

backuplog_process(){

    mkdir -p $working_dir
    cd ${log_ram_dir}

    for i in *
    do
        #IT备份策略
        #1 日志类型 prdTaskLog alllog.txt
        #2 日志时间 07--24 
        #3 日志大小 
        case $i in 
            alllog.txt* | prdTaskLog.txt*)

                case $i in 
                    alllog.txt | prdTaskLog.txt)
                    continue 
                esac

                timefilter $i 24 7
                if test $timecompare -eq 1
                then
                    cp -rf ${log_ram_dir}/$i ${working_dir}
                fi
        esac
        rm -rf ${log_ram_dir}/$i
    done    
}

while true 
do
   let timescount+=1
   echo "run times " ${timescount} " ."

   backuplog_process
   sleep ${SLEEPTIME} 
done
