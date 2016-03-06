BEGIN{
   FS="[ \t][ \t]*" 
   #OFS="\t"
    }

NR==FNR{
    #第一个文件是 生产全量错误码 
   a[$1]=$3
    }

NR>FNR{
    #第二个文件时 核心资产全量错误码
    #第二次是找出核心资产全量生产上没有的部分  然后批量插入
    if(length(a[$1]) == 0){
            temp=temp $1 "\t\t" $2 "\n" 
        }
    }
END{
   print temp > "needError.txt"
   print "work success !" 
    }
