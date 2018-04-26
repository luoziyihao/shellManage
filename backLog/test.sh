#/bin/sh
# expr 数字计算类型 获取子串 子串长度
# 外部命令 ``
# 空格敏感
   checkStr='2011txt.555'
   subcheckstr=${checkStr##*txt.}
 
   i=7
   let i+=1
   let i=i+1

   i3=`expr length ${checkStr} + 1`
   i2=`expr length ${checkStr}`

   echo ${i}
   echo ${i2}
   echo ${i3}

  i4=`expr substr $checkStr 1 4`
  echo $i4 

  i5=$(((i4+1)*2))
  echo $i5

  timeup=20
  timedown=10
  timestr=9
  timecompare=$((timestr <= timeup && timestr >= timedown))

  if  test $timecompare
      then
        echo "timecopare" $timecompare
    fi


testction()
{
echo $1
echo $2
}

testction "test1" "test2"

#test 
#1 test cmd cmd的退出结果是否为真 一般如果正常结束均为真 
#i6=
#echo $i6
i6="001"
i7="012"
i8=`echo $i6 $i7|awk '{print($1<$2)}'`
echo $i8
echo $i6 $i7|awk '{if($1<$2){print $1" xiaoyu "$2}else{print $1" dayu "$2}}'
#
#if test ``then
#    echo "dayu1"
#else
#    echo "not dayu1"
#fi

#2 test 各种参数 可比较整数大小 字符串是否相等，是否为空
#另外 $(()) 或者 expr 也可以比较 整数
    
if test 11 -ge 12
then
    echo "dayu2"
else
    echo "not dayu2"
fi
