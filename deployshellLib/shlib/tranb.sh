#! /bin/sh
#必须到脚本的当前目录下执行
#如果是当前目录 ./aa 或者 aa    x传递的是文件名
#如果是其他相对目录 则传递的是相对目录字符串
#如果是 home 目录 传递的是绝对目录

#其实传递的一直是路径 只不过shell会自动根据需要给 变量赋成文件类型或字符串类型
#文件类型是不会错的，字符串类型是去的文件相对路径， 就会有问题， 所以要用到 x 变量做文件名时  应该先取文件名 ${},即shell里面的
#模式匹配运算符

#当前工作目录是执行命令环境下的,pwd命令的输出目录,不是脚本的目录
#执行时是在当前工作目录搜索这些文件，不是在文件所在的目录搜索这些文件
mkdir -p ./newsh
echo "" >tbtmp
backupinit="echo \"backup package start ... ...\""
backupend="echo \"backup package end.\""
basepath=$(cd `dirname $0`; pwd)
basepath=$basepath/transhlib
for x
do 
        #sed, awk 处理逻辑 ， 将处理结果存入临时文件
        sed -f $basepath/rmspace.sed $x |awk -f $basepath/tranbackup.awk -f $basepath/awkfun.awk

        #sh追加处理结果到目的文件
        echo $backupinit > tbtmp
        sort ./mkbackdir.sh|uniq >>tbtmp
        cat ./cpfile.sh >> tbtmp
        echo $backupend >> tbtmp
        #去空行
        #sed "/^$/d" tbtmp > ./newsh/${x##*/}
        sed "/^$/d" tbtmp > ./newsh/backup_IT02.sh
        sed "/^$/d" tbtmp > ./newsh/backup_FT02.sh

done

rm ./tbtmp
rm ./mkbackdir.sh
rm ./cpfile.sh
