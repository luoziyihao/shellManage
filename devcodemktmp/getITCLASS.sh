#!/bin/sh
#cat shengchanend.txt.tmp |xargs echo ${${1}%\/*} 
#cat shengchanend.txt.tmp |xargs print ${${1}%\/*}|mkdir -p
basepath=$(cd `dirname $0`; pwd)
basepath=$basepath/transhlib
awk -f $basepath/getParentPathDir.awk  -f $basepath/awkfun.awk < $1 |sort |uniq > ./mkITdirTmp

#É¾³ýÄ¿Â¼
rm -rf config
rm -rf classes 

#sh ./mkITdirTmp
less ./mkITdirTmp
less ./cpTmp
#sh ./cpTmp


